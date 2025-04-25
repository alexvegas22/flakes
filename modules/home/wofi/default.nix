{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    style = ./style.css;
  };
}
