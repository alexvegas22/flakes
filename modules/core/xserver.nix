{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "intl";
    exportConfiguration = true;
    libinput.enable = true;
  };
}
