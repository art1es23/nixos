{
  homeManagerConfig,
  config,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # plugins = with pkgs.vimPlugins; [ lazy-nvim ];
  };

  # home.file.".config/nvim".source = homeManagerConfig.linkSharedApp config "nvim";
  home.file.".config/nvim" = {
    source = homeManagerConfig.linkSharedApp config "nvim";
    recursive = true;
  };
}
