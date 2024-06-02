{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      zsh 
      zinit
      zoxide
      fzf
      eza
  ];

  programs.zsh.enable = true;
  users.users.earaujo.shell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  home-manager.users.earaujo = {pkgs, ...}: {
    home.stateVersion = "23.11";
    home.file.".zshrc".source = ./dotfiles/.zshrc;
    home.file.".p10k.zsh".source = ./dotfiles/.p10k.zsh;
  };
}
