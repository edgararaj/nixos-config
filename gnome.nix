{ lib, pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;
  };

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "24.05";

    #xdg.configFile."wofi/".source = ./dotfiles/wofi;

    home.packages = with pkgs; [
      colloid-gtk-theme
      dconf2nix
      eyedropper
      gnome-tweaks
      pop-icon-theme
      smile
      swappy
      wofi
    ] ++ (with pkgs.gnomeExtensions; [
      appindicator
      blur-my-shell
      clipboard-history
      color-picker
      gsconnect
      pano
    ]);

    dconf.settings = with lib.gvariant; {
      "org/gnome/Console" = {
        audible-bell = false;
      };

      "org/gnome/desktop/input-sources" = {
        mru-sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "pt" ]) ];
        sources = [ (mkTuple [ "xkb" "us+altgr-intl" ]) ];
        xkb-options = [ "terminate:ctrl_alt_bksp" ];
      };

      #"org/gnome/desktop/interface" = {
      #  color-scheme = "prefer-dark";
      #  cursor-theme = "Pop";
      #  document-font-name = "Cantarell 11";
      #  enable-hot-corners = false;
      #  font-antialiasing = "grayscale";
      #  font-hinting = "slight";
      #  font-name = "Cantarell 11";
      #  gtk-theme = "Adwaita";
      #  icon-theme = "Pop";
      #  monospace-font-name = "CaskaydiaCove Nerd Font Mono 11";
      #  show-battery-percentage = false;
      #};

      "org/gnome/desktop/peripherals/keyboard" = {
        delay = mkUint32 180;
        repeat-interval = mkUint32 30;
      };

      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile = "flat";
        speed = 0.5;
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        send-events = "enabled";
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/desktop/sound" = {
        event-sounds = false;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Shift><Super>q" ];
        maximize = [];
        minimize = [];
        move-to-monitor-down = [ "<Shift><Super>j" ];
        move-to-monitor-left = [ "<Shift><Super>h" ];
        move-to-monitor-right = [ "<Shift><Super>l" ];
        move-to-monitor-up = [ "<Shift><Super>k" ];
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-left = [ "<Shift><Control><Alt>h" ];
        move-to-workspace-right = [ "<Shift><Control><Alt>l" ];
        show-desktop = [ "<Super>d" ];
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

      "org/gnome/desktop/wm/preferences" = {
        resize-with-right-button = true;
      };

      "org/gnome/mutter" = {
        center-new-windows = true;
        edge-tiling = true;
      };

      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [ "<Super>h" ];
        toggle-tiled-right = [ "<Super>l" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" ];
        home = [ "<Super>e" ];
        screensaver = [ "<Super><Shift>AudioMute" ];
        next = [ "Favorites" ];
        play = [ "Go" ];
        previous = [ "Messenger" ];
        search = [ "<Super>space" ];
        www = [ "<Super>b" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "kgx";
        name = "Terminal";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>semicolon";
        command = "smile";
        name = "Smile";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        binding = "<Shift><Super>e";
        command = "wofi-powermenu";
        name = "Power Menu";
      };

      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        disabled-extensions = [];
        enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" "gsconnect@andyholmes.github.io" "appindicatorsupport@rgcjonas.gmail.com" "color-picker@tuberry" "places-menu@gnome-shell-extensions.gcampax.github.com" "pano@elhan.io" ];
        favorite-apps = [ "firefox.desktop" "org.gnome.Geary.desktop" "org.gnome.Calendar.desktop" "org.gnome.Music.desktop" "org.gnome.Nautilus.desktop" ];
      };

      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };

      "org/gnome/shell/extensions/color-picker" = {
        color-picker-shortcut = [ "<Super>c" ];
        enable-shortcut = true;
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "";
      };

      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [];
        switch-to-application-2 = [];
        switch-to-application-3 = [];
        switch-to-application-4 = [];
        switch-to-application-5 = [];
        toggle-message-tray = [ "<Super>v" ];
        toggle-quick-settings = [];
      };

      "org/gnome/tweaks" = {
        show-extensions-notice = false;
      };

      "org/gnome/shell/extensions/pano" = {
        global-shortcut = [ "<Shift><Super>v" ];
        play-audio-on-copy = false;
        show-indicator = true;
      };
    };
  };
}

