{ ... }:

{
  # home.file.".config/hypr".source = homeManagerConfig.linkHostApp config "hyprland";

  imports = [
    ./main.nix
    ./system.nix
    ./binds.nix
    ./windowrules.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  services = {
    cliphist.enable = true;
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
  };
}
