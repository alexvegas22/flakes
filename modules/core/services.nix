{pkgs, ...}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    libinput.enable = true;
    udisks2.enable = true;
    pcscd.enable = true;
    mullvad-vpn.enable = true;
    blueman.enable = true;
    printing.enable = true;
    fstrim.enable = true;
    guix.enable = false;
    etcd = {
      enable = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password";
      };
    };
    displayManager.ly = {
      enable = true;
      package = pkgs.ly;
      settings = {
        animation = "Doom";
        auth_fails = 3;
        battery_id = "BAT0";
        border_fg = "0xAA5577";
        box_title = "V34L";
      };
    };
    udev.packages = [ pkgs.yubikey-personalization ];
  };
}
