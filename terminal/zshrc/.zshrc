# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/petrzakopal/local/bin:$PATH
 export PATH=/Users/petrzakopal/.local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#PS1='%n@%m %d %# '
#PS1='%1~ %# '


# Color definitions resource
# UNIX 256 GUI Color codes
# https://www.ditig.com/256-colors-cheat-sheet
# Inspiration of settings from
# https://gist.github.com/reinvanoyen/05bcfe95ca9cb5041a4eafd29309ff29


COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{46}'
setopt PROMPT_SUBST
function parse_git_branch() {

    if git rev-parse --git-dir > /dev/null 2>&1; then
        # This is a valid git repository

        str=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p')
        echo " ${COLOR_GIT}${str}"

    else
        # Rhis is not a git repository
        echo ""

    fi

}



# Default prompt from linked gist
#export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%1~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# My edited prompt with logic to omit a " " when there is no git repository
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%1~$(parse_git_branch)${COLOR_DEF} $ '



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# For the function work, you need to instal fzf
# Install on macbook via "brew install fzf"
# Info how to use on macOS => https://sourabhbajaj.com/mac-setup/iTerm/fzf.html
# project repository => https://github.com/junegunn/fzf
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
