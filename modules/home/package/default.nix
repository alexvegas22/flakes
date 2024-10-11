{ inputs
, pkgs
, ...
}: {
  home.packages =
    let
      php = pkgs.php.buildEnv { extraConfig = "memory_limit = 2G"; };
    in
    (with pkgs;
    [
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
    ]
    ++ [

    ]);
}
