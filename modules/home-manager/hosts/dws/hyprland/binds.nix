{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, Z, exec, $terminal"
      "$mod, Q, killactive,"
      "$mod, M, exit,"
      "$mod, E, exec, $fileManager"
      "$mod, G, togglefloating,"
      "$mod, SPACE, exec, $menu"
      "$mod, P, pseudo, # dwindle"
      "$mod, V, togglesplit, # dwindle"
      "$mod, F, fullscreen,"
      # Move focus by Vim motion
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"
      # Swap active window with opposite
      "$mod SHIFT, H, swapwindow, l"
      "$mod SHIFT, L, swapwindow, r"
      "$mod SHIFT, K, swapwindow, u"
      "$mod SHIFT, J, swapwindow, d"
      # Resize active window by Vim motion
      "$mod CTRL, H, resizeactive, -60 0"
      "$mod CTRL, L, resizeactive, 60 0"
      "$mod CTRL, K, resizeactive, 0 -60"
      "$mod CTRL, J, resizeactive, 0 60"
      # Switch workspaces with mainMod + [0-9]
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod CTRL, 1, workspace, 11"
      "$mod CTRL, 2, workspace, 12"
      "$mod CTRL, 3, workspace, 13"
      "$mod CTRL, 4, workspace, 14"
      "$mod CTRL, 5, workspace, 15"
      "$mod CTRL, 6, workspace, 16"
      "$mod CTRL, 7, workspace, 17"
      "$mod CTRL, 8, workspace, 18"
      "$mod CTRL, 9, workspace, 19"
      "$mod CTRL, 0, workspace, 20"
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod SHIFT CTRL, 1, movetoworkspace, 11"
      "$mod SHIFT CTRL, 2, movetoworkspace, 12"
      "$mod SHIFT CTRL, 3, movetoworkspace, 13"
      "$mod SHIFT CTRL, 4, movetoworkspace, 14"
      "$mod SHIFT CTRL, 5, movetoworkspace, 15"
      "$mod SHIFT CTRL, 6, movetoworkspace, 16"
      "$mod SHIFT CTRL, 7, movetoworkspace, 17"
      "$mod SHIFT CTRL, 8, movetoworkspace, 18"
      "$mod SHIFT CTRL, 9, movetoworkspace, 19"
      "$mod SHIFT CTRL, 0, movetoworkspace, 20"
      # Example special workspace (scratchpad)
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"
      # Scroll through existing workspaces with mainMod + scroll
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      # Waybar switching
      "$mod, W, exec, pkill -SIGUSR1 waybar"
      # "..., exec, XDG_CURRENT_DESKTOP=Hyprland flameshot gui"

      # Screenshots with Dunst notifications
      "$mod, Print, exec, $screenshot"
      "$mod SHIFT, Print, exec, grimblast --notify save area"
      "$mod ALT, Print, exec, grimblast --notify save active"

      # Change wallpaper
      "$mod SHIFT, W, exec, $wallpaper"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    # Requires playerctl
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    # Ignore maximize requests from apps. You'll probably like this.
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
}
