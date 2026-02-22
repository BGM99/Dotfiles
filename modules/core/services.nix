{ ... }:
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    logind.settings.Login = {
      # don’t shutdown when power button is short-pressed
      HandlePowerKey = "ignore";
      # ignore lid close when docked/external monitor conected
      HandleLidSwitchDocked = "ignore";
    };
  };
}
