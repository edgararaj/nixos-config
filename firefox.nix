{ config, lib, pkgs, ... }:

{
  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "23.11";

    nixpkgs.config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };

    programs.firefox = {
      enable = true;
      profiles.default = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
        ];
        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
	  user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"unified-extensions-button\",\"ublock0_raymondhill_net-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"ublock0_raymondhill_net-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"toolbar-menubar\",\"TabsToolbar\",\"widget-overflow-fixed-list\"],\"currentVersion\":20,\"newElementCount\":5}");
       '';
      };
    };

    home.file.".mozilla/firefox/default/chrome/" = {
      source = pkgs.callPackage ./derivations/firefox-theme.nix {};
    };
  };
}

