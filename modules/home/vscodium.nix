{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # nix language
        bbenoist.nix
        # nix-shell suport
        arrterian.nix-env-selector

        # python
        ms-python.python

        # Docker
        ms-azuretools.vscode-docker

        # Haskell
        justusadam.language-haskell
        haskell.haskell

        # PDF
        tomoki1207.pdf
        marp-team.marp-vscode

        # Color themes
        #catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        teabyii.ayu
      ];
      userSettings = {
        "update.mode" = "none";
        "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
        "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509

        "window.menuBarVisibility" = "toggle";
        "window.zoomLevel" = 0;
        "editor.fontFamily" =
          "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
        "terminal.integrated.fontFamily" =
          "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
        "editor.fontSize" = 16;
        "workbench.colorTheme" = "Bearded Theme OLED (Experimental)";
        "workbench.iconTheme" = "catppuccin-mocha";
        "catppuccin.accentColor" = "lavender";
        "vsicons.dontShowNewVersionMessage" = true;
        "explorer.confirmDragAndDrop" = false;
        "editor.fontLigatures" = true;
        "editor.minimap.enabled" = false;
        "workbench.startupEditor" = "none";

        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "editor.formatOnPaste" = true;

        "workbench.layoutControl.type" = "menu";
        "workbench.editor.limit.enabled" = true;
        "workbench.editor.limit.value" = 10;
        "workbench.editor.limit.perEditorGroup" = true;
        "workbench.editor.showTabs" = "single";
        "files.autoSave" = "onWindowChange";
        "explorer.openEditors.visible" = 0;
        "breadcrumbs.enabled" = false;
        "editor.renderControlCharacters" = false;
        "editor.scrollbar.verticalScrollbarSize" = 2;
        "editor.scrollbar.horizontalScrollbarSize" = 2;
        "editor.scrollbar.vertical" = "hidden";
        "editor.scrollbar.horizontal" = "hidden";
        "workbench.layoutControl.enabled" = false;
        "terminal.integrated.initialHint" = false;

        "editor.mouseWheelZoom" = true;
      };
      # Keybindings
      keybindings = [
        {
          key = "ctrl+q";
          command = "editor.action.commentLine";
          when = "editorTextFocus && !editorReadonly";
        }
        {
          key = "ctrl+s";
          command = "workbench.action.files.saveFiles";
        }
      ];
    };
  };
}
