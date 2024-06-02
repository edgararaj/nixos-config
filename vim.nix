{ lib, pkgs, ... }:

{
  environment.variables = { EDITOR = "nvim"; };
  environment.systemPackages = with pkgs; [
    (neovim.override { vimAlias = true; })
  ];

  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "23.11";
    home.packages = with pkgs; [
      xsel
    ];
    # basically copy the whole nvchad that is fetched from github to ~/.config/nvim
    xdg.configFile."nvim/" = {
      source = pkgs.callPackage ./derivations/nvchad.nix {};
    };
  };
}
