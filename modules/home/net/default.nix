{ inputs, pkgs, system, ... }:

{
  home.packages = (with pkgs; [
    i2p
    mullvad-vpn
    onionshare
    onionshare-gui
    qbittorrent
    shallot
    tor
    tor-browser
  ]);

}
