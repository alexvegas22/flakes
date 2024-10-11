{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "intl";
    exportConfiguration = true;
    libinput.enable = true;
  };
}
