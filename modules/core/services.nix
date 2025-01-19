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
    # Enable CUPS to print documents.
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
        PasswordAuthentication = true;
        AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password";
      };
    };
    # Enable the GNOME Desktop Environment.
    displayManager.sddm.enable = true;
    displayManager.sddm.theme = "where_is_my_sddm_theme";


    udev.packages = [ pkgs.yubikey-personalization ];
    emacs = {
      enable = true;
      defaultEditor = true;
    };
    emacs.package = with pkgs; (
      (emacsPackagesFor emacs).emacsWithPackages (
        epkgs: [ epkgs.vterm ]
      )
    );
  };
}
