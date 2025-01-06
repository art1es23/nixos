{
  username,
  config,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    # ./filesystems.nix
    # ./networking.nix
    # ./users.nix
    # ./pkgs.nix
    # ./containers
    # ./services
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  time.timeZone = "Europe/Kyiv";

  users.users.${username}.home = "/home/${username}";

  services = {
    xserver = {
      enable = true;
      # Enable the GNOME Desktop Environment
      # displayManager.gdm.enable = true;
      # desktopManager.gnome.enable = true;
      # # Configure keymap in X11
      # xkb = {
      # 	layout = "us";
      # 	variant = "";
      # };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    printing.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
  };

  security.rtkit.enable = true;
  system.stateVersion = "24.05";
}
