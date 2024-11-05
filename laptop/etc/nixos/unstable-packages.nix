# Packages
{ config, pkgs, ... }: 

# enable unstable packages
let
  unstable = import <nixos-unstable> {};
in

# rest of configuration
{
  # software
  environment.systemPackages = with pkgs; [
  ];
}
