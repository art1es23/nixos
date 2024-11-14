{ username, ... }:

{
  imports = [
    ./services
  ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    configureBuildUsers = true;
  };

  nixpkgs = {
    config = {
      # Allow to install unfree apps as like Obsidian
      allowUnfree = true;
    };
    hostPlatform = "aarch64-darwin";
  };

  security = {
    pam = {
      enableSudoTouchIdAuth = true;
    };
  };

  networking = {
    hostName = "qmpwwsd";
    localHostName = "qmpwwsd";
  };

  users.users.${username}.home = "/Users/${username}";
}
