{ pkgs, name, email, ... }: {
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
  };
  home.packages = [ pkgs.gh ];
}
