# Packages
{ config, pkgs, ... }: 

let
    unstable = import <unstable> {};
in {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flatpak
  # services.flatpak.enable = true;

  # enable zsh
  programs.zsh.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    corefonts
    dina-font
    fira-code
    fira-code-symbols
    font-awesome
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  # applications
  environment.systemPackages = with pkgs; [
    # app launcher
    fuzzel

    # art/photo
    gimp

    # bar
    waybar

    # development
    python3Full
    vscodium

    # git
    gitFull

    # terminal
    htop
    killall
    kitty
    vim
    wget
    zsh

    # notifications
    dunst

    # office/documents
    libreoffice
    obsidian
    onlyoffice-desktopeditors

    # privacy
    protonvpn-cli
    tor-browser

    # files
    ranger
    unzip

    # video
    shotcut
    vlc

    # wallpapers
    mpvpaper
    swaybg

    # web
    floorp
  ];
}
