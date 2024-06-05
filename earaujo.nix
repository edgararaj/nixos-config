{ config, lib, pkgs, ... }:

let user = {
  name = "Edgar Araújo";
  email = "edgararaj@gmail.com";
};
in
{
  networking.hostName = "drinkpad"; # Define your hostname.

  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "23.11";

    home.file = {
      ".local/bin" = {
        source = ./scripts;
        recursive = true;
      };
    };

    programs.git = {
      enable = true;
      userName  = user.name;
      userEmail = user.email;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.earaujo = {
    description = user.name;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      blackbox-terminal
      cabal-install
      discord
      firefox
      gh
      ghc
      nerdfonts
      python3
      tree
    ];
  };
}


