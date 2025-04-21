{ inputs
, pkgs
, ...
}: {
  home.packages = (with pkgs; [
    (texlive.combine {
      inherit (texlive) scheme-medium
        latexmk
        xetex

        # Org Mode export essentials
        hyperref
        geometry
        fancyhdr
        graphics
        wrapfig
        caption
        subcaption
        listings
        minted
        ulem
        enumitem
        footmisc
        parskip
        csquotes
        biblatex
        physics
        amsmath
        babel
        siunitx
        mathtools
        xcolor;
    })
    python3Packages.pygments
  ]);
}
