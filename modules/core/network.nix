{ pkgs, ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    firewall = {
      allowedTCPPorts = [ 22 80 443 631 5353 6530 6379 5000 5173 9050 9051 18080 ] ;
      allowedUDPPorts = [ 51820 18080 ];
      checkReversePath = "loose";
    };

    networkmanager.wifi.backend = "iwd";
    wireless = {
      iwd = {
        enabled = true;
        settings = {
          IPv6 = {
            Enabled = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "wlp108s0";
    };
  };

  boot.kernelModules = [ "wireguard" ];

  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

}
