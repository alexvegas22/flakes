{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "wofi-power";
  version = "1.0";

  # The script is local, so we just reference the current directory.
  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    install -m 755 wofi-power.sh $out/bin/wofi-power
  '';

  nativeBuildInputs = [ pkgs.makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/wofi-power \
      --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.wofi pkgs.hyprland pkgs.systemd ]}
  '';

  meta = {
    description = "A Wofi-based power menu";
    license = pkgs.lib.licenses.mit;
    platforms = pkgs.lib.platforms.linux;
  };
}
