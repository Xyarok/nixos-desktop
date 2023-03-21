{ config, pkgs, ... }:

{
  home.username = "rxz";
  home.homeDirectory = "/home/rxz";

  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [ btop unzip ardour qutebrowser nyxt ];

}
