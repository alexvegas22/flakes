{ pkgs, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        color = "rgba(25, 25, 25, 1)";
        blur_passes = 2;
        contrast = 1;
        brightness = 0.5;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };

      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
        ignore_empty_input = true;
        immediate_render = true;
      };

      input-field = {
        size = "250, 60";
        outline_thickness = 0;
        dots_size = 0.2;
        dots_spacing = 0.35;
        font_family = "JetBrains Mono";
        dots_center = true;
        outer_color = "rgba(170, 0, 0, 1)";
        inner_color = "rgba(40, 40, 40, 1)";
        font_color = "rgba(255, 255, 255, 1)";
        fade_on_empty = false;
        rounding = 0;
        check_color = "rgba(170, 0, 0, 1)";
        hide_input = false;
        position = "0, -200";
        halign = "center";
        valign = "center";
        shadow_passes = 5;
        shadow_range = 5;
        fail_text = "<i>nice try ;p</i>";
      };

      label = [
        {
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "rgba(255, 255, 255, 1)";
          font_size = 22;
          font_family = "JetBrains Mono";
          position = "0, 300";
          halign = "center";
          valign = "center";
          padding = "10, 5";
          shadow_passes = 5;
          shadow_range = 15;
        }
        {
          text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
          color = "rgba(255, 255, 255, 1)";
          font_size = 95;
          font_family = "JetBrains Mono Extrabold";
          position = "0, 200";
          halign = "center";
          valign = "center";
          padding = "20, 10";
          shadow_passes = 5;
          shadow_range = 15;
        }
      ];
    };
  };
}
