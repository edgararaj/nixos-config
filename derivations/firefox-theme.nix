{ stdenv, pkgs, fetchFromGithub }:

stdenv.mkDerivation {
  pname = "colloid-firefox-theme";
  version = "";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "vinceliuice";
    repo = "Colloid-gtk-theme";
    rev = "1a13048ea1bd4a6cb9b293b537afd16bf267e773";
    sha256 = "sha256-zYEoOCNI74Dahlbi5fniuL5PYXcGM4cVM1T2vnnGrcc=";
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -r src/other/firefox/chrome/* "$out/"
  '';
}
