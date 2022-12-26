# install zsh config to ~/.zshrc
echo "
#zsh config 取り込み
for FILE in ~/.config/zsh_config/*.zsh; do
  source \$FILE
done
" >> $HOME/.zshrc

mv Zsh $HOME/.config/zsh_config
source ~/.zshrc

# install gdb-peda
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

