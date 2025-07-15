{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "reload_style_on_change"= true;
        "modules-left" = ["hyprland/workspaces"];
        "modules-center"= ["hyprland/window"];
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
          "interval" =30;
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
    style = ./style.css;
  };
}
