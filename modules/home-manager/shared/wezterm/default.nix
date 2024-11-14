{ homeManagerConfig, config, ... }:

{
  home.file.".config/wezterm".source = homeManagerConfig.linkSharedApp config "wezterm";
}
