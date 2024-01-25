#!/usr/bin/bash -i

set e
if command -v code-server &> /dev/null; then
    code_extensions=$(sort < code_extensions)
    installed_extensions=$(code-server --list-extensions | sort)
    uninstalled_extensions=$(comm -23 <(echo "$code_extensions") <(echo "$installed_extensions"))
    echo "Checking for uninstalled VSCode extensions..."
    if [ -z "$uninstalled_extensions" ]; then
        echo "all good!"
    else
        echo "found $(echo "$uninstalled_extensions" | wc -l)."
        while IFS= read -r extension; do
            echo "Installing $extension..."
            code-server --install-extension "$extension"
        done <<< "$uninstalled_extensions"
        echo "Done!"
    fi
fi
