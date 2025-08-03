ln -s ~/.dotfiles/gemrc     ~/.gemrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/irbrc     ~/.irbrc
ln -s ~/.dotfiles/oh_my_zsh ~/.oh_my_zsh
ln -s ~/.dotfiles/pryrc     ~/.pryrc
ln -s ~/.dotfiles/railsrc   ~/.railsrc
ln -s ~/.dotfiles/zshrc     ~/.zshrc
ln -s ~/.dotfiles/bin       ~/bin



ln -s ~/.dotfiles/shell_alias_and_export ~/.shell_alias_and_export
ln -s ~/.dotfiles/Preferences.sublime-settings ~'/Library/Application Support/Sublime Text/Packages/User/'

ln -s ~/.dotfiles/41m.zsh-theme  ~/.oh-my-zsh/themes/41m.zsh-theme
ln -s ~/.dotfiles/41m.plugin.zsh ~/.oh-my-zsh/custom/41m.plugin.zsh

// old way
cp ~/.gemrc                           ~/.dotfiles/gemrc
cp ~/.gitconfig                       ~/.dotfiles/gitconfig
cp ~/.irbrc                           ~/.dotfiles/irbrc
cp ~/.oh_my_zsh                       ~/.dotfiles/oh_my_zsh
cp ~/.pryrc                           ~/.dotfiles/pryrc
cp ~/.shell_alias_and_export          ~/.dotfiles/shell_alias_and_export

cp ~/.oh-my-zsh/themes/41m.zsh-theme  ~/.dotfiles/41m.zsh-theme
cp ~/.oh-my-zsh/custom/41m.plugin.zsh ~/.dotfiles/41m.plugin.zsh