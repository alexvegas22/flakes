{ self, nixpkgs, inputs, username, ... }: {
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./hardware.nix
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./user.nix
    ./virtualization.nix
    ./wayland.nix
    ./xserver.nix
  ];
}
