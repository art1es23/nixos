{
  system = import ./system.nix;
  
  users = import ./users.nix;
  networking = import ./networking.nix;
  locale = import ./locale.nix;
  pkgs = import ./pkgs.nix;

  services = import ./services;
}
