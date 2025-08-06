{ pkgs, ... }: {
  home.packages = with pkgs; [
    cmake
    gnumake
    gcc
    meson
    ninja
  ];
}
