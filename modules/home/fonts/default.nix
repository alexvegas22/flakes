{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    font-awesome
    powerline-fonts
    powerline-symbols
    dina-font
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
  ];
#  ++ (builtins.attrValues nerd-fonts);
}
