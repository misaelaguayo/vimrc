{ lib, pkgs, nix-search-tui, ... }: {
  home = {
    packages = with pkgs; [
      fnm
      corepack_latest
      ripgrep
      alacritty
      nushell
      nerd-fonts.hack
      git
      zoxide
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
      flutter
      ruby
      minikube
      argo-workflows
      lua-language-server
      neovim
      zellij
      nix-search-tui
    ];

    username = "misaelaguayo";
    homeDirectory = "/Users/misaelaguayo";

    stateVersion = "23.11";
  };
}
