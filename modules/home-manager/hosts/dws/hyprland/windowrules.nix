{
  wayland.windowManager.hyprland.settings = {
    # hyprctl clients - get apps' class 
    windowrule = [
      # "float,^(org.telegram.desktop)$"
      "float,^(Rofi)$"
      "float,^(org.pulseaudio.pavucontrol)$"
      "size 730 400,^(org.pulseaudio.pavucontrol)$"
      "move 1100 70,^(org.pulseaudio.pavucontrol)$"
    ];

    # Ignore maximize requests from apps. You'll probably like this.
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      "workspace 5,class:(telegram)"
    ];
  };
}
