{
  # homeManagerConfig,
  # config,
  ...
}:

{
  # home.file.".config/hypr".source = homeManagerConfig.linkHostApp config "hyprland";

  imports = [
    ./main.nix
    ./system.nix
    ./binds.nix
    ./windowrules.nix
    ./hyprlock.nix
  ];

  services = {
    # cliphist.enable = true;
    dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
          frame_color = "#eceff1";
          # font = "AtkinsonHyperlegible";
        };

        urgency_normal = {
          background = "#37474f";
          foreground = "#eceff1";
          timeout = 10;
        };
      };
      # iconTheme.name = "Papirus-Dark";
      # iconTheme.package = pkgs.papirus-icon-theme;
    };
    # kdeconnect = {
    #   enable = true;
    #   indicator = true;
    # };
    # udiskie = {
    #   enable = true;
    #   notify = true;
    #   automount = true;
    #   tray = "auto";
    # };
    hypridle = {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };

        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
