{ lib, stdenv, vscode-lldb }:

stdenv.mkDerivation {
  pname = "codelldb";
  version = vscode-lldb.version;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    ln -s ${vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb $out/bin/codelldb
  '';

  meta = with lib; {
    description = "CodeLLDB wrapper for use outside of VSCode";
    mainProgram = "codelldb";
    platforms = platforms.all;
  };
}
