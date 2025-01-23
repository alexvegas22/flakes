{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Alexandre Baudouin Vegas";
    userEmail = "alexrbvegas@gmail.com";
  };
  home.packages = [ pkgs.gh ];
}
