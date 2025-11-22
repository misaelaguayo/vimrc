(final: prev: {
  nix-search-tui = prev.callPackage
    (final.fetchFromGitHub {
      owner = "misaelaguayo";
      repo = "nix-search-tui";
      rev = "v0.2.0";
      hash = "sha256-Ksm9xZ0mFf5SVVzkHALnWCDT2aQl69IvWZgyR8dR1Mk=";
    })
    { };
  starship-jj = final.rustPlatform.buildRustPackage
    rec {
      pname = "starship-jj";
      version = "0.6.0";

      src = final.fetchFromGitLab {
        owner = "lanastara_foss";
        repo = "starship-jj";
        rev = "${version}";
        hash = "sha256-HTkDZQJnlbv2LlBybpBTNh1Y3/M8RNeQuiked3JaLgI=";
      };

      cargoHash = "sha256-E5z3AZhD3kiP6ojthcPne0f29SbY0eV4EYTFewA+jNc=";
    };
    codelldb = final.callPackage ./codelldb-wrapper.nix {
      vscode-lldb = final.vscode-extensions.vadimcn.vscode-lldb;
    };
    })

