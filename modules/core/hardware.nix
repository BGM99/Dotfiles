{ inputs, pkgs, ... }:
let
  hyprland-pkgs =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{  
  hardware = {
    graphics = {
      enable = true;
      package = hyprland-pkgs.mesa.drivers;
      extraPackages = with pkgs; [
    
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
  hardware.flipperzero.enable = true;
}
