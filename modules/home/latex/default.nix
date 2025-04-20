{ inputs
, pkgs
, ...
}: {
  home.packages = (with pkgs; [
    (texlive.combine {
      inherit (texlive) scheme-medium
        latexmk
        physics
        amsmath
        babel
        siunitx
        mathtools
        xcolor;
    })
  ]);
}
