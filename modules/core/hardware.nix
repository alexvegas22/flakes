{ pkgs, lib, ... }: {
  hardware = {
    opentabletdriver.enable = true;
    keyboard.zsa.enable  = true;
  };
}
