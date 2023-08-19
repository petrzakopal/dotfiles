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
packer needs to be installed
[https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) via command

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
