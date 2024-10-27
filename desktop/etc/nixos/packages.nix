# A list of all packages used on my system
{ pkgs, ... };

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flatpaks
  services.flatpak.enable = true;

  # Enable programs
  programs = {
    zsh.enable = true;
  }

  # Application/etc
  environment = {
    # Gnome Apps
    gnome.excludePackages = (with pkgs; [
      # pkgs
      gnome-connections
      gnome-console
      gnome-text-editor
      gnome-tour
    ]) ++ (with pkgs.gnome; [
      # pkgs.gnome
      epiphany
      evince
      geary
      gnome-contacts
      gnome-maps
      gnome-weather
    ]);

    # NixOS Apps
    systemPackages = with pkgs; [
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
      firefox
      floorp
    ];
  };
}
