for FILE in irbrc gitignore gitconfig tmux.conf pryrc
do
  rm -rf ~/.$FILE
  ln -s ~/dotfiles/$FILE ~/.$FILE
done

tmux source-file ~/.tmux.conf

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

if [ $SPIN ]; then
  if ! command -v rg &> /dev/null; then
    sudo apt-get install -y ripgrep
  fi

  if ! command -v fd &> /dev/null; then
    sudo apt-get install fd-find
    ln -s $(which fdfind) ~/.local/bin/fd
  fi

  echo "StreamLocalBindUnlink yes" | sudo tee -a /etc/ssh/sshd_config
  sudo service ssh restart
  rm -rf ~/.gnupg/S*
  
  echo "Reminder: use `bt` in pry session to print a filtered stack trace."
fi

zsh && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc

cat ~/dotfiles/aliases >> ~/.zshrc

source ~/.zshrc

exit 0
