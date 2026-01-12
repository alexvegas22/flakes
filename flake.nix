{
  description = "Veal's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      username = "alex";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
      {
        formatter = pkgs.alejandra;
        nixosConfigurations = {
          rugged = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [ ./hosts/rugged ];
            specialArgs = {
              host = "rugged";
              inherit self inputs username;
            };
          };
          touch = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [ ./hosts/touch ];
            specialArgs = {
              host = "touch";
              inherit self inputs username;
            };
          };
        };
      };
}
