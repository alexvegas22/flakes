{...}: {
  security.pki.caCertificateBlacklist = [
    "Comodo AAA Services root"
    "emSign ECC Root CA - G3"
  ];
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.waylock = {};
}
