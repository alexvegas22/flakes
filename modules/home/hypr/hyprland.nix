{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "emacs --daemon && sleep 1 && emacsclient -c -a ''"
        "[workspace 9 silent] keepassxc"
        "[workspace 8 silent] mullvad-vpn"
        "[workspace 3 silent] discord"
        "[workspace 2 silent] zen"
        "waybar & hyprpaper & swaync"
        "nm-applet -indicator"
        "blueman-manager -indicator"
        "libinput-gestures"
        "hypridle"
        "[workspace 1 silent] emacsclient -c"
        "otd-daemon"
      ];

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
        "QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
        "GDK_BACKEND=wayland,x11"
        "SDL_VIDEODRIVER=wayland"
        "CLUTTER_BACKEND=wayland"
        "MOZ_ENABLE_WAYLAND=1"
        "DISPLAY=:0"
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
        "col.active_border"= "rgba(555555ee) rgba(aa5577ee) 270deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "master";
        "$mainMod" = "SUPER";
      };

      decoration = {
        rounding = 0;
        active_opacity = 0.95;
        inactive_opacity = 0.90;
        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          vibrancy = 0.3696;
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
        animate_manual_resizes = false;
        middle_click_paste = false;
      };

      input = {
        kb_layout = "us";
        kb_variant = "intl";
        kb_options = "ctrl:nocaps";
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

      bind = [
        ",XF86AudioRaiseVolume, exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        "$mainMod SHIFT, return, exec, foot"
        "$mainMod SHIFT, D, exec, discord"
        "$mainMod SHIFT, S, exec, signal-desktop"
        "$mainMod SHIFT, F, exec, zen"
        "$mainMod SHIFT, K, exec, krita"
        "$mainMod SHIFT, R, exec, record"
        "$mainMod SHIFT, N, exec, swaync-client -t"
        "$mainMod, P, exec, wofi --show drun"
        "$mainMod SHIFT, E, exec, emacsclient -c"
        ", Print, exec, grim -g \"$(slurp)\" ~/Images/Screenshots/$(date +'%s_grim.png') && wl-copy < ~/Images/Screenshots/$(date +'%s_grim.png')"
        "$mainMod, Q , exec,~/.local/bin/wofi-power"
        "$mainMod SHIFT, W, exec, xournalpp"
        "$mainMod SHIFT, C, killactive,"
        ",XF86Display , exec, hyprlock"
        "$mainMod, X, togglespecialworkspace, special"
        "$mainMod SHIFT, X, movetoworkspacesilent, special"
        "$mainMod, Return, layoutmsg, swapwithmaster"
        "$mainMod, j, layoutmsg, cycleprev  # Focus down"
        "$mainMod, k, layoutmsg, cyclenext  # Focus down"
        "$mainMod, i, layoutmsg, addmaster # Increment master windows"
        "$mainMod, d, layoutmsg, removemaster # Decrement master windows"
        "$mainMod, h, resizeactive, -100 0 "
        "$mainMod, l, resizeactive, 100 0 "
        "$mainMod, t, togglesplit  # Tiling layout"
        "$mainMod, f, togglefloating # Floating layout"
        "$mainMod, m, fullscreen # Monocle layout"
        "$mainMod, 0, workspace, 10  # Map to workspace 10 as an example"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, comma, movefocus, prev  # Focus previous monitor"
        "$mainMod, period, movefocus, next # Focus next monitor"
        "$mainMod SHIFT, comma, movetoworkspace, -1  # Move window to previous monitor"
        "$mainMod SHIFT, period, movetoworkspace, +1 # Move window to next monitor"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod, period, workspace, e+1"
        "$mainMod, comma, workspace, e-1"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "float,  title:^(Unlock Database - KeePassXC)$"
        "center, title:^(Unlock Database - KeePassXC)$"
      ];
    };
  };
}
