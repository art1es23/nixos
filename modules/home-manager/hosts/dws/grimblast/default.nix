{
  config,
  homeManagerConfig,
  ...
}:

{
  home.file.".config/grimblast".source = homeManagerConfig.linkHostApp config "grimblast";
}
