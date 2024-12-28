{ pkgs, ... }:

let pkgs_dotnet901 = import (pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "4ba028e8856a32c10eded2e94785b62454fba032";
    sha256 = "sha256-VN+HYd0swhTG61NuJphWokknOQ3IO+FDcnMurNP8P44=";
  }) {
    inherit (pkgs) system;
  };
in
{
  nixpkgs = {
    config = {
     allowUnfree = true;
     allowUnfreePredicate = (_: true);
    };
  };

  fonts.fontconfig.enable = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    pkgs.fnm
    pkgs.corepack_latest
    pkgs.ripgrep
    pkgs.alacritty
    pkgs.nushell
    pkgs.unzip
    pkgs.chafa
    pkgs.stack
    pkgs.imagemagick
    pkgs.ghostscript
    pkgs.nerd-fonts.hack
    pkgs.watchexec
    pkgs.ngrok
    pkgs.tmux
    pkgs.git
    pkgs.zoxide
    pkgs.rustup
    pkgs.pkg-config
    pkgs.bun
    pkgs.gh
    pkgs.pandoc
    pkgs.jujutsu
    pkgs.git-credential-manager
    pkgs.go
    pkgs.delta
    # pkgs_dotnet8201.dotnetCorePackages.sdk_8_0
    # pkgs.dotnetCorePackages.sdk_7_0_1xx
    # pkgs.dotnetCorePackages.sdk_9_0
    pkgs_dotnet901.dotnetCorePackages.sdk_9_0
    # pkgs.azure-functions-core-tools
    pkgs.atuin
    pkgs.powershell
    # pkgs.qutebrowser
    # # Adds the 'hello' command to your environment. It prints a friendly
    pkgs.oh-my-posh
    pkgs.jujutsu
    pkgs.zig
    pkgs.nodejs_23
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/misael/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
