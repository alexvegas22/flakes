{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "height" = 22;

        "modules-left" = [
          "tray"
        ];
        "modules-center" = [
          "hyprland/window"
        ];
        "modules-right" = [
          "clock"
          "network"
        ];

        "clock" = {
          "interval" = 10;
          "format" = "{:%a %d %B %H:%M}";
          "tooltip" = false;
        };

        "custom/keyboard-layout" = {
          "exec" = "swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | cut -d '\"' -f4";
          "interval" = 30;
          "format" = "  {}";
          "signal" = 1;
          "tooltip" = false;
        };

        "network" = {
          "interval" = 5;
          "format-wifi" = "   {signalStrength}% {essid}";
          "format-ethernet" = "  {ifname}: {ipaddr}/{cidr}";
          "format-disconnected" = "⚠  Disconnected";
          "tooltip-format" = "{ifname}: {ipaddr}";
        };

        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };
      }
      {
        "layer" = "top";
        "position" = "bottom";

        "modules-left" = [];
        "modules-center" = [
          "hyprland/workspaces"
        ];
        "modules-right" = ["temperature" "cpu" "memory" "pulseaudio" "battery"];

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "format" = "{name}";
        };

        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon}  {volume}%";
          "format-bluetooth" = "{icon}  {volume}%";
          "format-muted" = "";
          "format-icons" = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          "on-click" = "pavucontrol";
        };

        "temperature" = {
          "critical-threshold" = 80;
          "interval" = 5;
          "format" = "{icon}  {temperatureC}°C";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
          "tooltip" = true;
        };

        "battery" = {
          "interval" = 10;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}  {capacity}%";
          "format-discharging" = "{icon}  {capacity}%";
          "format-icons" = [
            " "
            " "
            " "
            " "
            " "
          ];
          "tooltip" = true;
        };

        "cpu" = {
          "interval" = 5;
          "on-click" = "foot --title=\"Htop\" --app-id=\"htop\" htop --sort-key=PERCENT_CPU";
          "states" = {
            "warning" = 80;
            "critical" = 95;
          };
          "format" = "󰍛 {usage}󰏰";
        };

        "memory" = {
          "interval" = 5;
          "format" = " {}%";
          "on-click" = "foot --title=\"Htop\" --app-id=\"htop\" htop --sort-key=PERCENT_MEM";
          "states" = {
            "warning" = 70;
            "critical" = 90;
          };
        };
      }
    ];
    style = ./style.css;
  };
}
