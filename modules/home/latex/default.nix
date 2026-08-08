{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (texlive.withPackages (ps: [
      ps.scheme-medium
      ps.latexmk
      ps.xetex
      # Org Mode export essentials
      ps.hyperref
      ps.geometry
      ps.fancyhdr
      ps.graphics
      ps.wrapfig
      ps.caption
      ps.listings
      ps.minted
      ps.ulem
      ps.enumitem
      ps.footmisc
      ps.sectsty
      ps.parskip
      ps.csquotes
      ps.titlesec
      ps.titling
      ps.capt-of
      ps.biblatex
      ps.physics
      ps.amsmath
      ps.babel
      ps.siunitx
      ps.mathtools
      ps.xcolor
    ]))
    python3Packages.pygments
  ];
}
