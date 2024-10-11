{ pkgs
, inputs
, ...
}:
let
  name = "Alexandre Baudouin Vegas";
  username = "alex";
  email = "alexrbvegas@gmail.com";
  initialPassword = "root";
  packages = with pkgs; [
    zsh
  ];
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.${username} = {
        imports = [ (import ../../modules/home) ];
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
  users.users.root.initialPassword = initialPassword;
  nix.settings.allowed-users = [ "alex" ];
}
