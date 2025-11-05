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
    displayManager.ly.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };
  environment.systemPackages = with pkgs; [
    alacritty fuzzel swaylock mako swayidle
  ];
}
