{ pkgs, ... }:

let
  pkgs_dotnet901 = import
    (pkgs.fetchFromGitHub {
      owner = "NixOS";
      repo = "nixpkgs";
      rev = "4ba028e8856a32c10eded2e94785b62454fba032";
      sha256 = "sha256-VN+HYd0swhTG61NuJphWokknOQ3IO+FDcnMurNP8P44=";
    })
    {
      inherit (pkgs) system;
    };
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };

    overlays = [
      (final: prev: {
        nix-search-tui = prev.callPackage
          (final.fetchFromGitHub {
            owner = "misaelaguayo";
            repo = "nix-search-tui";
            rev = "v0.1.1";
            hash = "sha256-/B5n19FpYbbFtMVx3K7jBl6uBbesPNEf64Nxw3wvRmY";
          })
          { };
      })
    ];
  };

  fonts.fontconfig.enable = true;

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    fnm
    corepack_latest
    ripgrep
    nushell
    nerd-fonts.hack
    git
    rustup
    kubectl
    docker
    nix-output-monitor
    powershell
    jujutsu
    nodejs_24
    docker-compose
    roslyn-ls
    netcoredbg
    lldb
    deno
    protobuf
    cargo-generate
    nix-search-cli
    minikube
    argo-workflows
    lua-language-server
    neovim
    zellij
    nix-search-tui
    zoxide
    mergiraf
    delta
    git-credential-manager
    pkgs_dotnet901.dotnetCorePackages.sdk_9_0
    # dotnetCorePackages.sdk_9_0_1xx-bin
    roslyn-ls
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
