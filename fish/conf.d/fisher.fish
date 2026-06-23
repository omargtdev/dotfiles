set -gx fisher_path ~/.fisher

# Register the new paths so Fish natively loads them
set fish_function_path $fisher_path/functions $fish_function_path
set fish_complete_path $fisher_path/completions $fish_complete_path

# Safely source configuration snippets from the new location
for file in $fisher_path/conf.d/*.fish
    if test -f $file
        source $file
    end
end
