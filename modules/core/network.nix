{ ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    firewall.allowedTCPPorts = [ 22 80 443 6530 6379 5000 5173];
    extraHosts = ''
    192.168.0.17 v34l.com
    '';
  };
}
