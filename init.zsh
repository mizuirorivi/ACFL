function load_config(){
  os=$(uname -a)
  echo '[*] load_config start'
  if [[ `echo $os | grep -o kali | tail -1` == "kali" ]]; then
    echo '[*] your OS:kali'
    for FILE in ~/.config/zsh_config/kali/*.zsh; do
      source $FILE
    done
    echo '[*] load_config completed'
  elif [[ `echo $os | grep -o MANJARO | tail -1` == "MANJARO" ]]; then
    echo '[+] your OS:manjaro'
    for FILE in ~/.config/zsh_config/manjaro/*.zsh; do
      source $FILE
    done
    echo '[*] load_config completed'
  elif [[ `echo $os | grep -o MacBook | tail -1` == "MacBook" ]]; then
    echo '[+] your OS:mac'
    for FILE in ~/.config/zsh_config/osx/*.zsh; do
      source $FILE
    done
    echo '[*] load_config completed'
  elif [[ `echo $os | grep -o nixos | tail -1` == "nixos" ]]; then
    echo '[+] your OS:nixos'
    for FILE in ~/.config/zsh_config/nixos/*.zsh; do
      source $FILE
    done
    echo '[*] load_config completed'
  else
    echo '[!]Unknown OS!'
  fi
}

load_config
