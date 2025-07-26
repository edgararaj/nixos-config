{ stdenv, pkgs, lib, fetchFromGithub }:

stdenv.mkDerivation {
  pname = "nvchad";
  version = "";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "starter";
    rev = "5c656910f058ecdc6753c6a4f39b64afce89a0e6";
    sha256 = "sha256-+UcDn0rTYKlaPi0ybUhYtsdPGPqKChDIPtafjf/in8g=";
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -r * "$out/"
  '';
}
