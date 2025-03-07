{ inputs, pkgs, system, ... }:

{
  home.packages = [
    inputs.zen-browser.packages."${pkgs.system}".default
  ];

}
