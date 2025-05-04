{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = false;
        no_fade_in = true;
        no_fade_out = true;
      };

      label = [
        # DATE
        {
          text = "cmd[update:1000] echo \"$(date +\"%A, %d %B\")\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          font_family = "JetBrains Mono";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        # TIME
        {
          text = "cmd[update:1000] echo \"$(date +\"%-I:%M\")\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          font_family = "JetBrains Mono Extrabold";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];

      background = {
        path = "$HOME/nixos/screenshot/749693.jpg";
        blur_passes = 2;
        blur_size = 5;
      };

      input-field = {
        size = "275, 60";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.35; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.2)";
        font_color = "#cdd6f4";
        fade_on_empty = false;
        rounding = -1;
        check_color = "rgb(204, 136, 34)";
        placeholder_text = "<i><span foreground='##cdd6f4'>Input Password</span></i>";
        hide_input = false;
        position = "0, -200";
        halign = "center";
        valign = "center";
        capslock_color = "rgb(255, 134, 0)";
      };
    };
  };
}
