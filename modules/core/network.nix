{ pkgs, ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    firewall = {
      allowedTCPPorts = [ 22 80 443 6530 6379 5000 5173];
      allowedUDPPorts = [ 51820 ];
    };


    wireguard.interfaces = {
      wg0 = {
        privateKeyFile = "~/flakes/secrets/client_privatekey";
        ips = [ "10.0.0.3/24" ];
        peers = [
          {
            publicKey = "D50ICKjBj71rwbwZmT3wu6RFLjXO61O1AOjthEwVIjg=";
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
