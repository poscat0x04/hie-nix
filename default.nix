{ source ? import ./source, tag ? "master", version ? "8.8.3"
}:
let
  haskellNix = import source.haskell-nix { };
  l = file: builtins.fromJSON (builtins.readFile file);

  pkgs = import haskellNix.sources.nixpkgs-2003 haskellNix.nixpkgsArgs;

  hsPkgs = with pkgs.haskell-nix;
    stackProject {
      src = source."hie-${tag}";
      cache = l (./cache + "-${tag}/${version}.json");
      modules = [
        { packages.haskell-ide-engine.doCheck = false; }
      ];

      stackYaml = "stack-${version}.yaml";
    };
in hsPkgs.haskell-ide-engine.components
