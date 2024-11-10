# desktop environments
{ config, pkgs, ... }:


let
    unstable = import <unstable> {};
in {
  # wms, xwayland, +
  programs = {
    niri.enable = true;
  };

  # services
  services = {
    # enable gdm
    displayManager.ly.enable = true;
    
    # xserver related
    xserver = {
      # enable x11 windowing system.
      enable = true;

      # enable gnome
      desktopManager.gnome.enable = true;


      # enable keymap in x11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
