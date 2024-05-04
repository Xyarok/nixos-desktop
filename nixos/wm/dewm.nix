{config, pkgs, ...}:

{
  services = {

    # Enable XServer and related tasks
    xserver = {

      enable = true;

      videoDrivers = [ "amdgpu" ];

      # Set keyoard layout
      layout = "us";
      xkbVariant = "";

      # Enable Gnome
      desktopManager = {
        gnome = {
          enable = true;
        };
      };

 #     windowManager = {
 #       dwm = {
 #         enable = true;
 #       };
 #     };


      # Enable gdm
      displayManager.gdm = {
        enable = true;
      };
    };
  };

  # Enable dconf for gtk compatibility
  programs.dconf.enable = true;

  # Load grahpics drivers
  hardware.opengl = {
    extraPackages = with pkgs; [
    ];
    driSupport = true;
    driSupport32Bit = true;
  };

  environment.gnome.excludePackages = with pkgs.gnome;[
   epiphany
   gedit
   yelp
   geary
   seahorse
   totem
   gnome-contacts
 ];

}
