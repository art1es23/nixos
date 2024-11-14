{
  hostname,
  username,
  # inputs,
  ...
}:

{
  imports = [
    # (./. + "/hosts/${hostname}")
    # (./. + "/users/${username}.nix")
    ./shared
    # inputs.nix-colors.homeManagerModules.default
  ];

  # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;

  home = {
    username = username;
    # homeDirectory = "/Users/${username}";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = "nvim";
      SHELL = "zsh";
      TERMINAL = "kitty";
    };
  };

  programs.home-manager.enable = true;
}
