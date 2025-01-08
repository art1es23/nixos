{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      # variables = [ "--all" ];
    };
    settings = {
      monitor = ",preferred,auto,1";

      env = [
        "XCURSOR_SIZE,22"
        "HYPRCURSOR_SIZE,22"
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/screens"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun -show-icons";
      "$mod" = "SUPER";

      "exec-once" = [
        "waybar & swww"
        "nm-applet --indicator"
        "blueman-applet"
        "hypridle"
        "wl-clipboard"
        "$terminal"
        "firefox"
        "telegram-desktop"
      ];
    };
  };
}
