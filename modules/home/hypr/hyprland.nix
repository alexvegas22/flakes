{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        ",preferred,auto,1"
        "HDMI-A-1,1920x1080,auto,1"
      ];

      env = [
        "QT_AUTO_SCREEN_SCALE_FACTOR=1"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_QPA_PLATFORMTHEME=qt5ct"
        "QT_SCALE_FACTOR=1"
        "GDK_SCALE=1"
        "MOZ_ENABLE_WAYLAND=1"
      ];

      exec-once = [
        "emacs --daemon"
        "[workspace 9 silent] keepassxc"
        "[workspace 8 silent] mullvad-vpn"
        "[workspace 3 silent] discord"
        "[workspace 2 silent] emacsclient -c"
        "firefox"
        "waybar & hyprpaper & dunst"
        "nm-applet -indicator"
        "blueman-manager -indicator"
        "libinput-gestures"
        "hypridle"
        "otd-daemon"
      ];

      xwayland = {
        force_zero_scaling = false;
        use_nearest_neighbor = false;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_touch = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 400;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_create_new = true;
        workspace_swipe_cancel_ratio = 0.15;
        workspace_swipe_forever = true;
      };

      general = {
        gaps_in = 1;
        gaps_out = 2;
        border_size = 1;
        col = {
          active_border = "rgba(555555ee) rgba(aa0000ee) 270deg";
          inactive_border = "rgba(595959aa)";
        };
        resize_on_border = false;
        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier,0.1,0.9,0.1,1";
        animation = [
          "windows,1,7,myBezier"
          "windowsOut,1,7,default,popin 80%"
          "border,1,10,default"
          "borderangle,1,8,default"
          "fade,1,7,default"
          "workspaces,1,6,default"
        ];
      };

      master = {
        new_status = "slave";
        inherit_fullscreen = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "intl";
        kb_options = "compose:ralt,ctrl:nocaps";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
        tablet = {
          output = "current";
        };
      };

      plugin.touch_gestures = {
        sensitivity = 4.0;
        workspace_swipe_fingers = 3;
        workspace_swipe_edge = "d";
        long_press_delay = 400;
        edge_margin = 10;
      };
      extraConfig = ''
        $terminal = foot
        $fileManager = pcmanfm
        $menu = wofi --show drun
        $browser = firefox

        $mainMod = SUPER # Sets "Windows" key as main modifier

        bind = ,XF86AudioRaiseVolume, exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1  
        bind = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1  
        bind = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle
        bind = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle
        bind = ,XF86MonBrightnessUp, exec, brightnessctl set +10%
        bind = ,XF86MonBrightnessDown, exec, brightnessctl set 10%-
        bind = $mainMod SHIFT, return, exec, $terminal
        bind = $mainMod SHIFT, D, exec, discord
        bind = $mainMod SHIFT, S, exec, signal-desktop
        bind = $mainMod SHIFT, F, exec, $browser
        bind = $mainMod SHIFT, K, exec, krita
        bind = $mainMod, P, exec, $menu
        bind = $mainMod SHIFT, E, exec, emacsclient -c
        bind = , Print, exec, grim -g "$(slurp)" ~/Images/Screenshots/$(date +'%s_grim.png') && wl-copy < ~/Images/Screenshots/$(date +'%s_grim.png')
        bind = $mainMod, Q , exec,~/.local/bin/wofi-power
        bind = $mainMod SHIFT, L, exec, 
        bind = $mainMod SHIFT, C, killactive,
        bind = ,XF86Display , exec, hyprlock
        bind = $mainMod, X, togglespecialworkspace, special
        bind = $mainMod SHIFT, X, movetoworkspacesilent, special
        bind = $mainMod, Return, layoutmsg, swapwithmaster
        bind = $mainMod, j, layoutmsg, cycleprev  # Focus down
        bind = $mainMod, k, layoutmsg, cyclenext  # Focus down
        bind = $mainMod, i, layoutmsg, addmaster # Increment master windows
        bind = $mainMod, d, layoutmsg, removemaster # Decrement master windows
        bind = $mainMod, h, resizeactive, -100 0 
        bind = $mainMod, l, resizeactive, 100 0 
        bind = $mainMod, t, togglesplit  # Tiling layout
        bind = $mainMod, f, togglefloating # Floating layout
        bind = $mainMod, m, fullscreen # Monocle layout
        bind = $mainMod, 0, workspace, 10  # Map to workspace 10 as an example
        bind = $mainMod SHIFT, 0, movetoworkspace, 10
        bind = $mainMod, comma, movefocus, prev  # Focus previous monitor
        bind = $mainMod, period, movefocus, next # Focus next monitor
        bind = $mainMod SHIFT, comma, movetoworkspace, -1  # Move window to previous monitor
        bind = $mainMod SHIFT, period, movetoworkspace, +1 # Move window to next monitor
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
        bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
        bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
        bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
        bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
        bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
        bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
        bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
        bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
        bind = $mainMod, period, workspace, e+1
        bind = $mainMod, comma, workspace, e-1
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow

        windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.
        windowrulev2 = workspace:special_workspace, title:(.*)(- TI-Nspire)$
        windowrulev2 = float,  title:^(Unlock Database - KeePassXC)$
        windowrulev2 = center, title:^(Unlock Database - KeePassXC)$

        '';
    };
  };
}
