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

      # Enable Plasma 5
      desktopManager = {
        plasma5 = {
          enable = true;
          excludePackages = with pkgs.libsForQt5; [
            konsole
          ];
        };
      };

      # Enable sddm
      displayManager.sddm = {
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
}
