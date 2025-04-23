{ pkgs, ... }: {
  home.packages = with pkgs; [
    arduino-ide
    cargo
    git
    glib
    hugo
    jq
    mongodb-compass
    plantuml
    qemu
    redis
    rustc
  ];
}
