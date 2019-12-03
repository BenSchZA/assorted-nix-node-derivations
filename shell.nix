with import <nixpkgs> {};

let
  loopDrv = import ./loop/default.nix { };
in
stdenv.mkDerivation {
  name = "build-env";
  buildInputs = [
    nodejs-10_x
    yarn
    nodePackages.node2nix
    gnumake
    loopDrv.loop
  ];
}
