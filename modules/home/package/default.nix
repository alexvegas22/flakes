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
    adoptopenjdk-icedtea-web
    arduino-ide
    awscli
    bemenu
    brightnessctl
    btop
    chromium
    ceph
    prusa-slicer
    cmake
    cpio
    dig
    discord
    dive
    docker
    docker-compose
    dunst
    emacs
    evince
    fastfetch
    feh
    firefox
    foot
    fprintd
    gcc
    gimp
    git
    glib
    glm
    gnome-session
    gnome-settings-daemon
    gnuplot
    graphviz
    grim
    ghostscript
    htop
    hugo
    hypridle
    hyprland
    hyprlock
    hyprpaper
    imagemagick
    inkscape    
    jq
    keepassxc
    killall
    kitty
    kompose
    krita
    kubectl
    kubernetes
    kubernetes-helm
    libinput-gestures
    libinput
    libreoffice    
    macchina
    meson
    meson
    minikube
    mixxx
    mongodb-compass
    mullvad-vpn
    nautilus
    nemo
    networkmanagerapplet
    nfs-utils
    ninja
    nodejs
    onboard
    openjdk
    openssl
    pavucontrol
    plantuml
    podman
    python3
    pywal
    qemu
    qt5.qtwayland
    redis
    signal-desktop
    slurp
    stremio
    swww
    talosctl
    texlive.combined.scheme-full
    tmux
    traceroute
    udiskie
    udisks
    unzip
    usbutils
    v4l-utils
    vault
    vcluster
    viewnior
    vim
    waybar
    waylock
    wget
    where-is-my-sddm-theme
    wineWowPackages.wayland
    winetricks
    wireplumber
    wireshark
    wl-clipboard
    wmctrl
    wofi
    xapp
    xournalpp
    yt-dlp
    yubioath-flutter
    ]
    ++ [
   nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    font-awesome
    powerline-fonts
    powerline-symbols
    dina-font
    ]);
}
