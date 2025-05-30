{ pkgs, ... }:

{
  imports = [
    ./dunst
    ./gomi
    ./grimblast
    ./rofi
    ./hyprland
    ./scripts
    ./waybar
    ./wtf
    ./flameshot.nix
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
    rofi-emoji
    rofi-vpn
    rofi-calc
    hypridle
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprutils
    wl-clipboard
    bibata-cursors

    cliphist
    grimblast

    hyprpolkitagent

    libsForQt5.xwaylandvideobridge
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils  # Required for `xdg-open`
  ];

  # xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

}
