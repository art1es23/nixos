{ pkgs, ... }:

{
  imports = [
    ./hyprland
    ./waybar
    ./dunst
  ];

  home.packages = with pkgs; [
    # Hyprland
    waybar
    dunst
    libnotify
    swww
    rofi-wayland
    rofi-power-menu
    rofi-bluetooth
    rofi-pulse-select
    rofi-screenshot
    # ulauncher
    hypridle
    hyprlock
    hyprpicker
    wl-clipboard

    cliphist

    pavucontrol
    hyprpolkitagent

    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  # xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

}
