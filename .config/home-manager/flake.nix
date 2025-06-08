{
  description = "My Home Manager Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-search-tui-package = {
      url = "github:misaelaguayo/nix-search-tui";
    };
  };

  outputs = { nixpkgs, home-manager, nix-search-tui-package, ... }:
    let
      lib = nixpkgs.lib;
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
      nix-search-tui = import nix-search-tui-package { };
    in {
      homeConfigurations = {
        misaelaguayo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./home.nix
              ({ config, ...}: {
                _module.args.nix-search-tui = nix-search-tui;
              })
            ];
        };
      };
    };
}
