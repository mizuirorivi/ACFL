function my_mountssd(){
  sudo -v;
  devssd=$(echo '/dev/'`lsblk | grep sd | awk '{print $1}' | tail -1 | sed "s/^..//g"`)
  #devssdの出力にsdが含まれていた場合
  if [[ $devssd =~ "sd" ]]; then
    echo "SSDを検出しました。"
    echo "SSDのマウントを開始します。"
    sudo mount $devssd /mnt/ssd
    echo "SSDのマウントが完了しました。"
  else
    echo "SSDが検出されませんでした。"
  fi
}
function my_zsh_edit(){
  c ~/.config/zsh_config/nixos/
  vim .
}
