{ self
, pkgs
, lib
, inputs
, ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    git-lfs
  ];

  environment.sessionVariables = {
    WAYLAND_DISPLAY = "wayland-1";
    NIXOS_OZONE_WL = "1";
  };


  time.timeZone = "America/Montreal";
  i18n.defaultLocale = "en_US.UTF-8";

   i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_CA.UTF-8";
    LC_IDENTIFICATION = "fr_CA.UTF-8";
    LC_MEASUREMENT = "fr_CA.UTF-8";
    LC_MONETARY = "fr_CA.UTF-8";
    LC_NAME = "fr_CA.UTF-8";
    LC_NUMERIC = "fr_CA.UTF-8";
    LC_PAPER = "fr_CA.UTF-8";
    LC_TELEPHONE = "fr_CA.UTF-8";
    LC_TIME = "fr_CA.UTF-8";
  };
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}
