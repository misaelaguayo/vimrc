(final: prev: {
  nix-search-tui = prev.callPackage
    (final.fetchFromGitHub {
      owner = "misaelaguayo";
      repo = "nix-search-tui";
      rev = "v0.2.0";
      hash = "sha256-Ksm9xZ0mFf5SVVzkHALnWCDT2aQl69IvWZgyR8dR1Mk=";
    })
    { };
  pkgs_dotnet901 = prev.callPackage
    (final.fetchFromGitHub {
      owner = "NixOS";
      repo = "nixpkgs";
      rev = "4ba028e8856a32c10eded2e94785b62454fba032";
      hash = "sha256-VN+HYd0swhTG61NuJphWokknOQ3IO+FDcnMurNP8P44=";
    })
    { };
  # devtui = prev.callPackage
  #   (final.buildGoModule {
  #     pname = "devtui";
  #     version = "0.27.0";
  #     src = final.fetchFromGitHub {
  #       owner = "skatkov";
  #       repo = "devtui";
  #       rev = "f0998c2f5e125a649ab641bd3773d1304dfbe3fe";
  #       sha256 = "sha256-EALOBKJqAYJ8WZbcBSrxvdHnp4G8Qgl33zms7zX4PNA=";
  #     };
  #     vendorHash = "sha256-KWTsu1un8H199euMbTr194R8HKCofoM0uj/ZAboAQS0=";
  #   })
  #   { };
})

