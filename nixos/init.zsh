alias my_nix_update="sudo nixos-rebuild switch"
alias my_nix_edit="sudo nvim /etc/nixos/configuration.nix"
alias cat="bat"
export my_nix_home="/home/r3v321se/.config/nixpkgs/"
function my_nix_home_edit(){
  c $my_nix_home
  vim .
}
alias my_nix_home_update="home-manager switch"


