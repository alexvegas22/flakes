{ config,pkgs, ...} :

{
  programs = {
    quickshell = {
      enable = true;
    };

    wofi.enable = true;

    # hyprlock = {
    #   enable = true;
    #   settings = {
    #     background = {
    #       color = "rgba(25, 25, 25, 1)";
    #       blur_passes = 2;
    #       contrast = 1;
    #       brightness = 0.5;
    #       vibrancy = 0.2;
    #       vibrancy_darkness = 0.2;
    #     };

    #     general = {
    #       no_fade_in = true;
    #       no_fade_out = true;
    #       hide_cursor = false;
    #       grace = 0;
    #       ignore_empty_input = true;
    #       immediate_render = true;
    #     };

    #     input-field = {
    #       size = "250, 60";
    #       outline_thickness = 0;
    #       dots_size = 0.2;
    #       dots_spacing = 0.35;
    #       font_family = "JetBrains Mono";
    #       dots_center = true;
    #       outer_color = "rgba(170, 0, 0, 1)";
    #       inner_color = "rgba(40, 40, 40, 1)";
    #       font_color = "rgba(255, 255, 255, 1)";
    #       fade_on_empty = false;
    #       rounding = 0;
    #       check_color = "rgba(170, 0, 0, 1)";
    #       hide_input = false;
    #       position = "0, -200";
    #       halign = "center";
    #       valign = "center";
    #       shadow_passes = 5;
    #       shadow_range = 5;
    #       fail_text = "<i>nice try ;p</i>";
    #     };

    #     label = [
    #       {
    #         text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
    #         color = "rgba(255, 255, 255, 1)";
    #         font_size = 22;
    #         font_family = "JetBrains Mono";
    #         position = "0, 300";
    #         halign = "center";
    #         valign = "center";
    #         padding = "10, 5";
    #         shadow_passes = 5;
    #         shadow_range = 15;
    #       }
    #       {
    #         text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
    #         color = "rgba(255, 255, 255, 1)";
    #         font_size = 95;
    #         font_family = "JetBrains Mono Extrabold";
    #         position = "0, 200";
    #         halign = "center";
    #         valign = "center";
    #         padding = "20, 10";
    #         shadow_passes = 5;
    #         shadow_range = 15;
    #       }
    #     ];
    #   };
    # };

    waybar = {
      enable = true;
      settings = [
        {
          "layer" = "top";
          "position" = "top";
          "reload_style_on_change"= true;
          "modules-left" = ["niri/workspaces"];
          "modules-center"= ["niri/window"];
          "modules-right"= ["tray" "cpu" "memory" "wireplumber" "network" "custom/notification" "clock" "battery"];

          "hyprland/workspaces" = {
            "persistent-workspaces" = {
              "*" = [ 1 2 3 4 5 ];
            };
          };
          "custom/notification" = {
            "tooltip" = false;
            "format" = "";
            "on-click" = "swaync-client -t -sw";
            "escape" = true;
          };
          "clock" = {
            "format" = "{:%a %d %B %H:%M}";
            "interval" = 1;
            "tooltip-format" = "<tt>{calendar}</tt>";
            "calendar" = {
              "format" = {
                "today" = "<span color ='#fAfBfC'><b>{}</b></span>";
              };
            };
            "actions" = {
              "on-click-right" = "shift_down";
              "on-click" = "shift_up";
            };
          };
          "wireplumber" = {
	          "format" = "{icon}   {volume}%";
	          "format-muted" = "";
	          "on-click" = "helvum";
	          "format-icons" = [""  "" ""];
	        };
          "network" = {
            "format-wifi" = "";
            "format-ethernet" ="";
            "format-disconnected" = "";
            "tooltip-format-disconnected" = "Error";
            "tooltip-format-wifi" = "{essid} ({signalStrength}%)\n{ipaddr}";
            "tooltip-format-ethernet" = "{ifname}\n{ipaddr}";
            "on-click" = "foot nm-connection-editor";
          };
          "network#ethernet" = {
            "interface" = "enp0s31f6";
            "format-ethernet" ="";
            "tooltip-format-ethernet" = "{ifname}\n{ipaddr}";
          };
          "bluetooth" = {
            "format-on" = "󰂯";
            "format-off" = "BT-off";
            "format-disabled" = "󰂲";
            "format-connected-battery" = "{device_battery_percentage}% 󰂯";
            "format-alt" = "{device_alias} 󰂯";
            "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
            "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            "tooltip-format-enumerate-connected" = "{device_alias}\n{device_address}";
            "tooltip-format-enumerate-connected-battery" = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
            "on-click-right" = "blueman-manager";
          };
          "battery" = {
            "interval" = 30;
            "states" = {
              "good" = 95;
              "warning" = 30;
              "critical" = 20;
            };
            "format" = "{capacity}% {icon}";
            "format-charging" = "{capacity}% 󰂄";
            "format-plugged" = "{capacity}% 󰂄 ";
            "format-alt" = "{time} {icon}";
            "format-icons" = [
              "󰁻"
              "󰁼"
              "󰁾"
              "󰂀"
              "󰂂"
              "󰁹"
            ];
          };

          "cpu" = {
            "format" = "󰻠 {usage}%";
            "tooltip" = true;
          };
          "memory" = {
            "format" = "  {}%";
          };
          "temperature" = {
            "critical-threshold" = 80;
            "format" = " {}C";
          };
          "tray" = {
            "icon-size" = 14;
            "spacing" = 10;
          };
        }

      ];
      style = ./waybar-style.css;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Pink-Dark";
      package = pkgs.gruvbox-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [ "pink" ];
        tweakVariants = [ "float" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 12;
    };
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 11;
    };
  };
}
