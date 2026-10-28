{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    ollama
    inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.opencode
  ];
}
