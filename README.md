# zsh Setup

## To Install
First install ZPlugin
```
cd ~
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
```

Download the dotfiles
```
cd ~
git clone https://github.com/blargony/zshrc zshrc
```

Setup the softlinks
```
ln -s zshrc/zshrc .zshrc
ln -s zshrc/vimrc .vimrc   # Optional
```

## Notes
The setup assumes you have brew installed on OSX and that you have installed
the latest versions python and vim.

It also assumes you do your python virtualenv development in ~/pydev.  This
can be changed in zshrc.zsh


