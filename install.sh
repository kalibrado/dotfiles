import os
import subprocess

if 'which code'.strip():
    code_extensions = sorted(subprocess.getoutput('cat code_extensions').splitlines())
    installed_extensions = sorted(subprocess.getoutput('code-server --list-extensions').splitlines())
    uninstalled_extensions = list(set(code_extensions) - set(installed_extensions))
    print('Checking for uninstalled VSCode extensions...')
    if not uninstalled_extensions:
        print("all good!\r\n")
    else:
        print(f"found {len(uninstalled_extensions)}.\r\n")
        for extension in uninstalled_extensions:
            print(f"Installing {extension}...")#!/bin/bash

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
