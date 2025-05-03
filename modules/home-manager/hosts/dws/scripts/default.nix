{ homeManagerConfig, config, ... }:

{
    home.file.".config/scripts".source = homeManagerConfig.linkHostApp config "scripts";
}
