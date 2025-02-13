{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    lib = pkgs.lib;
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        SDL2
        gnumake
      ];

      nativeBuildInputs = with pkgs; [
        pkg-config
      ];
    };
  };
}
