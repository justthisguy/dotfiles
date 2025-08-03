# echo 'start my .zshrc'
# echo $PATH
# echo my zshrc ------------------


# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random"
ZSH_THEME="41m"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=( brew bundler cp gem git github git-extras heroku postgres rails rake  )
# bower brew-cask history history-substring-search osx
# asdf git-flow git-flow-avh git-hubflow git-prompt git-remote-branch gitfast  gitignore docker docker-compose docker-machine

source $ZSH/oh-my-zsh.sh

  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

# iTerm2 does not set this properly??
# export LC_CTYPE="utf-8"

##
## POSTGRESQL
##
export PGHOST=/tmp

####
# docker
####
# eval "$(docker-machine env default)"

####
###   My personal stuff
####
source ~/.shell_alias_and_export


##
## zsh-completions
##
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

### mise-en-place < https://mise.jdx.dev/ >
eval "$(~/.local/bin/mise activate zsh)"

### fzf
source <(fzf --zsh)

eval "$(/opt/homebrew/bin/brew shellenv)"
##
## PATH
##

homebrew=/opt/homebrew/bin:/usr/local/bin
sublime="/Applications/Sublime Text.app/Contents/SharedSupport/bin"
windsurf="~/.codeium/windsurf/bin"
lmstudio="~/.lmstudio/bin"

export PATH=./bin:~/bin:/bin:$homebrew:$sublime:$windsurf:$lmstudio:$PATH:


# echo $PATH
# echo end my .zshrc
# echo ---------------
# echo ''



# You may also need to force rebuild `zcompdump`:
#   rm -f ~/.zcompdump; compinit
# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:

#   chmod -R go-w '/usr/local/share/zsh'



# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/workshop/.lmstudio/bin"
# End of LM Studio CLI section

