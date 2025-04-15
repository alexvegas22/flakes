{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      vterm
      lsp-mode
      lsp-ui
      tree-sitter
      tree-sitter-langs

      (tree-sitter-grammars.override {
        grammars = [
          "tsx"
          "python"
          "go"
          "java"
        ];
      })
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
