{
  username,
  pkgs,
  lib,
  ...
}:

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

    xfce.xfce4-settings
    xfce.xfce4-power-manager
    xfce.libxfce4ui
    xfce.libxfce4util
    dbus
    glib
    gtk3

    # Development
    atac
    redis
    heroku
    kitty
    openssh
    postman

    # CLI
    acpi
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
    _1password-gui
    gum
    spotify
    flameshot
    vlc

    # Browsers
    firefox
    google-chrome

    #Productivity
    obsidian
    notion

    # Social
    telegram-desktop
    discord

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

  environment = {
    pathsToLink = [ "/share/zsh" ];
    variables = {
      SSH_ASKPASS = lib.mkForce "$HOME/.config/hypr/scripts/rofi-askpass";
      SUDO_ASKPASS = lib.mkForce "$HOME/.config/hypr/scripts/rofi-askpass";
    };
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    etc."home/${username}/.config/hypr/scripts/rofi-askpass" = {
      source = "/home/${username}/.config/hypr/scripts/rofi-askpass";
      mode = "0755"; # Readable and executable by the owner and others
    };
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
    # xserver.displayManager = {
    #   gdm = {
    #     enable = true;
    #     wayland = true;
    #   };
    # };
  };
}
