#!/bin/bash

function start {
    
    
    # Visual Studio Code :: Package list
    pkglist=(
        aaron-bond.better-comments
        alexcvzz.vscode-sqlite
        batisteo.vscode-django
        castello-dev.bash-snippets
        christian-kohler.npm-intellisense
        coder.coder-remote
        DavidAnson.vscode-markdownlint
        dbaeumer.vscode-eslint
        donjayamanne.githistory
        DotJoshJohnson.xml
        eamodio.gitlens
        ecmel.vscode-html-css
        esbenp.prettier-vscode
        expo.vscode-expo-tools
        felipecaputo.git-project-manager
        foxundermoon.shell-format
        george-alisson.html-preview-vscode
        GitHub.codespaces
        github.vscode-github-actions
        GitHub.vscode-pull-request-github
        GrapeCity.gc-excelviewer
        rpinski.shebang-snippets
        lizebang.bash-extension-pack
        rogalmic.bash-debug
        shakram02.bash-beautify
        mads-hartmann.bash-ide-vscode
        mechatroner.rainbow-csv
        MS-CEINTL.vscode-language-pack-fr
        KevinRose.vsc-python-indent
        donjayamanne.python-environment-manager
        donjayamanne.python-extension-pack
        ms-python.black-formatter
        ms-python.flake8
        ms-python.isort
        ms-python.mypy-type-checker
        ms-python.pylint
        ms-python.python
        ms-python.vscode-pylance
        Mukundan.python-docs
        tushortz.python-extended-snippets
        ms-toolsai.jupyter-keymap
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode-remote.remote-wsl
        ms-vscode.remote-explorer
        ms-vscode.cpptools
        ms-vscode.cpptools-extension-pack
        ms-vscode.cpptools-themes
        ms-vscode.live-server
        ms-vscode.test-adapter-converter
        hbenl.vscode-test-explorer
        Postman.postman-for-vscode
        redhat.vscode-yaml
        sidthesloth.html5-boilerplate
        timonwong.shellcheck
        VisualStudioExptTeam.intellicode-api-usage-examples
        VisualStudioExptTeam.vscodeintellicode
        vscode-icons-team.vscode-icons
        WallabyJs.quokka-vscode
        wholroyd.jinja
        yy0931.save-as-root
        yzhang.markdown-all-in-one
        Zignd.html-css-class-completion
        ms-python.python
        vscodevim.vim
        letmaik.git-tree-compare
        donjayamanne.githistory
        eamodio.gitlens
        equinusocio.vsc-material-theme-icons
        github.github-vscode-theme
        oderwat.indent-rainbow
        christian-kohler.path-intellisense
        mhutchie.git-graph
        Gruntfuggly.todo-tree
        hediet.vscode-drawio
        github.vscode-pull-request-github
        marp-team.marp-vscode
        shuworks.vscode-table-formatter
        esbenp.prettier-vscode
        njpwerner.autodocstring
    )
    alias
    for i in ${pkglist[@]}; do
        /tmp/code-server/bin/code-server --install-extension $i
    done
    
    echo "Add Settings code-server"
    cp settings.json  /home/coder/.local/share/code-server/User
    
    echo 'alias code-server="/tmp/code-server/bin/code-server"' >> /home/coder/.bashrc
    echo "update"
    sudo apt-get -qq update
    echo "install -y nano git curl python3 python3-venv python3-pip"
    sudo apt-get -qq install -y nano git curl python3 python3-venv python3-pip
    echo "upgrade pip"
    pip install -q --upgrade pip
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    source /home/coder/.bashrc
    nvm install --lts
}
 

sleep 2m && start&
