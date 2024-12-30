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
  
    # Import the default.nix file which should return a set with nixosConfigurations
      nixosConfigurations = {
        rugged = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/rugged ];
          specialArgs = {
            host = "rugged";
            inherit self inputs username;
          };
        };
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/nixos ];
          specialArgs = {
            host = "nixos";
            inherit self inputs username;
          };
        };
        
      };
  };
}
