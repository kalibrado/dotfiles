#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

echo "Creating symlink to bash folder in home directory."
cp -R ./bash/. $HOME/

echo "Creating symlink to zsh folder in home directory."
cp -R ./zsh/. $HOME/

source ~/.bashrc

echo "update"
sudo apt-get -qq update

echo "install -y nano git curl python3 python3-venv python3-pip"
sudo apt-get -qq install -y nano git curl python3 python3-venv python3-pip

echo "Install ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "upgrade pip"
pip install -q --upgrade pip

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts

# Visual Studio Code :: Package list
pkglist=(
    aaron-bond.better-comments
    alexcvzz.vscode-sqlite
    batisteo.vscode-django 
    christian-kohler.npm-intellisense 
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
    GitHub.vscode-pull-request-github
    GrapeCity.gc-excelviewer  
    rogalmic.bash-debug 
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
    ms-toolsai.jupyter-keymap
    ms-vscode.cpptools-themes
    ms-vscode.live-server
    ms-vscode.test-adapter-converter
    hbenl.vscode-test-explorer
    redhat.vscode-yaml
    timonwong.shellcheck
    vscode-icons-team.vscode-icons
    wholroyd.jinja
    yzhang.markdown-all-in-one
    Zignd.html-css-class-completion
    ms-python.python
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

if test /tmp/code-server/bin/code-server; then
    for i in ${pkglist[@]}; do
        code-server --install-extension $i
    done
fi

echo "Add Settings code-server"
cp settings.json  ~/.local/share/code-server/User