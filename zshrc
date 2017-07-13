# echo 'start my .zshrc'
# echo $PATH
# echo ------------------


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random"
ZSH_THEME="41m"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

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
# Example format: plugins=(bower brew-cask history history-substring-search osx postgres )
plugins=(brew bundler cp gem git git-extras heroku rails rake )
# git-flow git-flow-avh git-hubflow git-prompt git-remote-branch gitfast github gitignore


source $ZSH/oh-my-zsh.sh

# iTerm2 does not set this properly??
export LC_CTYPE="utf-8"

##
## PATH
##
homebrew=/usr/local/bin:/usr/local/sbin
rbenv=~/.rbenv/shims
anaconda=~/dev/devapps/anaconda/bin
export PATH=./bin:~/bin:$homebrew:$rbenv:$anaconda:$PATH:

##
## POSTGRESQL
##
export PGHOST=/tmp

##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
# echo $PATH | grep -q -s "/usr/local/bin"
# if [ $? -eq 1 ] ; then
#     PATH="/usr/local/bin:$PATH"
#     export PATH
# fi
### need this up front so frack it. SEE ABOVE

####
# docker
####
# eval "$(docker-machine env default)"

####
###   My personal stuff
####
source ~/.shell_alias_and_export

# echo 'end my .zshrc'
# echo $PATH