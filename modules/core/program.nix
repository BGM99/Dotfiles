{ pkgs, lib, username, ... }:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
  # Add user to wireshark group
  users.users.${username}.extraGroups = [ "wireshark" ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
}
