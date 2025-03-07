{ pkgs, ... }:
{
  home.packages = [
    (pkgs.python312.withPackages (ppkgs: [
      # Global packages
      ppkgs.numpy
      ppkgs.cryptography
      ppkgs.midiutil
      ppkgs.pip
    ]))
  ];
}
