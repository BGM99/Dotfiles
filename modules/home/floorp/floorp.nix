{ pkgs, ... }: {
  home.packages = (with pkgs; [ floorp-bin ]); # Add Extensions add Bookmarks
}
