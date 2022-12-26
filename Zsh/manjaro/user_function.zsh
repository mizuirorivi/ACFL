# ssdのマウント
function my_mountssd(){
  sudo -v;sudo mount /dev/sda1 /mnt/ssd1
}
# *.tar.gzの解凍
function my_untargz(){
  tar -zxvf $1
}
# myfunctionのリストの表示
function my_function_list(){
  cat ~/.config/zsh_config/manjaro/user_function.zsh | grep -E "^function" | awk '{print $2}' | sed -e "s/(){//g"
}
# 空白部分を_で置換
function my_replace_blank(){
  print $@ | sed 's/ /_/g'
}
# aizu_unviのvpnに接続
function my_vpn_aizu(){
  sudo openconnect --no-dtls --protocol=gp -c ~/.ssh/key_files/cert_ains-vpn-client.p12 ains-vpn.u-aizu.ac.jp
  read "Enter PKCS#12 pass phrase:" -s `echo -ne 'UoA-202204\r\n'`
}
# get my github repository list
function gh_repo_list(){
        curl -s -k -u :`echo $GIT_USER_TOKEN` "https://api.github.com/user/repos?per_page=100" | jq -r '.[].html_url'
}
# グローバルipアアドレスの取得
function show_global_ip(){
  curl httpbin.org/ip
}
# nasmの実行
function nasmelf(){
  nasm -felf64 $argv
}
#txzの解凍
function untxz(){
  tar Jxvf $1
}
# dockerのプロセス全削除
dockerm(){
  docker rm -f `docker ps -a | awk '{print $1}'`
}
# スリープ停止
dontsleep(){
  sudo systemctl mask suspend.target hibernate.target sleep.target
}
# スリープ起動
dosleep(){
  sudo systemctl unmask suspend.target hibernate.target sleep.target
}
#zshrcの編集
editzshrc(){
  vim ~/.zshrc
}
function web_server(){
  python3 -m http.server 80
}
