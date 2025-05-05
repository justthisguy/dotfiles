# echo 'start my .zshrc'
# echo $PATH
# echo ------------------


# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

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
plugins=( brew bundler cp gem git git-extras heroku rails rake  )
# bower brew-cask history history-substring-search osx postgres
# asdf git-flow git-flow-avh git-hubflow git-prompt git-remote-branch gitfast github gitignore docker docker-compose docker-machine

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
## ASDF version manager manager
##
##. /usr/local/opt/asdf/libexec/asdf.sh

# /usr/local/opt DOES NOT EXIST
          ##
          ## libxslt
          ##
          #libxslt ="/usr/local/opt/libxslt/bin"

          # For compilers to find libxslt you may need to set:
          #   export LDFLAGS="-L/usr/local/opt/libxslt/lib"
          #   export CPPFLAGS="-I/usr/local/opt/libxslt/include"

          # For pkg-config to find libxslt you may need to set:
          #   export PKG_CONFIG_PATH="/usr/local/opt/libxslt/lib/pkgconfig"

          ##
          ## zsh-icu4c
          ##
          # icu4c=/usr/local/opt/icu4c/bin

          # For compilers to find icu4c you may need to set:
          #   export LDFLAGS="-L/usr/local/opt/icu4c/lib"
          #   export CPPFLAGS="-I/usr/local/opt/icu4c/include"

          # For pkg-config to find icu4c you may need to set:
          #   export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

          ##
          ## curl
          ##
          # curl="/usr/local/opt/curl/bin"

          # For compilers to find curl you may need to set:
          #   export LDFLAGS="-L/usr/local/opt/curl/lib"
          #   export CPPFLAGS="-I/usr/local/opt/curl/include"

          # For pkg-config to find curl you may need to set:
          #   export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"


##
## PATH
##

homebrew=/opt/homebrew/bin:/usr/local/bin
sublime="/Applications/Sublime Text.app/Contents/SharedSupport/bin"
windsurf="/Users/workshop/.codeium/windsurf/bin"

export PATH=./bin:~/bin:/bin:$homebrew:$PATH:$sublime:$windsurf:

# echo $PATH


##
## zsh-completions
##
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

### mise-en-place < https://mise.jdx.dev/ >
eval "$(/Users/workshop/.local/bin/mise activate zsh)"

### fzf
source <(fzf --zsh)



# echo 'end my .zshrc'

# You may also need to force rebuild `zcompdump`:
#   rm -f ~/.zcompdump; compinit
# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:

#   chmod -R go-w '/usr/local/share/zsh'





# To migrate existing data from a previous major version of PostgreSQL run:
#   brew postgresql-upgrade-database

# This formula has created a default database cluster with:
#   initdb --locale=C -E UTF-8 /usr/local/var/postgres
# For more details, read:
#   https://www.postgresql.org/docs/13/app-initdb.html

# To have launchd start postgresql now and restart at login:
#   brew services start postgresql
# Or, if you don't want/need a background service you can just run:
#   pg_ctl -D /usr/local/var/postgres start



