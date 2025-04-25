{ pkgs, ... }: {
  programs.wofi = {
    enable = true;
    style = ./style.css;
  };
}
