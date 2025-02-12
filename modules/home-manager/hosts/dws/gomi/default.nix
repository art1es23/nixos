{
  config,
  homeManagerConfig,
  ...
}:

{
  home.file.".config/gomi".source = homeManagerConfig.linkHostApp config "gomi";
}
