{ homeManagerConfig, config, ... }:

{
  home.file.".config/kitty".source = homeManagerConfig.linkSharedApp config "kitty";
}
