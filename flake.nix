{
  description = "Example code from Assembly Language Step By Step, Third Edition";

  inputs = {
    zig-master = {
      url = "github:jessestricker/zig-master.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zig-master }:
    let
      system = "x86_64-linux";

      overlays = [
        (self: super: {
          zig = zig-master.packages.${system}.zig;
        })
      ];

      pkgs = import nixpkgs { inherit system overlays; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          fasmg
          lldb
          nasm
          qemu
          rr
          wasmtime
          zig
        ];
      };
    };
}
