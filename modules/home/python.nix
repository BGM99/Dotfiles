{ pkgs, ... }:
{
  home.packages = [
    (pkgs.python312.withPackages (ppkgs: [
      # Global packages
      ppkgs.numpy
      ppkgs.matplotlib
      ppkgs.cryptography
      ppkgs.midiutil
      ppkgs.pip
      ppkgs.scikit-learn
      ppkgs.pandas
    ]))
  ];
}
