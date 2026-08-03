{pkgs, ...}: {
  networking = {
    hostName = "nixos";
    extraHosts = ''
      142.137.248.40 clubetudiant.etsmtl.ca
    '';
    networkmanager.enable = true;
    networkmanager.plugins = [pkgs.networkmanager-openconnect];
    networkmanager.dns = "none";
    nameservers = [ "9.9.9.9" "142.137.248.40" ];
    firewall = {
      allowedTCPPorts = [22 80 443 631 5353 6530 6379 5000 5173 9050 9051 18080 51049 35308];
      allowedUDPPorts = [51820 51049 18080 34197 37259 35308 39088];
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
        dns = ["192.168.2.51"];
        mtu = 1412;
        peers = [
          {
            publicKey = "NG2zL6LVxfcfubAi3ydxCnJfpCagX/HaMXZ8ubrHQCM=";
            allowedIPs = ["0.0.0.0/0" "192.168.0.0/22"];
            endpoint = "v34l.com:51820";
            persistentKeepalive = 25;
          }
        ];
      };

      # user01 = {
      #   configFile = "/etc/wireguard/user01.conf";
      # };

      # cedille = {
      #   configFile = "/etc/wireguard/cedille.conf";
      # };
    };
  };

  boot.kernelModules = ["wireguard"];
}
