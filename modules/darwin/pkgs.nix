{
  pkgs,
  ...
}:

{
  programs.zsh.enable = true;

  environment = {
    # shells = [ pkgs.bash pkgs.zsh ];
    # loginShell = pkgs.zsh;
    systemPackages = with pkgs; [
      kitty
      aerospace
      jankyborders
      sketchybar

      # Development
      atac
      redis
      heroku
      nodejs
      openssh

      # CLI
      age
      atuin
      bat
      direnv
      eza
      fastfetch
      fd
      fx
      fzf
      glow
      jq
      neovim
      lazygit
      lazydocker
      ripgrep
      thefuck
      tmux
      zoxide

      # AI
      aichat
      ollama

      # Additional
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
  };
}
