{
  inputs,
  pkgs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    i2p
    mullvad-vpn
    qbittorrent
    tor
    torsocks
    tor-browser
  ];
}
