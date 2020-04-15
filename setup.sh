ln -s ~/.dotfiles/gemrc     ~/.gemrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/oh_my_zsh ~/.oh_my_zsh
ln -s ~/.dotfiles/pryrc     ~/.pryrc
ln -s ~/.dotfiles/zshrc     ~/.zshrc

ln -s ~/.dotfiles/shell_alias_and_export ~/.shell_alias_and_export
ln -s ~/.dotfiles/Preferences.sublime-settings ~'/Library/Application Support/Sublime Text 3/Packages/User/'

ln -s ~/.dotfiles/41m.zsh-theme  ~/.oh-my-zsh/themes/41m.zsh-theme
ln -s ~/.dotfiles/41m.plugin.zsh ~/.oh-my-zsh/custom/41m.plugin.zsh


cp ~/.gemrc                           ~/.dotfiles/gemrc
cp ~/.gitconfig                       ~/.dotfiles/gitconfig
cp ~/.oh_my_zsh                       ~/.dotfiles/oh_my_zsh
cp ~/.pryrc                           ~/.dotfiles/pryrc
cp ~/.shell_alias_and_export          ~/.dotfiles/shell_alias_and_export

cp ~/.oh-my-zsh/themes/41m.zsh-theme  ~/.dotfiles/41m.zsh-theme
cp ~/.oh-my-zsh/custom/41m.plugin.zsh ~/.dotfiles/41m.plugin.zsh