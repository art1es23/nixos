{ ... }:

{
  services = {
    dunst = {
      enable = true;
      settings = {
        colors = {
          background = "#1a1b26d9";
          foreground = "#c0caf5";
        };

        global = {
          ### Display ###
          follow = "mouse";

          width = 375;
          height = 200;
          offset = "30x30";
          indicate_hidden = true;
          shrink = false;
          transparency = 30;
          notification_height = 0;
          separator_height = 3;
          padding = 12;
          horizontal_padding = 12;
          frame_width = 2;
          corner_radius = 10;

          frame_color = "#33ccff";
          separator_color = "auto";
          sort = true;
          idle_threshold = 120;

          ### Text ###
          font = "Fira Code 9";
          line_height = 0;
          markup = "full";

          # Message format
          format = "<b>%s </b>\n%b";
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 60;
          word_wrap = true;
          ellipsize = "middle";
          ignore_newline = false;
          stack_duplicates = true;
          hide_duplicate_count = false;
          show_indicators = true;

          ### Icons ###
          icon_position = "left";
          max_icon_size = 64;

          ### History ###
          sticky_history = true;
          history_length = 50;

          ### Misc/Advanced ###
          dmenu = "/usr/bin/rofi -show run -p dunst:";
          browser = "/usr/bin/firefox";
          always_run_script = true;
          title = "Dunst";
          class = "Dunst";
          startup_notification = false;
          force_xinerama = false;
          verbosity = "mesg";
        };

        experimental = {
          per_monitor_dpi = false;
        };

        shortcuts = {
          close = "ctrl+shift+space";
          history = "ctrl+space";
          # close_all = "ctrl+shift+space";
          context = "ctrl+shift+period";
        };

        urgency_low = {
          background = "colors.background";
          foreground = "colors.foreground";
          timeout = 10;
        };

        urgency_normal = {
          background = "colors.background";
          foreground = "colors.foreground";
          timeout = 10;
        };

        urgency_critical = {
          background = "colors.background";
          foreground = "colors.foreground";
          frame_color = "#8C3D45";
          timeout = 10;
        };
      };
    };
  };
}
