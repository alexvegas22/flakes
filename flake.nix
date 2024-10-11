{
  description = "Veal's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
      nixpkgs,
      home-manager,
      ... } @ inputs: {
        
    nixosConfigurations = import ./modules/core/default.nix {
     inherit self nixpkgs inputs;
    };
  };
}
