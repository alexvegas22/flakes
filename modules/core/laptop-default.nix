{ self, nixpkgs, inputs, username, ... }: {
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./xserver.nix
    ./steam.nix
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./bluetooth.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./virtualization.nix
  ];
}
