function az-sql-firewall --description 'Add current IP and a calculated range to Azure SQL or Postgres firewall'
    # Validate that at least the 2 required parameters are passed
    if test (count $argv) -lt 2
        echo "Error: Missing required parameters."
        echo "Usage: az-sql-firewall <resource-group> <server-name> [--temp|-t] [--postgres|-p] [range-end-offset]"
        echo "Example (standard SQL): az-sql-firewall my-rg my-sql-server"
        echo "Example (Postgres temp + offset): az-sql-firewall my-rg my-postgres-server --postgres --temp 10"
        return 1
    end

    set -l resource_group $argv[1]
    set -l server_name $argv[2]
    
    # Initialize defaults
    set -l is_temp false
    set -l db_type "sql"
    set -l range_offset ""

    # 1. Parse optional parameters dynamically from the 3rd argument onwards
    if test (count $argv) -ge 3
        for arg in $argv[3..-1]
            switch $arg
                case --temp -t
                    set is_temp true
                case --postgres -p
                    set db_type "postgres"
                case '*'
                    # Check if the argument is a number (the offset)
                    if string match -qr '^[0-9]+$' -- $arg
                        set range_offset $arg
                    end
            end
        end
    end

    # 2. Fetch current public IP silently
    set -l current_ip (curl -s ifconfig.me)
    if test -z "$current_ip"
        echo "Error: Could not retrieve IP from ifconfig.me"
        return 1
    end
  
    echo "Your current IP is: $current_ip"

    # 3. Split IP octets to calculate the range
    set -l octets (string split '.' $current_ip)
    set -l last_octet $octets[4]
    set -l new_last_octet 255

    # 4. Handle optional offset parameter if parsed
    if test -n "$range_offset"
        set new_last_octet (math "$last_octet + $range_offset")
        
        # Ensure the upper bound does not exceed 255
        if test $new_last_octet -gt 255
            set new_last_octet 255
        end
        echo "Applying user-defined offset of +$range_offset"
    else
        echo "No offset provided. Defaulting to full remaining subnet range."
    end

    # Build the final ending IP string
    set -l end_ip "$octets[1].$octets[2].$octets[3].$new_last_octet"
    echo "Calculated firewall range: $current_ip - $end_ip"

    # 5. Define rule name based on the temp flag
    set -l timestamp (date +%Y%m%d-%H%M%S)
    set -l rule_name "Rule-$timestamp"
    
    if test "$is_temp" = "true"
        set rule_name "Temp-$timestamp"
        echo "Flag set: Creating a TEMPORARY firewall rule."
    else
        echo "Flag omitted: Creating a STANDARD firewall rule."
    end

    # 6. Execute Azure CLI command based on targeted DB type
    if test "$db_type" = "postgres"
        echo "Deploying firewall rule ($rule_name) to Azure Postgres (Flexible Server)..."
        az postgres flexible-server firewall-rule create \
            --resource-group $resource_group \
            --server-name $server_name \
            --name $rule_name \
            --start-ip-address $current_ip \
            --end-ip-address $end_ip
    else
        echo "Deploying firewall rule ($rule_name) to Azure SQL..."
        az sql server firewall-rule create \
            --resource-group $resource_group \
            --server $server_name \
            --name $rule_name \
            --start-ip-address $current_ip \
            --end-ip-address $end_ip
    end
end
