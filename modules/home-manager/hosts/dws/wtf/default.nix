{ homeManagerConfig, config, ... }:

{
    home.file.".config/wtf".source = homeManagerConfig.linkHostApp config "wtf";
}
