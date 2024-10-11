{pkgs, ...}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    libinput.enable = true;
    udisks2.enable = true;
    pcscd.enable = true;
    
    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.sddm.enable = true;
    displayManager.sddm.theme = "where-is-my-sddm-theme";


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
