{ pkgs
, inputs
, username
, ...
}:
let
  name = "Alexandre Baudouin Vegas";
  email = "alexrbvegas@gmail.com";
  initialPassword = "root";
  packages = with pkgs; [
    zsh
  ];
  hostname = builtins.getEnv "HOSTNAME";
  homeModule = if hostname == "laptop" then ../../modules/home/laptop-default.nix else if hostname == "rugged" then ../../modules/home/desktop-default.nix else ../../modules/home/default.nix;

in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  environment.sessionVariables = {
    WAYLAND_DISPLAY = "wayland-1";
    NIXOS_OZONE_WL = "1";
  };

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
  users.users.root.initialPassword = initialPassword;
  nix.settings.allowed-users = [ username ];
}
