{
  homeManagerConfig,
  config,
  username,
  ...
}:

{
  home.file.".config/kitty".source = homeManagerConfig.linkSharedApp config "kitty";
}
