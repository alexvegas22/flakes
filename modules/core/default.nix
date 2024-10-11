{ inputs
, nixpkgs
, self
, ...
}:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
{
     fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    font-awesome
    powerline-fonts
    powerline-symbols
    dina-font
    proggyfonts
    
     ];
     
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
      [
        (import ./bootloader.nix) 
        # ++ [ (import ./hardware.nix) ]
        (import ./xserver.nix) 
        (import ./steam.nix)
        (import ./network.nix) 
        (import ./pipewire.nix)
        (import ./program.nix)
        # ++ [ (import ./../home/package/python.nix) ]
        (import ./security.nix) 
        (import ./services.nix)
        (import ./system.nix) 
        (import ./user.nix) 
        (import ./wayland.nix) 
        (import ./virtualization.nix)
        (import ./../../hosts/laptop/hardware-configuration.nix)
      ];
      };
  }
