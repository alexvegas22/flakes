{pkgs, ...}: {
  home.packages = with pkgs; [
    arduino-ide
    cargo
    screen
    git
    glib
    hugo
    jq
    mongodb-compass
    lsof
    plantuml
    qemu
    redis
    rustc
  ];
}
