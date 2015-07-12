{ stdenv, haskellngPackages }:

let
  env = haskellngPackages.ghcWithPackages (p: with p; [
    idris
  ]);
in
  stdenv.mkDerivation {
    name        = "idris-playing";
    buildInputs = [env];
    shellHook   = ''
      export NIX_GHC="${env}/bin/ghc"
      export NIX_GHCPKG="${env}/bin/ghc-pkg"
      export NIX_GHC_DOCDIR="${env}/share/doc/ghc/html"
      export NIX_GHC_LIBDIR=$( $NIX_GHC --print-libdir )
    '';
  }