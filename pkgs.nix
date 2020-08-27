let
  pkgs =
    import
      (
        builtins.fetchTarball {
          name = "nixos-20.03";
          url = "https://github.com/NixOS/nixpkgs/archive/nixos-20.03.tar.gz";
          sha256 = "0vlnrwlxl6xf6b8rmiy7as2lhi015nklyj2xdiy3ly8xznq69ll9";
        }
      ) { };
in
{
  pkgs = pkgs;
}
