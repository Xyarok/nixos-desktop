{ pkgs, ... }:

{
  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Enable Flatpaks
  services.flatpak.enable = true;

  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  
  # Enable Neovim
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        syntax enable

        set number
      	set relativenumber

        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set autoindent
        set smartindent

        filetype indent on

        if &diff
          let python_highlight_al = 1
        endif
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ vim-nix ];
      };
    };
  };

  # Enable Neovim alias'
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };

  # Set Neovim as the default text editor
  environment.variables.EDITOR = "nvim";

  # Download packages
  environment.systemPackages = with pkgs; [

    # Base applications
    bitwarden
    feh
    firefox
    gimp
    libreoffice
    vlc
    xarchiver
 
    # Terminal and related
    alacritty
    fdupes
    freshfetch
    htop
    killall
    wget
    git

    # Video
    kdenlive
    obs-studio

    # Development
    python39
    nasm
    bintools
    gcc

    # Privacy applications
    tor-browser-bundle-bin
    mullvad-vpn
    
    # Windows compatability
    winetricks
    wineWowPackages.wayland
    wine-staging

    # gaming
    yuzu-mainline
    bottles
    superTuxKart

    # Fonts
    nerdfonts

  ];

  # Enable Mullvad
  services.mullvad-vpn.enable = true;
  networking.iproute2.enable = true;

}
