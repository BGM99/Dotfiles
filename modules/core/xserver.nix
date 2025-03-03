{ pkgs, username, ... }: 
{
  services = {
    xserver = {
      enable = true;
      videoDrivers = ["modesetting"];
      xkb.layout = "de";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
