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
    bemenu
    brightnessctl
    btop
    prusa-slicer
    cpio
    dig
    direnv
    discord
    dive
    docker
    docker-compose
    dunst
    emacs
    wireguard-tools
    evince
    fastfetch
    feh
    firefox
    foot
    fprintd
    freecad
    gimp
    glm
    gnome-session
    gnome-settings-daemon
    gnuplot
    graphviz
    grim
    ghostscript
    htop
    hyfetch
    imagemagick
    inkscape    
    jq
    keepassxc
    killall
    kitty
    krita
    libinput-gestures
    libinput
    libreoffice
    man-pages
    man-pages-posix
    mixxx
    mpv
    mullvad-vpn
    nautilus
    nemo
    networkmanagerapplet
    nfs-utils
    libnotify
    obs-studio
    onboard
    openssl
    pavucontrol
    pywal
    qemu
    qt5.qtwayland
    signal-desktop
    slurp
    stremio
    swww
    texlive.combined.scheme-full
    tmux
    traceroute
    udiskie
    udisks
    unzip
    usbutils
    v4l-utils
    vcluster
    viewnior
    waybar
    waylock
    wget
    where-is-my-sddm-theme
    wineWowPackages.full
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
    ]);
}
