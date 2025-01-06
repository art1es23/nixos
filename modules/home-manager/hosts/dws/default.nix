{ pkgs, ... }:

{
  imports = [
    ./hyprland
    ./waybar
  ];

  home.packages = with pkgs; [ ];
}
