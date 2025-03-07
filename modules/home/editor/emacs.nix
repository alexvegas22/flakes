{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.vterm
      epkgs.lsp-mode
      epkgs.lsp-ui
      epkgs.tree-sitter
      epkgs.tree-sitter-langs
    ];
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    cmake
    libvterm
  ];


  environment.systemPackages = with pkgs; [
    go
    gopls
  ];
}
