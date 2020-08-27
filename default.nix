{ packages ? import ./pkgs.nix }:
let
  inherit (packages) pkgs;

  inputs = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-basic
        beamer
        etoolbox
        translator
        minted
        fvextra
        fancyvrb
        upquote
        lineno
        catchfile
        xstring
        framed
        float
        helvetic;
    })
    pkgs.python38Packages.pygments
    pkgs.which
  ];
in
pkgs.stdenv.mkDerivation {
  name = "pytorch-introduction";
  buildInputs = inputs;
  src = builtins.fetchurl {
    url = "https://github.com/chiroptical/pytorch-introduction/archive/v0.1a0.tar.gz";
    sha256 = "1k1clj0lwlr5i89iz8z5ajrw3l39y4gkslc98a8qzw4nyk5hgfac";
  };
  buildPhase = ''
    source $stdenv/setup
    mkdir -p $out
    pdflatex -shell-escape ./pytorch-introduction.tex
    pdflatex -shell-escape ./pytorch-introduction.tex
    pdflatex -shell-escape ./pytorch-introduction.tex
  '';
  dontInstall = true;
}
