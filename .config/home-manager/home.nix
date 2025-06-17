{ pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };

    overlays = [ (import ./overlay.nix) ];
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
    tailwindcss-language-server
    # dotnetCorePackages.sdk_9_0_1xx-bin
    roslyn-ls
    # devtui
  ];

  programs = {
    direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };

    home-manager.enable = true;
    nushell.enable = true;
  };

}
