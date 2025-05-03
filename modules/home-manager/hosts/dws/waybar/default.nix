{ ... }:

{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;
        margin-top = 5;
        margin-left = 5;
        margin-right = 5;
        margin-bottom = 0;
        spacing = 1;
        modules-left = [
          "battery"
          "keyboard-state"
          "hyprland/workspaces"
          "river/tags"
          "tray"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "group/music"
          "cpu"
          "memory"
          "temperature"
          "clock"
          "group/custom-group"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          "on-click" = "activate";
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "󰈹";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "magic" = "";
          };

          persistent-workspaces = {
            "*" = 9;
          };
        };

        "group/custom-group" = {
          "orientation" = "horizontal";
          "modules" = [
            "idle_inhibitor"
            "custom/bluetooth"
            # "custom/kdeconnect"
            "custom/wifi"
          ];
        };

        "group/music" = {
          "orientation" = "horizontal";
          "modules" = [
            "wireplumber"
          ];
        };

        "hyprland/window" = {
          "format" = "{}";
          "separate-outputs" = true;
        };

        "river/tags" = {
          "num-tags" = 7;
          "tag-labels" = [
            ""
            "󰈹"
            ""
            ""
            ""
            ""
            "󰠮"
            ""
            ""
            ""
          ];
        };

        "tray" = {
          "icon-size" = 16;
          "spacing" = 5;
          "show-passive-items" = true;
        };

        "clock" = {
            "format" = " {:%H:%M}"; 
            "format-alt" = "{:%A, %B %d, %Y (%R)}"; 
            "tooltip-format" = "<tt><small>{calendar}</small></tt>"; 
            "calendar" = {
                        "mode"          = "year"; 
                        "mode-mon-col"  = 3;
                        "weeks-pos"     = "right"; 
                        "on-scroll"     = 1;
                        "format" = {
                                  "months" =     "<span color='#ffead3'><b>{}</b></span>"; 
                                  "days" =       "<span color='#ecc6d9'><b>{}</b></span>"; 
                                  "weeks" =      "<span color='#99ffdd'><b>W{}</b></span>"; 
                                  "weekdays" =   "<span color='#ffcc66'><b>{}</b></span>"; 
                                  "today" =      "<span color='#ff6699'><b><u>{}</u></b></span>";
                                  };
                        };
            "actions" =  {
                        "on-click-right" = "mode"; 
                        "on-scroll-up" = "shift_up"; 
                        "on-scroll-down" = "shift_down";
                        };
        };

        "temperature" = {
          "critical-threshold" = 80;
          "interval" = 2;
          "format" = " {temperatureC:>2}°C";
          "format-icons" = [
            ""
            ""
            ""
          ];
          "on-click" = "hyprctl dispatcher togglespecialworkspace monitor";
        };

        "cpu" = {
          "interval" = 2;
          "format" = " {usage:>2}%";
          "on-click" = "bash $HOME/.config/scripts/monitoring";
        };

        "memory" = {
          "interval" = 2;
          "format" = " {:>2}%";
          "on-click" = "bash $HOME/.config/scripts/monitoring";
        };

        "disk" = {
          "interval" = 15;
          "format" = "󰋊 {percentage_used:>2}%";
          "on-click" = "bash $HOME/.config/scripts/monitoring";
        };

        "backlight" = {
          "format" = "{icon} {percent:>2}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "network" = {
          "interval" = 1;
          "format-wifi" = "  {bandwidthTotalBytes:>2}";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format-wifi" = " {ipaddr} ({signalStrength}%)";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "󰀦 Disconnected";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
          "on-click" = "bash $HOME/.config/scripts/monitoring";
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "{icon} {volume}% 󰂯";
          "format-bluetooth-muted" = "󰖁 {icon} 󰂯";
          "format-muted" = "󰖁 {volume}%";
          "format-icons" = {
            "headphone" = "󰋋";
            "hands-free" = "󱡒";
            "headset" = "󰋎";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol";
        };

        "wireplumber" = {
          "format" = "{icon} {volume:>3}%";
          "format-muted" = "󰖁 {volume:>3}%";
          "format-icons" = [
            ""
            ""
            ""
          ];
        };

        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "󰈈";
            "deactivated" = "󰈉";
          };
        };

        "custom/power" = {
          "format" = "{icon}";
          "format-icons" = " ";
          "exec-on-event" = "true";
          "on-click" = "bash $HOME/.config/rofi/scripts/rofi-power";
          "tooltip" = false;
        };

        "custom/bluetooth" = {
          "format" = "{icon}";
          "format-icons" = "";
          "exec-on-event" = "true";
          "on-click" = "bash $HOME/.config/rofi/scripts/rofi-bluetooth";
          "tooltip-format" = "Bluetooth Menu";
        };

        "custom/wifi" = {
          "format" = "{icon}";
          "format-icons" = "";
          "exec-on-event" = "true";
          "on-click" = "bash $HOME/.config/rofi/scripts/rofi-wifi";
          "tooltip-format" = "Wifi Menu";
        };

        "custom/separator" = {
          "format" = "{icon}";
          "format-icons" = "|";
          "tooltip" = false;
        };

        # "custom/notification" = {
        #   "tooltip" = false;
        #   "format" = "{icon} {}";
        #   "format-icons" = {
        #     "notification" = "<span foreground='red'><sup></sup></span>";
        #     "none" = "";
        #     "dnd-notification" = "<span foreground='red'><sup></sup></span>";
        #     "dnd-none" = "";
        #     "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
        #     "inhibited-none" = "";
        #     "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
        #     "dnd-inhibited-none" = "";
        #   };
        #   "return-type" = "json";
        #   "exec-if" = "which swaync-client";
        #   "exec" = "swaync-client -swb";
        #   "on-click" = "swaync-client -t -sw";
        #   "on-click-right" = "swaync-client -d -sw";
        #   "escape" = true;
        # };

        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "{name} {icon}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };

        "wlr/taskbar" = {
          "format" = "{icon}";
          "icon-size" = 18;
          "tooltip-format" = "{title}";
          "on-click" = "activate";
          "on-click-middle" = "close";
          "ignore-list" = [
            "kitty"
            "wezterm"
            "foot"
            "footclient"
          ];
        };

        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{icon} {time}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
          "on-click" = "bash $HOME/.config/rofi/scripts/rofi-battery";
        };

        "backlight/slider" = {
          "min" = 0;
          "max" = 100;
          "orientation" = "horizontal";
          "device" = "intel_backlight";
        };
      };
    };
  };
}
