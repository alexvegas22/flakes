{ pkgs, config, ... }:
{

  gtk3 = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 10;
    };

    theme = {
      name = "Colloid-Red-Dark";
      package = pkgs.colloid-gtk-theme.override {
        colorVariants = ["red"];
        tweaks = ["gruvbox" "rimless"];
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
  };
}
