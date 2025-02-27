{ pkgs, ... }: {
  home.packages = with pkgs; [
    cmake
    gcc
    meson
    ninja
  ];
}
