{ homeManagerConfig, config, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_storm";
    # font = {
    #   name = "Fira Code";
    #   package = pkgs.fira-code;
    #   size = 22;
    # };
    settings = {
      background_opacity = "0.85";
      background_blur = 10;
      window_padding_width = 10;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
    };
    extraConfig = builtins.readFile ./config/kitty.conf;
  };

  # home.file.".config/kitty".source = homeManagerConfig.linkSharedApp config "kitty";
}
