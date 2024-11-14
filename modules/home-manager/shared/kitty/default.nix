{ homeManagerConfig, config, ... }:

{
  programs.kitty = {
    enable = true;
  };

  home.file.".config/kitty".source = ~/nixos/modules/home-manager/shared/kitty/config;
  # home.file.".config/kitty".source = homeManagerConfig.linkSharedApp config "kitty";
}
