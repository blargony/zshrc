# ==============================================================================
# .zshrc file
# ln -s this file to ~/.zshrc
# ==============================================================================
# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Ensure editor is set
export EDITOR=vim
export SVN_EDITOR=vim

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
    DISTRO='NA'
    # virtualenv setup I use on OSX
    export WORKON_HOME=~/pydev
    source /usr/local/bin/virtualenvwrapper.sh
else
    CURRENT_OS='Linux'
    DISTRO='NA'
fi

# Source ZPlugin Modules
source ~/zshrc/zplugin.zsh

# Source Alias File
if [[ -e ~/zshrc/alias.zsh ]]; then
    source ~/zshrc/alias.zsh
fi

# Source Work Specific zshrc
if [[ -e ~/zshrc_work/worktools.zsh ]]; then
    source ~/zshrc_work/worktools.zsh
fi

#zprof
