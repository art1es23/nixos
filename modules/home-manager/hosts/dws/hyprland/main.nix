{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      # variables = [ "--all" ];
    };
    settings = {
      "$screen1" = "eDP-1";
      "$screen2" = "HDMI-A-1";

      monitor = [
        "$screen1,1920x1080@60.00Hz,0x0,1"
        "$screen2,3840x2160@60.00Hz,0x-1728,1.25"
      ];

      workspace = [
        "1,monitor:$screen2,default:true"
        "2,monitor:$screen2,default:true"
        "3,monitor:$screen2,default:true"
        "5,monitor:$screen1,default:true"
        "6,monitor:$screen1,default:true"
        "8,monitor:$screen1,default:true"
      ];

      env = [
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,34"                # For screen1 (default scaling)
        "HYPRCURSOR_SIZE,40"             # For screen2 (26 * 1.25 ≈ 32)
        "MOZ_ENABLE_WAYLAND,1"
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        # "QT_SCALE_FACTOR,1"
        "XDG_SCREENSHOTS_DIR,$HOME/Pictures/Screenshots"
        "GRIMSHOT_DIR,$HOME/Pictures/Screenshots"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "kitty yazi";
      "$menu" = "bash $HOME/.config/rofi/scripts/rofi-launcher";
      "$screenshot" = "bash $HOME/.config/grimblast/scripts/screenshot.sh";
      "wallpaper" = "bash $/.config/rofi/scripts/rofi-wallpaper"
      "$mod" = "SUPER";

      "exec-once" = [
        "waybar & swww"
        "nm-applet --indicator"
        "blueman-applet"
        "hypridle"
        "wl-clipboard"
        "[workspace 1 silent] $terminal"
        "[workspace 2 silent] firefox"
        "[workspace 5 silent] telegram-desktop"
      ];
    };
  };
}
