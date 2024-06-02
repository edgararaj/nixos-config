{ config, lib, pkgs, ... }:

let user = {
  name = "Edgar Araújo";
  email = "edgararaj@gmail.com";
};
in
{
  networking.hostName = "drinkpad"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "23.11";
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
      firefox
      nerdfonts
      tree
      blackbox-terminal
      python3
      gh
    ];
  };
}


