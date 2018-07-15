let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  pkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  stdenv = pkgs.stdenv;

in rec {
  gitSubmergeEnv = stdenv.mkDerivation rec {
    name = "ffi-env";
    version = "0.0.1";
    src = ./.;
    buildInputs = with pkgs; [
      rustChannels.stable.rust
    ];
  };
}
