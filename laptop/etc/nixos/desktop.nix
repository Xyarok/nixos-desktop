# desktop environments
{ config, pkgs, ... }:

{
  # xserver related
  services.xserver = {
    # enable x11 windowing system.
    enable = true;

    # enable gnome de
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # enable keymap in x11
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # exclude gnome packages
  environment.gnome.excludePackages = (with pkgs; [
    # packages that are pkgs
    gnome-connections
    gnome-console
    gnome-text-editor
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    # packages that are pkgs.gnome
    epiphany
    evince
    geary
    gnome-contacts
    gnome-maps
    gnome-weather
  ]);
}
