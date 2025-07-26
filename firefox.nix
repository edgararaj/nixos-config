{ config, lib, pkgs, ... }:

{
  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "24.05";

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };

    programs.firefox = {
      enable = true;
      profiles.default = {
        search = {
          force = true;
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              definedAliases = [ "@no" ];
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
            };
          };
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          keepa
          #simple-tab-groups
          sponsorblock
          ublock-origin
          wappalyzer
          bitwarden
          privacy-badger
          i-dont-care-about-cookies
        ];
        extraConfig = ''
          user_pref("browser.tabs.groups.enabled", true);
          user_pref("apz.overscroll.enabled", false);
          user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"sponsorblocker_ajay_app-browser-action\",\"amptra_keepa_com-browser-action\",\"jid1-93cwpmrbvpjrqa_jetpack-browser-action\",\"wappalyzer_crunchlabz_com-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"unified-extensions-button\",\"ublock0_raymondhill_net-browser-action\",\"simple-tab-groups_drive4ik-browser-action\",\"addon_darkreader_org-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"ublock0_raymondhill_net-browser-action\",\"addon_darkreader_org-browser-action\",\"amptra_keepa_com-browser-action\",\"jid1-93cwpmrbvpjrqa_jetpack-browser-action\",\"simple-tab-groups_drive4ik-browser-action\",\"wappalyzer_crunchlabz_com-browser-action\",\"sponsorblocker_ajay_app-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"toolbar-menubar\",\"TabsToolbar\",\"widget-overflow-fixed-list\",\"unified-extensions-area\"],\"currentVersion\":20,\"newElementCount\":6}");
       '';
      };
      policies = {
        ExtensionSettings = with builtins;
        let extension = shortId: uuid: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
        in listToAttrs [
          (extension "oxocarbon" "5a33eb3c-e7cc-4ea1-93fd-530e2491511b")
        ];
      };
    };
  };
}

