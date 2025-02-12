{ pkgs, system, ... }: {
  
  pkgs.stdenv.mkDerivation = {

    src = pkgs.fetchFromGithub {
      owner = "alexvegas22";
      repo = "playlist-dl";
      rev = "main";  # Preferably use a commit hash
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace with correct has
    };
    pname = "dl-playlist";
    version = "1.0";

    installPhase = ''
    mkdir -p $out/bin
    install -m 755 dl-playlist.sh $out/bin/dl-playlist
  '';

    nativeBuildInputs = [ pkgs.makeWrapper ];

    postInstall = ''
    wrapProgram $out/bin/dl-playlist \
      --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.yt-dlp pkgs.ffmpeg ]}
  '';

    meta = with pkgs.lib; {
      description = "A script to download playlists";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };
}
