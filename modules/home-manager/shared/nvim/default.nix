{
  pkgs,
  homeManagerConfig,
  config,
  username,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # plugins = with pkgs.vimPlugins; [ lazy-nvim ];
  };

  home.file.".config/nvim".source = homeManagerConfig.linkSharedApp config "nvim";
}
