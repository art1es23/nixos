{ homeManagerConfig, config, ... }:

{
  home.file.".config/bat".source = ~/nixos/modules/home-manager/shared/bat/config;
  # home.file.".config/bat".source = homeManagerConfig.linkSharedApp config "bat";
}
