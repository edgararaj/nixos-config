{ lib, pkgs, ... }:

{
  environment.variables = { EDITOR = "nvim"; };

  environment.systemPackages = with pkgs; [
    xsel
    gnumake
    (neovim.override { vimAlias = true; })
  ];

  #home-manager.users.earaujo = { config, pkgs, ...}: {
  #  home.stateVersion = "24.05";

  #  home.packages = with pkgs; [
  #    (writeScriptBin "nvchad-install" (builtins.readFile ./dotfiles/nvchad-install))
  #  ];
  #};
}
