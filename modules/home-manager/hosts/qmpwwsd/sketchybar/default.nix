{ homeManagerConfig, config, ... }:

{
  home.file.".config/sketchybar".source = ~/nixos/modules/home-manager/hosts/qmpwwsd/sketchybar/config;
}
