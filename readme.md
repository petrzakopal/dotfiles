# Zakopal Dotfiles
_Will be updated when I find and test something which should be included in my configuration..._

[Create own NVIM theme - lush.nvim](https://github.com/rktjmp/lush.nvim)

[Create](https://github.com/rktjmp/lush.nvim/blob/main/CREATE.md)

[Lush theme example](https://github.com/metalelf0/jellybeans-nvim/blob/main/lua/lush_theme/jellybeans-nvim.lua)


## Notes
For auto pairs in nvim I had to use config from this issue [GitHuib Issue](https://github.com/windwp/nvim-ts-autotag/issues/33)


# Fuzzy Finder in Terminal


[fzf](https://github.com/junegunn/fzf) - repository of a project

[Pste this code to a shell script to uninstall fzf](https://github.com/junegunn/fzf/blob/master/uninstall)

[fzf on macOS](https://sourabhbajaj.com/mac-setup/iTerm/fzf.html)

# For installing - make script and instructions later
on newest ubuntu versions - 23.04 you need ot install fuse 2
`sudo apt install libfuse2`

install vim via script

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

on a page [https://github.com/neovim/neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

packer needs to be installed
[https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) via command


move nvim.appimage with `sudo mv nvim.appimage /usr/bin/nvim` or to which directory the command `nvim` point points

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

build essenctils for c compiler need to be installed
`sudo apt-get install build-essential`

copy dotfiles to /home/<username>/.config/nvim

open nvim and go to lua/zakopal/packer.lua - source it with `:so` and then :PackerSync

apply color scheme

`colorscheme onedark_dark`

unzip must be installed for mason and clang language server probably
`sudo apt-get install unzip`


install zsh [https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

`apt install zsh`

install oh-my-zsh [https://ohmyz.sh/](https://ohmyz.sh/)

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

install zsh-autosuggestions as well [https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

with `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

and zsh-syntah-highlighting [https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

with oh-my-zsh `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`


set default terminal in tmux

```bash
cd ~
touch .tmux.conf
echo set-option -g default-shell /bin/zsh > .tmux.conf
tmux kill-server

```

for runnign nvm in zsh when installed in bash run `source ~/.nvm/nvm.sh` - node and pm2 will become available - in .zshrc file for example

to remove error `manpath: can't set the locale; make sure $LC_* and $LANG are correct`
and in file /etc/default/locale add line LC_ALL="en_US.UTF-8" and relogin to your server - using root

for example 

```bash
sudo su

echo LC_ALL="en_US.UTF-8">>/etc/default/locale```

# When there is an error with some package
According to this reddit thread [https://www.reddit.com/r/neovim/comments/skg2xz/treesitter_error_while_navigating_configlua/](https://www.reddit.com/r/neovim/comments/skg2xz/treesitter_error_while_navigating_configlua/) use command `rm -rf ~/.local/share/nvim/` and install Packer again and the so and the `:PackerSync`


# i3
when installing t3 via official website [i3wm.org/docs/rrepositories.html](i3wm.org/docs/rrepositories.html) you need to update the command with `echo deb` to `echo deb [arch=arm64]` or there will be an error to `sudo apt update`


# Export terminal settings in ubuntu
```bash
dconf dump /org/gnome/terminal/ > gnome_terminal_settings_backup.txt
```


# Natural scrolling in i3 ubuntu

mixed tutorials from [https://www.reddit.com/r/archlinux/comments/tt9uk9/please_help_natural_scrolling_doesnt_work/](https://www.reddit.com/r/archlinux/comments/tt9uk9/please_help_natural_scrolling_doesnt_work/)
(very down there)

but I used path "/usr/share/X11/xorg.conf.d/40-libinput.cong"

```
Input all of this in /etc/X11/xorg.conf.d/30-touchpad.conf



# Natural scrolling for all usb devices (mouse)

Section "InputClass"
Identifier "devname"
Driver "libinput"
Option "Tapping" "on"
Option "NaturalScrolling" "false"
EndSection

# Reverse scrolling for touchpad
Section "InputClass"
Identifier "libinput touchpad catchall"
MatchIsTouchpad "on"
MatchDevicePath "/dev/input/event*"
Driver "libinput"
Option "Tapping" "on"
Option "NaturalScrolling" "true"
EndSection
```
