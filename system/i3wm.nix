{ config, lib, pkgs, ... }:
{

  options.i3Desktop = {
    enable = lib.mkEnableOption "Desktop";
  };

  config = lib.mkIf config.i3Desktop.enable {
    services.displayManager.defaultSession = "none+i3";

    services.xserver = {
        enable = true;

        desktopManager = {
          xterm.enable = false;
          gnome.enable = true;
        };

        windowManager.i3 = {
          enable = true;
          extraPackages = with pkgs; [
            dmenu
            rofi
            i3status
            picom
            polybar
            lxappearance
            feh
            gnome3.gnome-flashback
        ];
        };
      };

    environment.systemPackages = with pkgs; [
      catppuccin-gtk
      catppuccin-cursors
      pop-gtk-theme
    ];

    programs.dconf.enable = true;
  };
}
