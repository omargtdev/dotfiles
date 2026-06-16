function azfirewall --description 'Add current IP and a calculated range to Azure SQL firewall'
    # Validate that at least the 2 required parameters are passed
    if test (count $argv) -lt 2
        echo "Error: Missing required parameters."
        echo "Usage: azfirewall <resource-group> <server-name> [--temp|-t] [range-end-offset]"
        echo "Example (standard): azfirewall my-rg my-sql-server"
        echo "Example (temp + offset): azfirewall my-rg my-sql-server --temp 10"
        return 1
    end

    set -l resource_group $argv[1]
    set -l server_name $argv[2]
    
    # Initialize defaults
    set -l is_temp false
    set -l offset_arg_index 3

    # 1. Parse the optional 3rd parameter flag
    if test (count $argv) -ge 3
        if test "$argv[3]" = "--temp"; or test "$argv[3]" = "-t"
            set is_temp true
            set offset_arg_index 4
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

    # 4. Handle optional offset parameter based on index
    if test (count $argv) -ge $offset_arg_index
        set -l range_offset $argv[$offset_arg_index]
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

    # 6. Execute Azure CLI command
    echo "Deploying firewall rule ($rule_name) to Azure..."
    az sql server firewall-rule create \
        --resource-group $resource_group \
        --server $server_name \
        --name $rule_name \
        --start-ip-address $current_ip \
        --end-ip-address $end_ip
end
