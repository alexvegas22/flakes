{ pkgs, lib, username, ... }: {
  users.users.${username}.extraGroups = [ "wireshark"];
  programs.wireshark = {
    enable = true;   
  };
}
