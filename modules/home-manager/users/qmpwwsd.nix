{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "qmpwwsd";
    userEmail = "dreamwinamounts.dev@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
      core = {
        editor = "nvim";
        # autocrlf = "input";
      };
      # commit.gpgsign = true;
      # pull.rebase = true;
      # rebase.autoStash = true;
    };
  };
}
