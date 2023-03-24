{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        alacritty
        docker
        git
        neovim
        sudo
        tmux
        zsh
      ];
      pathsToLink = [ "/share" "/bin" "/Applications" ];
    };
  };
}
