{
  username,
  pkgs,
  lib,
  ...
}:

{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-27.3.11"
    ];
  };

  environment.systemPackages = with pkgs; [
    # System
    clang-tools
    gcc
    cargo
    lua
    go
    nodejs
    pnpm
    pciutils
    tcpdump
    lm_sensors
    wireguard-tools
    inetutils
    gnumake
    pandoc
    exiftool
    xlsx2csv
    catdoc
    odt2txt
    mpv

    xfce.xfce4-settings
    xfce.xfce4-power-manager
    xfce.libxfce4ui
    xfce.libxfce4util
    dbus
    glib
    gtk3

    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.en_US

    # Dev environment
    kitty
    oh-my-posh
    neovim
    meld
    posting
    tmux

    # CLI Tools
    age
    atuin
    bat
    curl
    dasel
    direnv
    eza
    eget
    fd
    feh
    ffmpeg
    ffmpegthumbnailer
    fzf
    gifsicle
    glow # Markdown preview
    gomi # Replacement for UNIX rm command
    jq
    jql
    jless
    navi # Interactive cheatsheet tool
    nh
    restic # Backup tool
    ripgrep
    thefuck
    tldr
    sttr # Change text format
    sxiv
    vhs
    wget
    xh
    yq
    zoxide

    #CLI Development
    asdf-vm
    atac
    csvlens
    gama # Managing Github Actions
    grex # Generate RexExp
    gitnr # .gitignore generator
    redis
    harlequin # SQL IDE
    heroku
    hub # Github
    openssh
    ots # Share e2e encrypted secrets via one-time URL
    k9s
    # kaskade # TUI Apache Kafka
    koji # git-commits generator
    ktop
    lazygit
    lazydocker
    lazysql
    live-server
    nap # Code snippets manager
    npm-check-updates
    rainfrog # Postgres IDE
    serie # GIT commit tree preview
    semantic-release # Automated vers management and package publishing
    sshs
    surge-cli # Static web-publishing
    tailspin # Log-previewer

    # CLI Additional
    acpi # Battery
    bandwhich
    btop
    circumflex # Hackenews
    croc # Transfering files between PCs
    ddgr # DuckDuckGo
    hyperfine # Benchmark for tools/cmds
    gallery-dl # Image/s download
    gtt # Translator
    gum
    fastfetch
    lychee # Async link checker
    okular
    ouch # Compress and decompress files and dirs
    unar # Archive unpacker
    upower
    pik
    terminaltexteffects
    typioca # Typing checker
    speedtest-cli
    scc
    streamlink # Extract streams
    wiki-tui
    wiper # Disk analyzer
    wtf

    # AI
    aichat
    ollama
    oterm

    # Additional
    _1password-gui
    spotify
    vlc
    libreoffice-qt
    gimp
    figma-linux
    # transmission_4
    file-roller
    unar

    # Browsers
    firefox
    google-chrome

    # Development
    postman

    #Productivity
    obsidian
    logseq
    # notion

    # Social
    telegram-desktop
    discord
    fractal
    iamb # Matrix client

    # LSP Servers
    nil
    lua-language-server
    bash-language-server
    yaml-language-server
    typescript-language-server
    nixfmt-rfc-style
    prettierd
    eslint_d
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
      SSH_ASKPASS = lib.mkForce "$HOME/.config/rofi/scripts/rofi-askpass";
      SUDO_ASKPASS = lib.mkForce "$HOME/.config/rofi/scripts/rofi-askpass";
      # Set the custom screenshot directory for grimblast
      XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots";
    };
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    etc."home/${username}/.config/rofi/scripts/rofi-askpass" = {
      source = "/home/${username}/.config/rofi/scripts/rofi-askpass";
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
