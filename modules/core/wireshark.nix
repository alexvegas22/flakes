{ pkgs, lib, ... }: {
  users.users.alex.extraGroups = [ "wireshark"];
  programs.wireshark = {
    enable = true;   
  };
}
