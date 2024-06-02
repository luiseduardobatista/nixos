
{ config, pkgs, ... }:

{
  home.username = "luisb";
  home.homeDirectory = "/home/luisb";
  home.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  # Importa os pacotes categorizados
  imports = [
   ./home-manager/zsh.nix
   ./home-manager/nvim.nix
   ./home-manager/gnome.nix
   ./home-manager/devtools.nix
   ./home-manager/terminal.nix
   ./home-manager/programming-languages.nix
  ];

  programs.home-manager.enable = true;
}
