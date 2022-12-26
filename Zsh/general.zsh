alias vim=nvim
alias c=pushd
alias f=my_fzf_with_vim
export my_zsh_config=~/.config/zsh_config
function my_ps_find(){
  #print usage
  if [ $# -eq 0 ]; then
    echo "Usage: ps_find <process name>"
    echo "options:"
    echo "  -s: show process using sudo"
    return 1
  fi
  # compare $2 and "-s"
  if [ "$2" = "-s" ]; then
    sudo -v;sudo ps aux | grep $1 | grep -v grep
  else
    ps aux | grep $1 | grep -v grep
  fi
}
function my_ps_find_id(){
  #print usage
  if [ $# -eq 0 ]; then
    echo "Usage: ps_find_id <process name>"
    echo "options:"
    echo "  -s: show process using sudo"
    return 1
  fi
  # compare $2 and "-s"
  if [ "$2" = "-s" ]; then
    sudo -v;sudo ps aux | grep $1 | grep -v grep | awk '{print $2}' 
  else
    ps aux | grep $1 | grep -v grep | awk '{print $2}'
  fi
}
function man_first(){
  # pass argv to tldr
  if [[ -n $1 ]]; then
    tldr $1
  else
    return
  fi
}
# fzfからvimを起動する
function my_fzf_with_vim(){
  output=$(fzf) vim $output 
} 
function grep_contents(){
  grep -rl $1
}
function my_git_push(){
  #usage: my_git_push "commit message"
  #default of commit message is "add config"
  
  git_comment="add config"
  
  # argument check
  if [ $# -ge 1 ]; then
    git_comment="$1"
  fi

  git add -A
  git commit -m "$git_comment"
  git push
}
# zshrcの設定のload
function my_source_zshrc(){
  pushd ~/.config/zsh_config > /dev/null
  my_git_push
  popd > /dev/null
  source ~/.zshrc
}
#pushdのexport
function my_pushd_export(){
  for dic_list in $(pushd | xargs); do
    echo $dic_list > /tmp/pushd.txt
  done
}

#pushdのimport
function my_pushd_import(){
  for dic_list in $(cat /tmp/pushd.txt); do
    pushd -n $dic_list
  done
  rm /tmp/pushd.txt
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
