{ config, pkgs, username, ... }:

{
  # Add user to libvirtd group
  users.users.${username}.extraGroups = [ "libvirtd" "docker"];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    docker
    libvirt
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    virtiofsd
    virtio-win
    win-spice
  ];

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
