{ lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "23.11";

    xdg.configFile."wofi/".source = ./dotfiles/wofi;

    home.packages = with pkgs; [
      (writeScriptBin "wofi-powermenu" (builtins.readFile ./dotfiles/wofi/wofipowermenu.py))
      colloid-gtk-theme
      dconf2nix
      eyedropper
      gnome.gnome-tweaks
      nautilus-open-any-terminal
      pop-icon-theme
      wofi
      swappy
    ] ++ (with pkgs.gnomeExtensions; [
      appindicator
      blur-my-shell
      clipboard-indicator
      color-picker
      emoji-copy
      gsconnect
      pop-shell
    ]);

    dconf.settings = with lib.gvariant; {
      "org/gnome/shell" = {
        disabled-extensions = [];
        enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" "gsconnect@andyholmes.github.io" "pop-shell@system76.com" "emoji-copy@felipeftn" "clipboard-indicator@tudmotu.com" "appindicatorsupport@rgcjonas.gmail.com" "color-picker@tuberry" "places-menu@gnome-shell-extensions.gcampax.github.com" ];
      };

      "org/gnome/desktop/sound" = {
        event-sounds = false;
      };

      "org/gnome/mutter" = {
        center-new-windows = true;
      };

      "org/gnome/Console" = {
        audible-bell = false;
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "Colloid-Dark";
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Colloid-Dark";
        icon-theme= "Pop";
	cursor-theme = "Pop";
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
        terminal-bell = false;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Shift><Super>q" ];
        maximize = [];
        minimize = [];
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-left = [ "<Shift><Control><Alt>h" ];
        move-to-workspace-right = [ "<Shift><Control><Alt>l" ];
        switch-input-source = [ "<Control>space" ];
        switch-input-source-backward = [ "<Shift><Control>space" ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-left = [ "<Control><Alt>h" ];
        switch-to-workspace-right = [ "<Control><Alt>l" ];
        toggle-maximized = [ "<Super>m" ];
        unmaximize = [];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" ];
        screensaver = [ "<Super><Shift>AudioMute" ];
        www = [ "<Super>b" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "blackbox";
        name = "Terminal";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>space";
        command = "wofi --show drun -I";
        name = "Wofi";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        binding = "<Shift><Super>e";
        command = "wofi-powermenu";
        name = "Power Menu";
      };

      "org/gnome/shell/extensions/clipboard-indicator" = {
        toggle-menu = [ "<Super>period" ];
      };

      "org/gnome/shell/extensions/color-picker" = {
        color-picker-shortcut = [ "<Super>c" ];
        enable-shortcut = true;
      };

      "org/gnome/shell/extensions/emoji-copy" = {
        emoji-keybind = [ "<Super><Shift>period" ];
      };

      "org/gnome/shell/extensions/pop-shell" = {
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
        toggle-floating = [ "<Super>g" ];
      };

      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [];
        switch-to-application-2 = [];
        switch-to-application-3 = [];
        switch-to-application-4 = [];
        switch-to-application-5 = [];
        toggle-message-tray = [ "<Super>v" ];
      };

      "org/gnome/desktop/input-sources" = {
        sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "pt" ]) ];
      };
    };
  };
}

