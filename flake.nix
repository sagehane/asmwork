{
  description = "Example code from Assembly Language Step By Step, Third Edition";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils/v1.0.0";

    zig = {
      url = "github:mitchellh/zig-overlay";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , ...
    } @ inputs:
    let
      overlays = [
        (final: prev: {
          zigpkgs = inputs.zig.packages.${prev.system};
        })
      ];

      #systems = builtins.attrNames inputs.zig.packages;
      systems = [ "x86_64-linux" ];
    in
    flake-utils.lib.eachSystem systems (
      system:
      let
        pkgs = import nixpkgs { inherit overlays system; };
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          nativeBuildInputs = with pkgs; [
            # master-2023-01-07 failed for some reason
            zigpkgs.master-2023-01-06

            binutils-unwrapped-all-targets
            fasm-bin
            lldb
            nasm
            qemu
            rr
            wasmtime
          ];
        };
      }
    );
}
