{ pkgs, ... }:

{
  # Allow unfree software
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Enable Flatpaks
  services = {
    flatpak.enable = true;

    avahi = {
     enable = true;
     nssmdns = true;
     openFirewall = true;
    };
  };
  
  programs = { 
    # Enable Neovim
    neovim = {
     enable = true;
     configure = {
       customRC = ''
         syntax enable
  
         set number
         set relativenumber

          set tabstop=2
          set softtabstop=2
          set shiftwidth=2
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
    neovim = {
     viAlias = true;
     vimAlias = true;
    };
  };

  # Set Neovim as the default text editor
  environment.variables.EDITOR = "nvim";

  # Download packages
  environment.systemPackages = with pkgs; [

    # Base Applications
    firefox
    floorp
    gimp
    onlyoffice-bin_7_5
    vlc
    xarchiver
 
    # Terminal and Terminal Applications
    kitty
    fdupes
    htop
    killall
    ranger
    wget

    # Video Creation
    shotcut
    obs-studio

    # Development
    vscodium

    # Privacy Applications
    tor-browser-bundle-bin

    # 3/2D Art
    krita
    blender

    # Notes
    lorien
    obsidian

    # Windows Compatability
    winetricks
    wineWowPackages.wayland
    wine-staging

    # Github
    git
    git-crypt
    gnupg

    # fonts
    corefonts
  ];
}
