{
  description = "fak";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    naersk.url = "github:nix-community/naersk";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };
        naersk = pkgs.callPackage inputs.naersk {};
        wchisp = naersk.buildPackage rec {
          pname = "wchisp";
          version = "0.3-git";
          src = pkgs.fetchFromGitHub {
            owner = "ch32-rs";
            repo = pname;
            rev = "4b4787243ef9bc87cbbb0d95c7482b4f7c9838f1";
            hash = "sha256-Ju2DBv3R4O48o8Fk/AFXOBIsvGMK9hJ8Ogxk47f7gcU=";
          };
        };
        packages = with pkgs; [
          sdcc
          pkgs-unstable.nickel
          pkgs-unstable.nls
          pkgs-unstable.topiary
          meson
          ninja
          python311
        ];
        shellHook = ''
          alias fak="python fak.py"
        '';
      in
      {
        devShells = {
          default = pkgs.mkShell { inherit packages; };
          full = pkgs.mkShell { packages = packages ++ [wchisp]; };
        };
      }
    );
}
