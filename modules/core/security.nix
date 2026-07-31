{ ... }: {
  security = {
    rtkit.enable = true;
    sudo.enable = true;

    pam.services = {
      swaylock.enableGnomeKeyring = true;
      hyprlock.enableGnomeKeyring = true;
    };
  };
}
