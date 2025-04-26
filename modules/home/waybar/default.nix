{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        "layer" = "top";
        "position" = "bottom";

        "modules-left" = [
          "hyprland/workspaces"
        ];

        "modules-center" = [
          "hyprland/window"
        ];

        "modules-right" = [
          "tray"
          "temperature"
          "cpu"
          "memory"
          "pulseaudio"
          "battery"
          "network"
          "clock"
        ];

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "format" = "{name}";
        };

        "clock" = {
          "interval" = 10;
          "format" = "{:%a %d %B %H:%M}";
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
          "format" = "󰍛 {usage}%";
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
