{pkgs, ...}: {
  home.packages = with pkgs; [
    arduino-ide
    cargo
    screen
    penpot-desktop
    git
    glib
    hugo
    jq
    mongodb-compass
    lsof
    plantuml
    qemu
    redis
  ];
}
