{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    layout = "us";
    variant = "intl";
    exportConfiguration = true;
    services.xserver.libinput.enable = true;
  };
}
