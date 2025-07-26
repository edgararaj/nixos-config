{ stdenv, pkgs, lib, fetchFromGithub }:

stdenv.mkDerivation {
  pname = "rose-pine-hyprcursor";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "ndom91";
    repo = "rose-pine-hyprcursor";
    rev = "4b02963d0baf0bee18725cf7c5762b3b3c1392f1";
    sha256 = "sha256-ouuA8LVBXzrbYwPW2vNjh7fC9H2UBud/1tUiIM5vPvM=";
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -r * "$out/"
  '';
}
