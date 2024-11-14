{ homeManagerConfig, config, ... }:

{
  home.file.".config/aerospace".source = ~/nixos/modules/home-manager/hosts/qmpwwsd/aerospace/config;
  # home.file.".config/aerospace".source = homeManagerConfig.linkHostApp config "aerospace";
}
