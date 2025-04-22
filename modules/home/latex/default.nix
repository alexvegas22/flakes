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
        listings
        minted
        ulem
        enumitem
        footmisc
        sectsty
        parskip
        csquotes
        titlesec
        capt-of
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
