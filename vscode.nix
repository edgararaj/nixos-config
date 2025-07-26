{ config, lib, pkgs, ... }:

{
  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "24.05";

    nixpkgs.config.allowUnfree = true;

    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
      extensions = with pkgs.vscode-extensions; [
        cweijan.dbclient-jdbc
        eamodio.gitlens
        ms-vsliveshare.vsliveshare
        yzhang.markdown-all-in-one
        #outofsync42.select-compare-tabs
        #tldraw-org.tldraw-vscode
        vscodevim.vim

        # ai
        github.copilot
        github.copilot-chat

        # ui
        mechatroner.rainbow-csv
        #azat-io.vscode-gruvbox-icon-theme

        # languagues
        ms-python.python
        ms-vscode.cpptools-extension-pack
        ms-vscode.cmake-tools
        haskell.haskell
        bradlc.vscode-tailwindcss
        james-yu.latex-workshop

        # formatters
        esbenp.prettier-vscode
        #eeyore.yapf
        editorconfig.editorconfig
      ];

      userSettings = {
        "window.zoomLevel" = 0.5;
        "editor.fontFamily" = "'CaskaydiaCove Nerd Font Mono', 'monospace', monospace";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[cpp]" = {
          "editor.defaultFormatter" = "ms-vscode.cpptools";
        };
        "window.titleBarStyle" = "custom";
        "[nix]"."editor.tabSize" = 2;
        "terminal.integrated.commandsToSkipShell" = [
          "-workbench.action.quickOpen"
          "-workbench.action.terminal.focusFind"
          "-aichat.newchataction"
        ];
        "vim.handleKeys" = {
          "<C-b>" = false;
          "<C-p>" = false;
        };
        "diffEditor.ignoreTrimWhitespace" = false;
        "breadcrumbs.enabled" = false;
        "editor.stickyScroll.enabled" = false;
        "haskell.manageHLS" = "PATH";
        "files.autoSave" = "onFocusChange";
        "redhat.telemetry.enabled" = true;
        "launch" = {
          "version" = "0.2.0";
          "configurations" = [
            {
              "name" = "(gdb) Launch";
              "type" = "cppdbg";
              "request" = "launch";
              "program" = "\${workspaceFolder}/a.out";
              "args" = [];
              "stopAtEntry" = false;
              "cwd" = "\${workspaceFolder}";
              "environment" = [];
              "externalConsole" = false;
              "MIMode" = "gdb";
              "setupCommands" = [
                {
                  "description" = "Enable pretty-printing for gdb";
                  "text" = "-enable-pretty-printing";
                  "ignoreFailures" = true;
                } {
                  "description" = "Set Disassembly Flavor to Intel";
                  "text" = "-gdb-set disassembly-flavor intel";
                  "ignoreFailures" = true;
                }
              ];
            }
          ];
        };
      };
    };
  };
}
