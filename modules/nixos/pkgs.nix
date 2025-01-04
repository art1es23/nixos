{ pkgs, inputs, ... }:

{
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
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

	programs.zsh.enable = true;

	environment.pathsToLink = [ "/share/zsh" ];
}
