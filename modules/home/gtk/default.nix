{ pkgs, config, ... }:
let 
  monolisa = pkgs.callPackage ../../pkgs/monolisa/monolisa.nix {}; 
  monolisa-nerd = pkgs.callPackage ../../pkgs/monolisa/monolisa-nerd.nix { inherit monolisa; }; 
in
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    font-awesome
    powerline-fonts
    powerline-symbols
    dina-font
    proggyfonts
  ];

  gtk = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 12;
    };
    theme = {
      name = "Gruvbox-Green-Dark";
      package = pkgs.gruvbox-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [ "green" ];
        tweakVariants = [ "macos" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
  
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
