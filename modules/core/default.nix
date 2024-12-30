{ self, nixpkgs, inputs, username, host, ... }: {
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./wireshark.nix
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
    ./wayland.nix
    ./virtualization.nix
  ];
}
