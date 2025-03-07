{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "BGM99";
    userEmail = "45606744+BGM99@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
