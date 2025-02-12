{ pkgs, ... }:
let
  compress = pkgs.writeShellScriptBin "compress" (
    builtins.readFile ./scripts/compress.sh
  );

  extract = pkgs.writeScriptBin "extract" (
    builtins.readFile ./scripts/extract.sh
  );

  record = pkgs.writeScriptBin "record" (builtins.readFile ./scripts/record.sh);
  
  show-keybinds = pkgs.writeScriptBin "show-keybinds" (
    builtins.readFile ./scripts/keybinds.sh
  );

  vm-start = pkgs.writeScriptBin "vm-start" (
    builtins.readFile ./scripts/vm-start.sh
  );
  
  wofi-power = pkgs.writeShellScriptBin "wofi-power" (
    builtins.readFile ./scripts/wofi-power.sh
  );
in
{
  home.packages = with pkgs; [
    compress
    extract
    show-keybinds
    vm-start
    record
    wofi-power
  ];
}
