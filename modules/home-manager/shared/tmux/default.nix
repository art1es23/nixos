{
  homeManagerConfig,
  config,
  username,
  ...
}:

{
  # programs.tmux.enable = true;

  home.file.".config/tmux".source = homeManagerConfig.linkSharedApp config "tmux";
}
