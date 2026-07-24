{
  lib,
  pkgs,
  host,
  ...
}:
let
  gtk-theme-name = "Dracula";
  gtk-theme = pkgs.dracula-theme;
  icon-theme-name = "Papirus-Dark";
  cursor-theme-name = "Nordzy-cursors";
in
{
  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    theme = {
      name = gtk-theme-name;
      package = gtk-theme;
    };
    iconTheme = {
      name = icon-theme-name;
      package = pkgs.papirus-icon-theme.override { color = "blue"; };
    };
    cursorTheme = {
      name = cursor-theme-name;
      package = pkgs.nordzy-cursor-theme;
      size = 22;
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = lib.mkForce true;
      };
    };

    gtk4 = {
      theme = {
        name = gtk-theme-name;
        package = gtk-theme;
      };
      extraConfig = {
        gtk-application-prefer-dark-theme = lib.mkForce true;
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = gtk-theme-name;
      icon-theme = icon-theme-name;
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    enable = true;
    name = cursor-theme-name;
    package = pkgs.nordzy-cursor-theme;
    size = 22;
  };
}
