{
  description = "Example code from Assembly Language Step By Step, Third Edition";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils/v1.0.0";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        devShells.default = pkgs.mkShellNoCC {
          nativeBuildInputs = with pkgs; [
            fasm-bin
            lldb
            llvmPackages.bintools-unwrapped
            nasm
            qemu
            rr
          ];
        };
      });
}
