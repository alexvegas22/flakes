{pkgs, ...}: {
  networking = {
    hostName = "nixos";
    extraHosts = ''
      142.137.248.40 clubetudiant.etsmtl.ca
      10.194.33.97   git.etsmtl.ca
    '';
    networkmanager.enable = true;
    networkmanager.plugins = [pkgs.networkmanager-openconnect];
    networkmanager.dns = "systemd-resolved";
    # nameservers = [ "9.9.9.9" "142.137.248.40" ];
    firewall = {
      allowedTCPPorts = [
        22 #ssh
        7656 # default sam port
        7070 # default web interface port
        4447 # default socks proxy port
        4444 # default http proxy port
      ];
      allowedUDPPorts = [
        4447 # default socks proxy port
        4444 # default http proxy port
      ];
      checkReversePath = "loose";
    };

    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "wlp108s0";
    };

    wg-quick.interfaces = {
      homelab = {
        autostart = true;
        address = ["10.100.0.2/32"];
        privateKeyFile = "/etc/wireguard/v34l_private.key";
        dns = ["192.168.2.1"];
        mtu = 1412;
        peers = [
          {
            publicKey = "NG2zL6LVxfcfubAi3ydxCnJfpCagX/HaMXZ8ubrHQCM=";
            allowedIPs = ["0.0.0.0/0" "10.100.0.1/24" "192.168.2.1/32"];
            endpoint = " m15ty.com:51820";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };

  boot.kernelModules = ["wireguard"];
}
