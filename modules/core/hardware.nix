{ pkgs, lib, ... }: {
  hardware = {
    opentabletdriver.enable = true;
    keyboard.zsa.enable  = true;
  };
  services.xserver.digimend.enable = true;
}
