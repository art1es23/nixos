{
  config,
  homeManagerConfig,
  ...
}:

{
  home.file.".config/gomi".source = homeManagerConfig.linkSharedApp config "gomi";
}
