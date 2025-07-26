# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = [ "gnupg://" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 463;
      width = 948;
    };

    "com/github/stunkymonkey/nautilus-open-any-terminal" = {
      terminal = "blackbox";
    };

    "com/raggesilver/BlackBox" = {
      font = "JetBrainsMono Nerd Font 11";
      show-headerbar = false;
      terminal-bell = false;
      window-height = mkUint32 1064;
      window-width = mkUint32 700;
    };

    "org/gnome/Console" = {
      audible-bell = false;
    };

    "org/gnome/clocks/state/window" = {
      maximized = false;
      panel-id = "world";
      size = mkTuple [ 948 1030 ];
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
      window-state = mkTuple [ 1717 928 false ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" ];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "file:///home/earaujo/Firefox_wallpaper.png";
      picture-uri-dark = "file:///home/earaujo/Firefox_wallpaper.png";
      primary-color = "#02023c3c8888";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "pt" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Pop";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-theme = "Colloid-Dark";
      icon-theme = "Pop";
      monospace-font-name = "JetBrainsMono Nerd Font 11";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-characters" "com-raggesilver-blackbox" ];
    };

    "org/gnome/desktop/notifications/application/com-raggesilver-blackbox" = {
      application-id = "com.raggesilver.BlackBox.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-characters" = {
      application-id = "org.gnome.Characters.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      delay = mkUint32 180;
      repeat-interval = mkUint32 30;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Shift><Super>q" ];
      maximize = [];
      minimize = [];
      move-to-monitor-down = [ "<Shift><Super>j" ];
      move-to-monitor-left = [ "<Shift><Super>l" ];
      move-to-monitor-right = [ "<Shift><Super>h" ];
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

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      edge-tiling = false;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Super>h" ];
      toggle-tiled-right = [ "<Super>l" ];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 1904 1064 ];
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
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

    "org/gnome/shell" = {
      disabled-extensions = [];
      enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" "gsconnect@andyholmes.github.io" "emoji-copy@felipeftn" "clipboard-indicator@tudmotu.com" "appindicatorsupport@rgcjonas.gmail.com" "color-picker@tuberry" "places-menu@gnome-shell-extensions.gcampax.github.com" ];
      welcome-dialog-last-shown-version = "45.5";
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
      recently-used = [ "\128536" "\129392" "\128513" "\9749" "\128514" "\10084\65039" "\128525" "\128557" "\128522" "\128530" "\128553" ];
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [ "a41b861eb09f924d" ];
      id = "009385f2-5225-4cd6-955d-5f00ff9d1814";
      name = "drinkpad";
    };

    "org/gnome/shell/extensions/gsconnect/device/a41b861eb09f924d" = {
      certificate-pem = "-----BEGIN CERTIFICATE-----nMIIC9zCCAd+gAwIBAgIBATANBgkqhkiG9w0BAQsFADA/MRkwFwYDVQQDDBBhNDFinODYxZWIwOWY5MjRkMRQwEgYDVQQLDAtLREUgQ29ubmVjdDEMMAoGA1UECgwDS0RFnMB4XDTIxMTAxNDIzMDAwMFoXDTMxMTAxNDIzMDAwMFowPzEZMBcGA1UEAwwQYTQxnYjg2MWViMDlmOTI0ZDEUMBIGA1UECwwLS0RFIENvbm5lY3QxDDAKBgNVBAoMA0tEnRTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALBYifrPeCYPBg83pyIlnNa4EADqRfY6xAjTKAo3Y3CAFLss2KEDizdyUAqhRT+Dti85mcm+pCk5KvVHt3tg7nE4CIG8gQeAqeXa7a271K9T7bGGYuIIn+238DcuLT67YQrxrfXD6TJS4+WHNq1JhfncNbyL5kk5vAdQe22RLlZ4wVnUzlItrVECrd3laODF8YV0Lndgz8a1V+HBUVhJLdrnTkM4VPga3f8XAUYRPYAILNyUQYLaYyq+DW6pt8tcNB9+XqVfQMRd7N7qR14pZ1AMnGCElZGFGUDQgXGxraq/OqyughF9/7pfdpEsYNmGwwOgltQP2TVlyIBQri3VOa7qlnosECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAmC78+vv1Yg8Fl8UzDDH565NyTqIfnZZ9cC69H6RwO+SZomZ2XxQbhsBzDp0ofszsXUSqbyKeTWXCWqbk5TazsPIvc1bdznQs72Wted5k6MazAW6WtWhOKCKhHdmaiJDfUDD8sb9FWqUzohdUVLq0y11fTHRji9nuLWe0Mzv/67cwPEVesjhaATnzF97QL45sAcAoVFAhYV1lnagWLpeVXrrmO5q4yvDnysCukb6vscUlOG7+FHaNqiS3HCO29F6bkTj9xC0VcErsbAJe3tatn4HcsL5zPhbmnfxc2q0jbCYjqLnou2frFFGysGZdK8bB+WjL3NH4+vCI5hOgi6NnJRPQZRA==n-----END CERTIFICATE-----n";
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request" "kdeconnect.telephony.request_mute" ];
      last-connection = "lan://192.168.1.20:1716";
      name = "RMX2001";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony" ];
      paired = true;
      supported-plugins = [ "battery" "clipboard" "connectivity_report" "contacts" "findmyphone" "mousepad" "mpris" "notification" "ping" "presenter" "runcommand" "sftp" "share" "sms" "systemvolume" "telephony" ];
      type = "phone";
    };

    "org/gnome/shell/extensions/gsconnect/device/a41b861eb09f924d/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/a41b861eb09f924d/plugin/notification" = {
      applications = ''
        {"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Color":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Archive Manager":{"iconName":"org.gnome.FileRoller","enabled":true},"Black Box":{"iconName":"com.raggesilver.BlackBox","enabled":true},"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Console":{"iconName":"org.gnome.Console","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Evolution Alarm Notify":{"iconName":"appointment-soon","enabled":true},"Geary":{"iconName":"org.gnome.Geary","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true}}
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/a41b861eb09f924d/plugin/share" = {
      receive-directory = "/home/earaujo/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = mkTuple [ 948 982 ];
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

    "org/gnome/shell/extensions/user-theme" = {
      name = "Colloid-Dark";
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      toggle-message-tray = [ "<Super>v" ];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 165;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 103 103 ];
      window-size = mkTuple [ 1231 902 ];
    };

  };
}
