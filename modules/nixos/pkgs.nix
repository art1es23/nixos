{ pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # System
    clang-tools
    gcc
    cargo
    nodejs
    pciutils
    tcpdump
    lm_sensors
    wireguard-tools
    inetutils
    waybar
    nautilus
    dunst
    libnotify
    swww
    rofi-wayland

    # Development
    atac
    redis
    heroku
    kitty
    openssh

    # CLI
    age
    atuin
    bat
    curl
    direnv
    eza
    fastfetch
    fd
    fx
    fzf
    glow
    jq
    neovim
    nh
    oh-my-posh
    lazygit
    lazydocker
    ripgrep
    thefuck
    tmux
    unzip
    wget
    zoxide

    # AI
    aichat
    ollama

    # Additional
    firefox
    google-chrome
    obsidian
    gum

    # LSP Servers
    nil
    lua-language-server
    bash-language-server
    yaml-language-server
    typescript-language-server
    nixfmt-rfc-style
    prettierd
  ];

  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      # nvidiaPatches = true;
      xwayland.enable = true;
      # # set the flake package
      # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # # make sure to also set the portal package, so that they are in sync
      # portalPackage =
      #   inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    # nvidia.modesetting.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.pathsToLink = [ "/share/zsh" ];
}
