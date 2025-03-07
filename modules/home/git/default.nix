{ pkgs, name, email, ... }: {
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
  };
  home.packages = [ pkgs.gh ];
}
