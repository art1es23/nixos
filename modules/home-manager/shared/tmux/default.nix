{ homeManagerConfig, config, ... }:

{
  programs.tmux.enable = true;

  home.file.".config/tmux".source = ~/nixos/modules/home-manager/shared/tmux/config;
  # home.file.".config/tmux".source = homeManagerConfig.linkHostApp config "tmux";
}
