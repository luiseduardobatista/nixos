{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "luisb";
  home.homeDirectory = "/home/luisb";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  # Enable unfree softwares
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    # Basic tools
    fd
    ripgrep
    gcc
    git
    wget
    curl


    # Terminal tools
    alacritty
    lazygit
    zsh
    zoxide


    # Development tools

    neovim
    vscode-fhs
    dbeaver
    insomnia
    jetbrains-toolbox
    remmina
    gnumake


    # Programming languages
    python3
    rustup
    nodejs
    go
    alejandra # Nix language formatter
    
    # Zsh Plugins
    zsh-syntax-highlighting
    zsh-history
    zsh-autosuggestions
    zsh-powerlevel10k

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/luisb/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

 # programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

#  environment.shells = with pkgs; [ zsh ];
#  users.defaultUserShell = pkgs.zsh;
  programs = {
      zsh = {
          enable = true;
          enableAutosuggestions = true;
          syntaxHighlighting.enable = true;
          oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [
              "git"
              "history"
            ];
          };
      };
  };

  programs.zoxide.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
