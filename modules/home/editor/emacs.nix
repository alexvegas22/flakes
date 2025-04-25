{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: with epkgs; [
      vterm
      lsp-mode
      lsp-ui
      tree-sitter
      tree-sitter-langs

      pkgs.tree-sitter-grammars.tree-sitter-tsx
      pkgs.tree-sitter-grammars.tree-sitter-python
      pkgs.tree-sitter-grammars.tree-sitter-go
      pkgs.tree-sitter-grammars.tree-sitter-java
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
}
