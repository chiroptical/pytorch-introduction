{ project ? import
  (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-20.03.tar.gz") {}
}:

project.pkgs.mkShell {
  buildInputs =
    [ (project.pkgs.texlive.combine {
        inherit (project.pkgs.texlive)
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
      project.pkgs.python38Packages.pygments
    ];
}
