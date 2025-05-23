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
    # System Base
    cargo
    clang-tools
    dbus
    gcc
    gnumake
    go
    hunspell
    hunspellDicts.en_US
    hunspellDicts.uk_UA
    lua
    nodejs
    pciutils
    pnpm
    sddm-sugar-dark
    libsForQt5.qt5.qtquickcontrols2   
    libsForQt5.qt5.qtgraphicaleffects
    
    # LSP Servers (alphabetized)
    bash-language-server
    eslint_d
    lua-language-server
    nil
    nixfmt-rfc-style
    prettierd
    typescript-language-server
    yaml-language-server

      # Archive & Compression
    file-roller  # GUI archive manager
    ouch         # Compress/decompress files and dirs
    unar         # Archive unpacker (appears twice in your list)
    
    # Documents
    catdoc       # Extract text from MS-DOC
    libreoffice-qt
    odt2txt      # Convert ODT to text
    okular       # Document viewer
    pandoc       # Document converter
    xlsx2csv     # Convert Excel to CSV
    
    # Images
    exiftool     # Image metadata
    feh          # Image viewer
    gimp         # Image editor
    imagemagick  # Image manipulation
    sxiv         # Simple X Image Viewer
    
    # Video/Audio
    cava         # Audio visualizer
    ffmpeg       # Video/audio converter
    ffmpegthumbnailer
    gallery-dl   # Image/video downloader
    gifsicle     # GIF manipulation
    mpv          # Media player
    pavucontrol
    streamlink   # Extract streams

      # Core CLI Tools
    age          # Encryption tool
    atuin        # Shell history
    bat          # Better cat
    curl         # HTTP requests
    dasel        # Data structure processor
    direnv       # Directory-based environments
    eget         # GitHub release downloader
    eza          # Modern ls replacement
    fd           # Better find
    fzf          # Fuzzy finder
    glow         # Markdown preview
    gomi         # Safe rm replacement
    hyperfine    # Command benchmarking
    jless        # JSON viewer
    jq           # JSON processor
    jql          # JSON query
    lychee       # Link checker
    navi         # Interactive cheatsheet
    nh           # Nix helper
    restic       # Backup tool
    ripgrep      # Better grep
    speedtest-cli
    sttr         # Text format changer
    thefuck      # Command correction
    tldr         # Command examples
    vhs          # Terminal recorder
    wget         # File downloader
    xh           # HTTP client
    yq           # YAML processor
    zoxide       # Better cd
    
    # System Monitoring/Management
    acpi         # Battery info
    bandwhich    # Network usage
    btop         # System monitor
    fastfetch    # System info
    lm_sensors   # Hardware monitoring
    iotop      # Monitor disk I/O
    rsync      # Efficient file transfer/synchronization
    scc          # Code counter
    upower       # Power management
    wiper        # Disk analyzer
    wtf          # Personal dashboard
    
    # Network Tools
    croc         # File transfer between PCs
    dig        # DNS lookup utility
    inetutils    # Network utilities
    iperf3     # Network speed testing
    mtr        # Traceroute and ping combined
    nmap       # Network discovery and security auditing
    ots          # Share encrypted secrets
    tcpdump      # Packet analyzer
    traceroute # Network route tracing
    wireguard-tools
    whois      # Domain registration data
    
    # Development Environment
    asdf-vm      # Runtime version manager
    csvlens      # CSV viewer
    gama         # GitHub Actions manager
    gitnr        # .gitignore generator
    grex         # Generate RegExp
    harlequin    # SQL IDE
    heroku       # PaaS platform CLI
    hub          # GitHub CLI
    k9s          # Kubernetes UI
    kitty        # Terminal emulator
    koji         # Git commits generator
    ktop         # Kubernetes Monitoring
    lazydocker   # Docker TUI
    lazygit      # Git TUI
    lazysql      # SQL client
    live-server  # Local dev server
    meld         # Diff viewer
    nap          # Code snippets manager
    neovim       # Text editor
    npm-check-updates
    oh-my-posh   # Prompt theme engine
    openssh      # SSH client/server
    posting      # TUI HTTP client
    rainfrog     # Postgres IDE
    redis        # In-memory data structure store
    semantic-release
    serie        # Git commit tree preview
    sshs         # SSH connection manager
    surge-cli    # Static web publishing
    tailspin     # Log previewer
    tmux         # Terminal multiplexer

      # Browsers
    firefox
    google-chrome
    
    # Productivity
    _1password-gui
    logseq       # Knowledge base
    obsidian     # Note-taking
    postman      # API testing
    
    # Social/Communication
    discord
    fractal      # GNOME Matrix client
    iamb         # Matrix client
    telegram-desktop
    
    # Media & Entertainment
    figma-linux
    spotify
    
    # AI Tools
    aichat
    ollama       # Local LLM runner
    oterm        # Terminal client for Ollama
    
    # Misc
    circumflex   # Hacker News client
    ddgr         # DuckDuckGo CLI
    gtt          # Translator
    gum          # Shell script helper
    hledger      # Accounting
    pik          # Process Interactive Kill
    puffin       # Terminal dashboard for hledger
    terminaltexteffects
    typioca      # Typing checker
    wiki-tui     # Wikipedia TUI
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
        theme = "sugar-dark";
      };
    };
  };
}
