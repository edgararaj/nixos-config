{ lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "23.11";

    home.packages = with pkgs; [
      gnome.gnome-tweaks
      nautilus-open-any-terminal
      colloid-gtk-theme
      pop-icon-theme
      dconf2nix
    ] ++ (with pkgs.gnomeExtensions; [
      blur-my-shell
      removable-drive-menu
      appindicator
      gsconnect
    ]);
  };

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  programs.dconf = {
    enable = true;
    profiles = {
      gdm.databases = [{
        settings = with lib.gvariant; {
          "org/gnome/desktop/interface" = {
            icon-theme= "Pop";
          };
          "org/gnome/desktop/interface:GNOME-Greeter" = {
            icon-theme = "Pop";
          };
        };
      }];
      user.databases = [{
        settings = with lib.gvariant; {
          "org/gnome/shell".enabled-extensions = [
            "user-theme@gnome-shell-extensions.gcampax.github.com"
            "drive-menu@gnome-shell-extensions.gcampax.github.com"
          ];
          "org/gnome/shell/extensions/user-theme" = {
            name = "Colloid-Dark";
          };
          "org.gnome.desktop.interface:GNOME-Greeter" = {
            icon-theme = "Pop";
          };
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            gtk-theme = "Colloid-Dark";
            icon-theme= "Pop";
            monospace-font-name = "JetBrainsMono Nerd Font 11";
          };
          "org/gnome/desktop/peripherals/keyboard" = {
            delay = mkUint32 180;
            repeat-interval = mkUint32 30;
          };
          "com/github/stunkymonkey/nautilus-open-any-terminal" = {
            terminal = "blackbox";
          };
          "com/raggesilver/BlackBox" = {
            font = "JetBrainsMono Nerd Font 11";
          };
          "desktop/wm/keybindings" = {
            close = [ "<Shift><Super>q" ];
            maximize = [ "" ];
            minimize = [ "" ];
            move-to-workspace-1 = [ "<Shift><Super>1" ];
            move-to-workspace-2 = [ "<Shift><Super>2" ];
            move-to-workspace-3 = [ "<Shift><Super>3" ];
            move-to-workspace-4 = [ "<Shift><Super>4" ];
            move-to-workspace-left = [ "<Shift><Control><Alt>h" ];
            move-to-workspace-right = [ "<Shift><Control><Alt>l" ];
            switch-to-workspace-1 = [ "<Super>1" ];
            switch-to-workspace-2 = [ "<Super>2" ];
            switch-to-workspace-3 = [ "<Super>3" ];
            switch-to-workspace-4 = [ "<Super>4" ];
            switch-to-workspace-left = [ "<Control><Alt>h" ];
            switch-to-workspace-right = [ "<Control><Alt>l" ];
            toggle-maximized = [ "<Super>m" ];
            unmaximize = [ "" ];
          };
          "settings-daemon/plugins/media-keys" = {
            www = [ "<Super>b" ];
          };
          "settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Super>Return";
            command = "blackbox";
            name = "Terminal";
          };
          "shell/extensions/pop-shell" = {
            focus-down = [ "<Super>Down" "<Super>j" ];
            focus-left = [ "<Super>Left" "<Super>h" ];
            focus-right = [ "<Super>Right" "<Super>l" ];
            focus-up = [ "<Super>Up" "<Super>k" ];
            search = [ "<Super>d" ];
            tile-by-default = true;
            tile-enter = [ "<Super>e" ];
            tile-move-down = [ "<Shift>j" ];
            tile-move-left = [ "<Shift>h" ];
            tile-move-right = [ "<Shift>l" ];
            tile-move-up = [ "<Shift>k" ];
            tile-resize-down = [ "<Super>i" ];
            tile-resize-left = [ "<Super>u" ];
            tile-resize-right = [ "<Super>p" ];
            tile-resize-up = [ "<Super>o" ];
            tile-swap-down = [ "j" ];
            tile-swap-left = [ "h" ];
            tile-swap-right = [ "l" ];
            tile-swap-up = [ "k" ];
            toggle-floating = [ "<Super><Shift>Space" ];
          };
          "shell/keybindings" = {
            switch-to-application-1 = [ "" ];
            switch-to-application-2 = [ "" ];
            switch-to-application-3 = [ "" ];
            switch-to-application-4 = [ "" ];
            switch-to-application-5 = [ "" ];
            toggle-message-tray = [ "<Super>v" ];
          };
          "desktop/input-sources" = {
            mru-sources = [ (mkTuple [ "xkb" "us" ]) ];
            sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "pt" ]) ];
            xkb-options = [ "terminate:ctrl_alt_bksp" ];
          };
        };
      }];
    };
  };
}

