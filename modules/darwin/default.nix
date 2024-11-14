# {...}:

{
  # import = [
  #   ./system.nix
  #   ./pkgs.nix
  #   ./brew.nix
  # ]
  system = import ./system.nix;
  pkgs = import ./pkgs.nix;
  brew = import ./brew.nix;
}
