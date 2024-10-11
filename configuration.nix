{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hosts/laptop/hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # User config
  users.users.alex = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "input" "docker" "dialout"];
  };
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Fingerprint Service
  services.fprintd.enable = true;
  
  # Configure console keymap
  console.keyMap = "us";

  # Enable the GNOME Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "where-is-my-sddm-theme";

  services.pcscd.enable = true;
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Hyprland
  programs.hyprland.enable = true;
  # Optional, hint electron apps to use wayland:
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.steam.enable = true;
  # Install firefox.
  programs.firefox.enable = true;

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };

  services.udisks2.enable = true;

  virtualisation.docker.enable = true;

  services.udev.packages = [ pkgs.yubikey-personalization ];
  
  services.emacs.package = with pkgs; (
    (emacsPackagesFor emacs).emacsWithPackages (
      epkgs: [ epkgs.vterm ]
    )
  );
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arduino-ide
    brightnessctl
    cmake
    cmake
    cpio
    discord
    dive
    docker
    docker-compose
    emacs
    fastfetch
    foot
    fprintd
    gcc
    gimp
    git
    glib
    glm
    gnome-session
    gnome-settings-daemon
    grim
    htop
    evince    
    hugo
    hyprpaper
    imagemagick
    inkscape
    keepassxc
    killall
    kitty
    krita
    kubectl
    dunst
    kubernetes
    libinput-gestures
    libreoffice    
    macchina
    meson
    meson
    minikube
    networkmanagerapplet
    ninja
    nodejs
    onboard
    pavucontrol
    podman
    pywal
    qemu
    slurp
    squeekboard
    swww
    texlive.combined.scheme-medium
    texlive.combined.scheme-small 
    texliveBasic
    udiskie
    udisks
    unzip
    usbutils
    v4l-utils
    vcluster
    vim
    waybar
    waylock
    wget
    where-is-my-sddm-theme
    wireplumber
    wireshark
    wl-clipboard
    wmctrl
    wofi
    xapp
    yubioath-flutter
   bemenu
  ];
  
  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    font-awesome
    powerline-fonts
    powerline-symbols
    dina-font
    proggyfonts
    
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
