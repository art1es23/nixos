{
  wayland.windowManager.hyprland.settings = {
    # hyprctl clients - get apps' class 
    windowrule = [
      "float,^(Rofi)$"
      "float,^(org.pulseaudio.pavucontrol)$"
      "size 730 400,^(org.pulseaudio.pavucontrol)$"
      "move 1100 70,^(org.pulseaudio.pavucontrol)$"
    ];

    # Ignore maximize requests from apps. You'll probably like this.
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      "workspace 2,class:(firefox)"
      "workspace 2,class:(google-chrome)"
      # "workspace 3,title:^(Yazi)*"
      "workspace 5,class:(telegram)"
      "workspace 5,class:(discord)"
      "workspace 6,class:(notion)"
      "workspace 6,class:(obsidian)"
      "workspace 8,class:(spotify)"
      # "workspace magic,class:(1Password)"
      # "float,title:^(Yazi)*"
    ];
  };
}
