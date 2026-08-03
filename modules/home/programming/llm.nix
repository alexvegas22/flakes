{pkgs, ...}: {
  home.packages = with pkgs; [
    ollama
    opencode
  ];
}
