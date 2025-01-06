{
  homeManagerConfig,
  config,
  username,
  ...
}:

{
  home.file.".config/bat".source = homeManagerConfig.linkSharedApp config "bat";
}
