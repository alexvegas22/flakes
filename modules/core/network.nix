{ pkgs, ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    networkmanager.dns = "none";
    nameservers = [ "9.9.9.9" "142.137.248.40"];
    firewall = {
      allowedTCPPorts = [ 22 80 443 631 5353 6530 6379 5000 5173 9050 9051 18080 ] ;
      allowedUDPPorts = [ 51820 18080 34197 ];
      checkReversePath = "loose";
    };

    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "wlp108s0";
    };

    wg-quick.interfaces = {
      homelab = {
        autostart = false;
        address = [ "10.100.0.2/32" ];
        privateKeyFile = "/etc/wireguard/v34l_private.key";
        dns = [ "192.168.2.51"];
        mtu = 1412;
        peers = [
          {
            publicKey = "NG2zL6LVxfcfubAi3ydxCnJfpCagX/HaMXZ8ubrHQCM=";
            allowedIPs = [ "0.0.0.0/0" "192.168.0.0/22" ];
            endpoint = "v34l.com:51820";
            persistentKeepalive = 25;
          }
        ];
      };

      cedille = {
        autostart = false;
        address = [ "10.223.229.9/24" ];
        privateKeyFile = "/etc/wireguard/v34l_private.key";
        dns = [ "1.1.1.1"];
        peers = [
          {
            publicKey = "uh7m6xrXegGrjVID0yiXe0dUjDtYDrs6I6gqSNiZVX4=";
            allowedIPs = [ "0.0.0.0/0" ];
            endpoint = "142.137.247.116:51821";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };

  boot.kernelModules = [ "wireguard" ];

  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];
}
