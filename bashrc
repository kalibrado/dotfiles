##############################################################################
#   Filename: .bashrc                                                        #
# Sections:                                                                  #
#   01. General ................. General Bash behavior                      #
#   02. Aliases ................. Aliases                                    #
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################
# Shell prompt
export PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\t\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"

##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output
alias count='find . -type f | wc -l'
alias cpv='rsync -ah --info=progress2'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gh='history|grep'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias lt='ls --human-readable --size -1 -S --classify'
alias ls="ls -Glah"
alias pip-i='pip install -r requirements.txt'
alias va='source ./.venv/bin/activate'
alias ve='python3 -m venv ./.venv'
