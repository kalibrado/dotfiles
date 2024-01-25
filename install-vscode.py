import os
import subprocess

if 'which code'.strip():
    code_extensions = sorted(subprocess.getoutput('cat code_extensions').splitlines())
    installed_extensions = sorted(subprocess.getoutput('code --list-extensions').splitlines())
    uninstalled_extensions = list(set(code_extensions) - set(installed_extensions))
    print('Checking for uninstalled VSCode extensions...')
    if not uninstalled_extensions:
        print("all good!\r\n")
    else:
        print(f"found {len(uninstalled_extensions)}.\r\n")
        for extension in uninstalled_extensions:
            print(f"Installing {extension}...")
            subprocess.run(["code", "--install-extension", extension])
        print('Done!')