{ lib, pkgs, ... }: {
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
      nix-search-cli
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
    ];

    username = "misaelaguayo";
    homeDirectory = "/Users/misaelaguayo";

    stateVersion = "23.11";
  };
}
