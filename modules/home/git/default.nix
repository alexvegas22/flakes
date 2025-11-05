{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings.user = {
      name = "Alexandre Baudouin Vegas";
      email = "alexrbvegas@gmail.com";
    };
  };
  home.packages = [ pkgs.gh ];
}
