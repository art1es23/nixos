{ pkgs, ... }:

{
  imports = [
    ./aerospace
    ./sketchybar
  ];

  home.packages = with pkgs; [
    aerospace
    jankyborders
    sketchybar
  ];
}
