{ stdenv, pkgs, fetchFromGithub }:

stdenv.mkDerivation {
  pname = "nvchad";
  version = "";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "c8777040fbda6a656f149877b796d120085cd918";
    sha256 = "sha256-J4SGwo/XkKFXvq+Va1EEBm8YOQwIPPGWH3JqCGpFnxY=";
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -r * "$out/"
    mkdir -p "$out/lua/custom"
  '';
}
