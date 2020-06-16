let
  bootstrap = import <nixpkgs> { };
  inherit (bootstrap) fetchFromGitHub;
  loadJSON = f: fetchFromGitHub (builtins.fromJSON (builtins.readFile f));
  sources = rec {
    "hie-1.3" = ./spec/hie-1.3.json
    "hie-1.4" = ./spec/hie-1.4.json; 
    hie-master = ./spec/hie-master.json;
    haskell-nix = ./spec/haskell-nix.json;
  };
in builtins.mapAttrs (_: loadJSON) sources
