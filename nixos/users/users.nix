{ config, pkgs, ... }:

let
    unstable = import <unstable> {};
in {
  # Define a user account(s) and settings
  users = {
    # set zsh for all users
    defaultUserShell = pkgs.zsh;
    
    # set users
    users = {
      # primary user
      xyarok = {
        isNormalUser = true;
        description = "Primary user account";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
          # literally empty
        ];
      };
    };
  };
}
