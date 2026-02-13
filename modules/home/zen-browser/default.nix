{ inputs, pkgs, system, ... }:

{
  home.packages = [
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];

}
