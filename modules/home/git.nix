{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user.name = "BGM99";
      user.email = "45606744+BGM99@users.noreply.github.com";
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
