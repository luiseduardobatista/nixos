{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.pop-shell
    gnomeExtensions.pop-launcher-super-key
    gnome.gnome-tweaks
  ];
}
