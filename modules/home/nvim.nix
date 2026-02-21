{ pkgs, ... }:
{
  programs.neovim = {
    enable = false;
    vimAlias = true;
  };
}
