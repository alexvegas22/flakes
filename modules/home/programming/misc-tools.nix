{ pkgs, ... }: {
  home.packages = with pkgs; [
    arduino-ide
    git
    glib
    hugo
    jq
    mongodb-compass
    plantuml
    qemu
    redis
  ];
}
