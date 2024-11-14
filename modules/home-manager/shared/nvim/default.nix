{
  pkgs,
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

  home.file.".config/nvim".source = ~/nixos/modules/home-manager/shared/nvim/config;
  # home.file.".config/nvim".source = homeManagerConfig.linkSharedApp config "nvim";
}
