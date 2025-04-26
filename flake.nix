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
          laptop = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [ ./hosts/laptop ];
            specialArgs = {
              host = "laptop";
              inherit self inputs username;
            };
          };
          desktop = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [ ./hosts/desktop ];
            specialArgs = {
              host = "desktop";
              inherit self inputs username;
            };
          };

        };

        # homeConfigurations = {
        #   inherit username;

        #   touch = home-manager.lib.homeManagerConfiguration {
        #     inherit pkgs;
        #     modules = [
        #       {
        #         home.username = username;
        #         imports = [ (import ./modules/home/default.nix) ];
        #         home.homeDirectory = "/home/${username}";
        #         home.stateVersion = "24.05";
        #       }
        #     ];
        #   };
        # };
      };
}
