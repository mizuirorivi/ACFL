#pushdのexport
function my_pushd_export(){
    pushd | cat > /tmp/pushd.txt
}
#view popd.txt
function my_pushd_view(){
    cat /tmp/pushd.txt
}
#pushdのimport
function my_pushd_import(){
  mycd=$(pwd)
  for dic_list in $(cat /tmp/pushd.txt | xargs); do
    pushd $(echo $dic_list | sed 's|~|'"${HOME}"'|g') > /dev/null
  done
  rm /tmp/pushd.txt
  cd $mycd
}
# fzfからvimを起動する
function my_fzf_with_vim(){
  output=$(fzf)
  vim $output
}
# target ip の設定
function my_target_ip(){
  export target_ip=$1
  echo 'export target_ip='$1 > ~/.config/zsh_config/kali/target_ip.zsh
  echo 'target_ip.zsh' >> ~/.config/zsh_config/kali/.gitignore

}
# 簡易webサーバーを起動する
function web_server(){
  python3 -m http.server 80
}
# vpnに接続後、割り当てられたipを表示する
function my_tun_ip(){
  my_tun_ip=`ip a | sed -n '/tun0:/,/^$/p' | grep -Eo "[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}"`
  echo -n "$my_tun_ip" | xclip -i -selection clipboard
  echo 'my_tun_ip = '$my_tun_ip
}
# 
function my_edit_zshrc(){
  pushd ~/.config/zsh_config/kali/
  nvim .
 u popd
}
function my_echo_readme(){
   echo 'init' > README.md
}
function my_curl_put_file_binary(){
  curl -X PUT http://$1 --data-binary @$2
}
function my_curl_move_file(){
  echo 'Destination:http://'$1'test'
}
