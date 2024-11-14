{
  pkgs,
  config,
  ...
}:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
	log = {
	    enabled = false;
	  };
	  manager = {
	    show_hidden = true;
	    sort_by = "modified";
	    sort_dir_first = true;
	    sort_reverse = true;
	  };
    };
    # package = inputs.yazi.packages.${pkgs.system}.default;
  };
}
