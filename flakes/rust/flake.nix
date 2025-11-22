{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, fenix, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        fenixPkgs = fenix.packages.${system}.complete;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            fenixPkgs.cargo
            fenixPkgs.clippy
            # fenixPkgs.rust-src
            fenixPkgs.rustc
            fenixPkgs.rustfmt
            fenixPkgs.rust-analyzer
            pkgs.nixpkgs-fmt
          ];

        shellHook = ''
            export RUST_SRC_PATH=${fenixPkgs.rust-src}/lib/rustlib/src/rust/library
        '';

        };
      });
}
