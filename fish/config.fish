# Commands to run in interactive sessions can go here
if status is-interactive
    # Recursively add all subdirectories of the functions folder to the autoload path
    set -l base_func_dir ~/.config/fish/functions

    # The double-star (**) glob recursively finds all directories. 
    # The trailing slash ensures it only matches directories, not files.
    for dir in $base_func_dir/**/
        # Trim the trailing slash for cleaner paths
        set -l clean_dir (string trim -r -c / "$dir")
        
        # Prepend the directory to fish_function_path if it isn't already there
        if test -d "$clean_dir"; and not contains "$clean_dir" $fish_function_path
            set -p fish_function_path "$clean_dir"
        end
    end
end
