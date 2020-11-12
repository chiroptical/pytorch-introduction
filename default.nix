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
    url = "https://github.com/chiroptical/pytorch-introduction/archive/v0.2.2.tar.gz";
    sha256 = "1qmj9vih2s9vkpr2z896svay0cxjla3miwlq2l41sa0wzypfvfz4";
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
