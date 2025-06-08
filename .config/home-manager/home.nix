{ pkgs, ... }:

{
  nixpkgs = {
    config = {
     allowUnfree = true;
     allowUnfreePredicate = (_: true);
    };
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
  ];

  programs.neovim = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.zellij = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
