{
  pkgs,
  username,
  vars,
  ...
}:

{
  imports = [
    ./jankyborders.nix
    ./sketchybar.nix
  ];

  services.nix-daemon.enable = true;
}
