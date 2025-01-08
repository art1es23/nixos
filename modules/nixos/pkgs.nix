{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    _1password-gui
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
    telegram-desktop
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
      xwayland.enable = true;
      systemd.setPath.enable = true;
    };
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    # NIXOS_OZONE_WL = "1";
    # XDG_SESSION_TYPE = "wayland";
    # XDG_CURRENT_DESKTOP = "Hyprland";
    # WLR_DRM_DEVICES = "/dev/dri/card0";
    # SDL_VIDEODRIVER = "wayland";
  };

  hardware = {
    graphics.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security = {
    rtkit.enable = true;
    pam.services.hyprlock = { };
  };

  services = {
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  environment.pathsToLink = [ "/share/zsh" ];
}
