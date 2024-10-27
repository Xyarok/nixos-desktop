# Packages
{ config, pkgs, ... }: 

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flatpak
  services.flatpak.enable = true;

  # enable zsh
  programs.zsh.enable = true;

  # applications
  environment.systemPackages = with pkgs; [
    # art/photo
    gimp

    # development
    python3Full
    vscodium

    # fonts
    corefonts

    # git
    gitFull

    # terminal
    htop
    killall
    kitty
    vim
    wget
    zsh

    # office/documents
    onlyoffice-bin_latest
    obsidian

    # privacy
    protonvpn-gui
    tor-browser

    # video
    shotcut
    vlc

    # web
    floorp
  ];
}
