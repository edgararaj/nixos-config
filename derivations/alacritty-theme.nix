{ stdenv, pkgs, fetchFromGithub }:

stdenv.mkDerivation {
  pname = "alacritty-theme";
  version = "";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "alacritty";
    repo = "alacritty-theme";
    rev = "94e1dc0b9511969a426208fbba24bd7448493785";
    sha256 = lib.fakeSha256;
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -r src/themes/* "$out/"
  '';
}
