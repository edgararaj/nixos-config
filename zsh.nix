{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      bat
      eza
      fd
      fzf
      lsof
      ripgrep
      zinit
      zoxide
      zsh 
  ];

  programs.zsh.enable = true;
  users.users.earaujo.shell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  #home-manager.users.earaujo = {pkgs, ...}: {
  #  home.stateVersion = "24.05";
  #  home.file.".zshrc".source = ./dotfiles/.zshrc;
  #  home.file.".p10k.zsh".source = ./dotfiles/.p10k.zsh;
  #};
}
