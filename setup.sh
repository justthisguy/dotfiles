ln -s ~/.dotfiles/gemrc     ~/.gemrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/oh_my_zsh ~/.oh_my_zsh
ln -s ~/.dotfiles/pryrc     ~/.pryrc
ln -s ~/.dotfiles/zshrc     ~/.zshrc
ln -s ~/.dotfiles/shell_alias_and_export ~/.shell_alias_and_export

cp ~/.gemrc                           ~/.dotfiles/gemrc
cp ~/.gitconfig                       ~/.dotfiles/gitconfig
cp ~/.oh_my_zsh                       ~/.dotfiles/oh_my_zsh
cp ~/.pryrc                           ~/.dotfiles/pryrc
cp ~/.shell_alias_and_export          ~/.dotfiles/shell_alias_and_export

cp ~/.oh-my-zsh/themes/41m.zsh-theme  ~/.dotfiles/41m.zsh-theme
cp ~/.oh-my-zsh/custom/41m.plugin.zsh ~/.dotfiles/41m.plugin.zsh