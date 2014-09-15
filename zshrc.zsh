#
# .zshrc file
# ln -s this file to ~/.zshrc
#

# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Ensure editor is set
export EDITOR=vim


# This fixes using SSH in urxvt
if [[ $TERM == 'rxvt-unicode' ]] ; then
    export TERM='xterm'
fi


#
# OS Detection
#

UNAME=`uname`

# Fallback info
CURRENT_OS='Linux'
DISTRO=''
DISTRO_REL='current'

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
    DISTRO_REL='current'
else
    # Must be Linux, determine distro
    # Work in progress, so far CentOS is the only Linux distro I have needed to
    # determine
    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi
        
        # Still have some old RHEL distros around -- mark 6,7 as current
        if grep -q "release 7" /etc/redhat-release; then
            DISTRO_REL='current'
        elif grep -q "release 6" /etc/redhat-release; then
            DISTRO_REL='current'
        else
            DISTRO_REL='old'
        fi
    fi
fi

# Load Antigen
source ~/.antigen/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then

    if [[ $DISTRO == 'CentOS' ]]; then
        #antigen bundle centos
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

# Only Load Antigen Bundles for Current Distros
if [[ $DISTRO_REL == 'current' ]]; then
    
    # Repos
    antigen bundle git
    antigen bundle svn
    
    # Python
    antigen bundle pip
    antigen bundle python
    antigen bundle virtualenv
    
    # Ubuntu Command Not Found
    antigen bundle command-not-found

    # Syntax highlighting bundle
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen-bundle zsh-users/zsh-history-substring-search

    # Load the theme.
    antigen theme avit

fi

# Tell antigen that you're done.
antigen apply


# Source Personal Alias File
if [[ -e ~/zshrc/alias.zsh ]]; then
    source ~/zshrc/alias.zsh
fi

# Source Work Tools File
if [[ -e ~/zshrc/worktools.zsh ]]; then
    source ~/zshrc/worktools.zsh
fi
