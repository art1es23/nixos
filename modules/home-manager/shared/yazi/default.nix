{
  pkgs,
  config,
  homeManagerConfig,
  ...
}:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
	#    settings = {
	# log = {
	#     enabled = false;
	#   };
	#   manager = {
	#     show_hidden = true;
	#     sort_dir_first = true;
	#     sort_reverse = true;
	#   };
	#    };
    # package = inputs.yazi.packages.${pkgs.system}.default;
  };


  home.file.".config/yazi".source = homeManagerConfig.linkSharedApp config "yazi";
}
