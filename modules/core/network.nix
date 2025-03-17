{ pkgs, ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    firewall = {
      allowedTCPPorts = [ 22 80 443 6530 6379 5000 5173 18080 ] ;
      allowedUDPPorts = [ 51820 18080 ];
      checkReversePath = "loose"; 
    };

    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "wlp108s0";

    };
    
    wireguard.interfaces = {
      wg0 = {
        privateKeyFile = "/etc/wireguard/client_privatekey";
        ips = [ "192.168.1.2/24" ];
        peers = [
          {
            publicKey = "QVUxPaEFy0X9th7AhhOw/BHqxeLfapSxXdjHfdqhq28=";
            endpoint = "v34l.com:51820";
            allowedIPs = [ "0.0.0.0/0" ];
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
