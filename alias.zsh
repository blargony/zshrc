# ==============================================================================
# Basic Aliases
# ==============================================================================
# Reload .zshrc
alias rehash='source ~/.zshrc'
alias srcrc="source ~/.zshrc"
alias vib='vim ~/.zshrc'
alias vic='vim ~/.vimrc'

# Handling aliases with sudo
alias sudo='sudo '

# --------------------------------------
# Directory navigation
# --------------------------------------
alias ls='ls -G'
alias ll='ls -ltr'
alias la='ls -a'
alias dir='ls'

# --------------------------------------
# Misc aliases
# --------------------------------------
alias more="less"

# OS Version
alias osver='echo "UNKNOWN OS: $OSTYPE"'
if [[ ${OSTYPE} == linux* ]]; then
    alias osver='lsb_release -a'
fi
if [[ ${OSTYPE} == darwin* ]]; then
    alias osver='uname -a'
fi

# Disk Status
alias df="df -h -T"
alias dfp="df | grep %"
alias dud1="du --max-depth=1 -h"

# Git Prompt
alias git_prompt_off='git config oh-my-zsh.hide-status 1'
alias git_prompt_on='git config oh-my-zsh.hide-status 0'

# --------------------------------------
# Python
# --------------------------------------
# Arg: A python script
function profile {
    python -m cProfile "$@"
}

# Arg: A directory to search for unit tests in
function pytest {
    python -m unittest discover -s "$@"
}

# --------------------------------------
# tar and zip directories
# --------------------------------------
function targ {
    tar -cvf $1.tar $1
}
function targz {
    tar -cvfz $1.tgz $1
}

# --------------------------------------
# Grep and Find
# --------------------------------------
function rgrep {
    find . | xargs grep $1
}
function rgrepf {
    find . -type f -name $1 | xargs grep $2
}
function findf {
    find . -type f -name $1
}
function chmodrf {
    find . -type f -name $1 | xargs chmod $2
}

# Recursive Rename
function renamer {
    find . -name "$1" -exec rename s/$1/$2/ {} \;
}
function renamertest {
    find . -name "$1" -exec rename -n s/$1/$2/ {} \;
}
