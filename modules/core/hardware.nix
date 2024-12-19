{ pkgs, ... }:
{  
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
  hardware.flipperzero.enable = true;
}
