{ config, pkgs, username, ... }:

{
  # Add user to libvirtd group
  users.users.${username}.extraGroups = [ "libvirtd" "docker"];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
    docker.enable = true;
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
