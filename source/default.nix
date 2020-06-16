let
  bootstrap = import <nixpkgs> { };
  inherit (bootstrap) fetchFromGitHub;
  loadJSON = f: fetchFromGitHub (builtins.fromJSON (builtins.readFile f));
  sources = rec {
    "hie-1.4" = ./spec/hie-0.1.json; 
    hie-master = ./spec/hie-master.json;
    haskell-nix = ./spec/haskell-nix.json;
  };
in builtins.mapAttrs (_: loadJSON) sources
