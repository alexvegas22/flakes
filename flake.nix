{
  description = "Veal's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
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
        
      };
  };
}
