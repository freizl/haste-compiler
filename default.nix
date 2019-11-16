{ compiler ? "ghc7103" }:

let
  config = {
    packageOverrides = pkgs: rec {
      haskell = pkgs.haskell // {
        packages = pkgs.haskell.packages // {
          "${compiler}" = pkgs.haskell.packages."${compiler}".override {
            overrides = haskellPackagesNew: haskellPackagesOld: rec {
              haste-compiler = haskellPackagesNew.callPackage ./haste-compiler.nix { } ;
              system-filepath = haskellPackagesNew.callPackage ./nix/system-filepath-0.4.14.nix { } ;
              feed = haskellPackagesNew.callPackage ./nix/feed-0.3.12.0.nix { } ;
              ghc-simple = haskellPackagesNew.callPackage ./nix/ghc-simple-0.3.nix { } ;
            };
          };
        };
      };
    };
  };

  ## nix-channel --add https://nixos.org/channels/nixpkgs-18.03-darwin nixpkgs-18.0.3
  pkgs = import <nixpkgs-18.0.3> { inherit config; };

in rec
  { haste-compiler = pkgs.haskell.packages.${compiler}.haste-compiler;
    env = pkgs.stdenv.mkDerivation {
      name = "haste-compiler-shell";
      buildInputs = [
        haste-compiler
      ];
    };
  }


# let
#   pkgs = import <nixpkgs> { };

# in
#   { haste-compiler = pkgs.haskellPackages.callPackage ./haste-compiler.nix { } ;
#   }
