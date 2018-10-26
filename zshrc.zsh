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

UNAME=`uname`

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
    DISTRO='NA'
    # Path to work with Brew
    export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/bin:/sbin:/usr/bin:/usr/sbin
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
    alias srcwrk='source ~/zshrc_work/worktools.zsh'
fi

#zprof
