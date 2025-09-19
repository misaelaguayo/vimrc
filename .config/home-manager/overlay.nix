(final: prev: {
  nix-search-tui = prev.callPackage
    (final.fetchFromGitHub {
      owner = "misaelaguayo";
      repo = "nix-search-tui";
      rev = "v0.2.0";
      hash = "sha256-Ksm9xZ0mFf5SVVzkHALnWCDT2aQl69IvWZgyR8dR1Mk=";
    })
    { };
  starship-jj = prev.callPackage
    (final.fetchFromGitLab {
      owner = "lanastara_foss";
      repo = "starship-jj";
      rev = "0.6.0";
      hash = "sha256-HTkDZQJnlbv2LlBybpBTNh1Y3/M8RNeQuiked3JaLgI=";
    })
    { };
})

