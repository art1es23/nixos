{ homeManagerConfig, config, ... }:

{
    home.file.".config/rofi".source = homeManagerConfig.linkHostApp config "rofi";
}
