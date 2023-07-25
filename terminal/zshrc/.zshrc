# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/petrzakopal/local/bin:$PATH
 export PATH=/Users/petrzakopal/.local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#PS1='%n@%m %d %# '
PS1='%1~ %# '
