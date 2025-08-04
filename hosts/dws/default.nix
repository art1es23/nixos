{ pkgs, lib, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "Europe/Kyiv";

  users.users.${username}.home = "/home/${username}";

  environment.pathsToLink = [ "/share/zsh" ];

  environment.variables = {
    SSH_ASKPASS = lib.mkForce "$HOME/.config/rofi/scripts/rofi-askpass";
    SUDO_ASKPASS = lib.mkForce "$HOME/.config/rofi/scripts/rofi-askpass";
    XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  environment.etc."home/${username}/.config/rofi/scripts/rofi-askpass" = {
    source = "/home/${username}/.config/rofi/scripts/rofi-askpass";
    mode = "0755";
  };

  hardware = {
    bluetooth.enable = true;
    graphics.enable = true;
    opengl = {
      enable = true;
    };
  };

  services = {
    xserver.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "sugar-dark";
      };
      defaultSession = "hyprland";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    printing.enable = true;
    pulseaudio.enable = false;
  };

  programs.zsh.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.setPath.enable = true;
  };

  security = {
    rtkit.enable = true;
    pam.services.hyprlock = {};
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  system.stateVersion = "24.05";
}
