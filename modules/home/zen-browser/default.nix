{ inputs, pkgs, system, ... }:

{
  home.packages = [
  inputs.zen-browser.packages."${system}".default
  ];

}
