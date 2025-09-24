# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # enable DE
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # enable tiling manager
  programs.hyprland.enable = true;

  # Enable sound.
  services.pulseaudio.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.misael = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.steam.enable = true;
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    alacritty
    neovim
    git
    fnm
    ripgrep
    nerd-fonts.hack
    zoxide
    zellij
    nushell
    rust-analyzer
    wget
    vim
    rustup
    gcc
    nodePackages_latest.typescript-language-server
    discord
    jujutsu
    git-credential-manager
    vscode
    nix-index
    nodejs_22
    xclip
    xsel
    _1password-gui
    fzf
    lua-language-server
    spotify
    python312Packages.python-lsp-server
    python3
    clang-tools
    ghostty
    nix-search-cli
    imagemagick
    rust-analyzer
    protobuf
    gnumake
    pkg-config
    openssl
    nix-output-monitor
    lshw-gui
    nh
    luajitPackages.magick
  ];

  # NOTE FROM MISAEL DON'T CHANGE THIS UNLESS YOU REALLY UNDERSTAND IT
  system.stateVersion = "24.05"; # Did you read the comment?
}

