{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core/laptop-default.nix
  ];
  powerManagement.cpuFreqGovernor = "performance";
}
