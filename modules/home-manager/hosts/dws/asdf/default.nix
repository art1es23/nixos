{
  config,
  homeManagerConfig,
  ...
}:

{
  home.file.".config/asdf".source = homeManagerConfig.linkHostApp config "gomi";
}
