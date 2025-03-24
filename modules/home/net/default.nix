{ inputs, pkgs, system, ... }:

{
  home.packages = (with pkgs; [
    i2p
    mullvad-vpn
    onionshare-gui
    qbittorrent
    shallot
    tor
    torsocks
    tor-browser
  ]);

}
