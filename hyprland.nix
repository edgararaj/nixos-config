{ lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  services = {
    blueman.enable = true;
  };

  environment.variables = { QT_QPA_PLATFORMTHEME = "qt5ct"; };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "24.05";

    gtk = {
      cursorTheme.package = pkgs.rose-pine-cursor;
    };

    #dconf.settings = with lib.gvariant; {
    #  "org/gnome/desktop/interface" = {
    #    color-scheme = "prefer-dark";
    #    document-font-name = "Inter 11";
    #    font-antialiasing = "grayscale";
    #    font-hinting = "slight";
    #    font-name = "Inter 11";
    #    monospace-font-name = "JetBrainsMono Nerd Font 11";
    #  };
    #};
  };

  environment.systemPackages = with pkgs; [
    alacritty
    albert
    avizo
    grimblast
    hyprlock
    inter
    libsForQt5.qt5ct
    networkmanagerapplet
    pavucontrol
    rose-pine-hyprcursor
    smile
    stow
    swaybg
    waybar
    wlsunset
    gammastep
    wofi
  ];
}

