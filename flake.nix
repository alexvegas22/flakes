{
  description = "Veal's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { flake-parts, nixpkgs, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        inputs.pre-commit-hooks.flakeModule  # ✅ Pre-commit hooks as flake-parts module
      ];

      perSystem = { pkgs, ... }: {
        # Pre-commit configuration
        pre-commit = {
          settings.excludes = [ "flake.lock" ];
          settings.hooks.alejandra.enable = true;
        };

        # Formatter
        formatter = pkgs.alejandra;
      };

      flake = {
        # Your NixOS configuration
        nixosConfigurations.touch = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/touch ];
          specialArgs = {
            host = "touch";
            inherit inputs;
            username = "alex";
          };
        };
      };
    };
}
