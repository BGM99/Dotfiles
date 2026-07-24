{ pkgs, ... }: {
  fonts = {
    fontconfig = {
      enable = true;

      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Public Sans" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    packages = with pkgs; [
      public-sans
      nerd-fonts.jetbrains-mono
      nerd-fonts.noto
      nerd-fonts.symbols-only
      noto-fonts-color-emoji
    ];
  };
}
