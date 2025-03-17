{ inputs
, pkgs
, ...
}: {
  home.packages = (with pkgs; [
    bemenu
    brightnessctl
    btop
    cpio
    dig
    direnv
    discord
    dive
    docker
    docker-compose
    dunst
    evince
    fastfetch
    feh
    firefox
    foot
    fprintd
    freecad
    ghostscript
    gifsicle
    gimp
    glm
    gnome-session
    gnome-settings-daemon
    gnuplot
    graphviz
    grim
    home-manager
    htop
    hyfetch
    imagemagick
    inkscape    
    jq
    keepassxc
    killall
    kitty
    krita
    libinput
    libinput-gestures
    libnotify
    libreoffice
    man-pages
    man-pages-posix
    mixxx
    monero-gui
    monero-cli
    mpv
    mullvad-vpn
    nautilus
    nemo
    networkmanagerapplet
    nfs-utils
    obs-studio
    onboard
    openssl
    pavucontrol
    prusa-slicer
    pywal
    qbittorrent
    qemu
    qt5.qtwayland
    signal-desktop
    slurp
    stremio
    swww
    texlive.combined.scheme-full
    tmux
    tor
    tor-browser
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
    wf-recorder
    wget
    where-is-my-sddm-theme
    wineWowPackages.full
    winetricks
    wireguard-tools
    wireplumber
    wireshark
    wl-clipboard
    wmctrl
    wofi
    xapp
    xournalpp
    yt-dlp
    yubioath-flutter
    zenity
    ]);
}
