{ pkgs, system, ... }:

let
  playlistSrc = pkgs.fetchFromGitHub {
    owner = "alexvegas22";
    repo = "playlist-dl";
    rev = "main";  # Preferably use a commit hash
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace with correct hash
  };
in pkgs.stdenv.mkDerivation {
  pname = "dl-playlist";
  version = "1.0";
  src = playlistSrc;
  installPhase = ''
    mkdir -p $out/bin
    install -m 755 dl-playlist.sh $out/bin/dl-playlist
  '';
  nativeBuildInputs = [ pkgs.makeWrapper ];
  postInstall = ''
    wrapProgram $out/bin/dl-playlist \
      --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.yt-dlp pkgs.ffmpeg ]}
  '';
  meta = {
    description = "A script to download playlists";
    license = pkgs.lib.licenses.mit;
    platforms = pkgs.lib.platforms.linux;
  };
}
