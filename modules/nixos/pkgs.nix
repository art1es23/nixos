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

  programs.zsh.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];
}
