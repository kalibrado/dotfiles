#!/bin/bash
#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc zshrc oh-my-zsh private scrotwm.conf xtrem"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh

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
alias
for i in ${pkglist[@]}; do
    /tmp/code-server/bin/code-server --install-extension $i
done

echo "Add Settings code-server"
cp settings.json  ~/.local/share/code-server/User

echo 'alias code-server="/tmp/code-server/bin/code-server"' >> ~/.bashrc
echo "update"
sudo apt-get -qq update
echo "install -y nano git curl python3 python3-venv python3-pip"
sudo apt-get -qq install -y nano git curl python3 python3-venv python3-pip
echo "upgrade pip"
pip install -q --upgrade pip
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
