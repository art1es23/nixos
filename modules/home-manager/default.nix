{
  hostname,
  username,
  pkgs,
  # inputs,
  ...
}:

{
  imports = [
    (./. + "/hosts/${hostname}")
    (./. + "/users/${username}.nix")
    ./shared
    # inputs.nix-colors.homeManagerModules.default
  ];

  # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;

  home = {
    username = username;
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = "nvim";
      SHELL = "zsh";
      TERMINAL = "kitty";
    };
    packages = with pkgs; [
      dejavu_fonts
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      font-awesome
      powerline-fonts
      powerline-symbols
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
