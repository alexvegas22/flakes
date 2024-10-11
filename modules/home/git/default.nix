{ pkgs, ... }: {
  programs.git.enable = true;
  programs.git.userName = "Alexandre Baudouin Vegasm";
  programs.git.userEmail = "alexrbvegas@gmail.com";
  home.packages = [ pkgs.gh ];
}
