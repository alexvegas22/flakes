{ self, nixpkgs, inputs, username, ... }: {
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./documentation.nix
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
    ./wireshark.nix
    ./xserver.nix
  ];
}
