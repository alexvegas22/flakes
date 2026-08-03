{pkgs, ...}: {
  home.packages = with pkgs; [
    adoptopenjdk-icedtea-web
    clisp
    maven
    nodejs
    openjdk
    python3
    sbcl
    go
    gopls
    nixd
    zig
  ];
}
