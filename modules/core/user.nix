{ pkgs
, inputs
, username
, ...
}:
let
  name = "Alex Vegas";
  email = "v34l@proton.me";
  initialPassword = "root";
  packages = with pkgs; [
    zsh
  ];
  hostname = builtins.getEnv "HOSTNAME";
  homeModule = if hostname == "laptop" then ../../modules/home/laptop-default.nix else if hostname == "desktop" then ../../modules/home/desktop-default.nix else ../../modules/home;

in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  programs.zsh.enable = true;
  home-manager = {
    backupFileExtension = "backup";
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs name email; };
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
