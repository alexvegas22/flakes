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
  };

  boot.kernelModules = [ "wireguard" ];

  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

}
