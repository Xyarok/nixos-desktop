# desktop environments
{ config, pkgs, ... }:


let
    unstable = import <unstable> {};
in {
  # wms
  programs = {
    niri.enable = true;
    waybar.enable = true;
  };

  # services
  services = {
    # enable gdm
    displayManager.sddm.enable = true;
    
    # xserver related
    xserver = {
      # enable x11 windowing system.
      enable = true;


      # enable keymap in x11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
