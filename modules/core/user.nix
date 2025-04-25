{ pkgs, inputs, username, ... }:

let
  name = "Alexandre Baudouin Vegas";
  email = "alexrbvegas@gmail.com";
  initialPassword = "root";
  hostname = builtins.getEnv "HOSTNAME";
  packages = with pkgs; [
    zsh
  ];

  homeModule = if hostname == "laptop" then ../../modules/home/laptop-default.nix
               else if hostname == "rugged" then ../../modules/home/desktop-default.nix
               else ../../modules/home/default.nix;

in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  programs.zsh.enable = true;

  home-manager = {
    backupFileExtension = "backup";
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs email; };

    users.${username} = {
      imports = [ (import homeModule) ];
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    initialPassword = initialPassword;
    description = name;
    extraGroups = [ "networkmanager" "wheel" "input" "docker" "dialout"];
    shell = pkgs.zsh;
  };

  nix.settings.allowed-users = [ username ];
}
