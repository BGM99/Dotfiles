{pkgs, ...}: {
  home.packages = with pkgs; [
    dolphin-emu
    pcsx2
    (retroarch.withCores (cores:
      with cores; [
        beetle-psx
        dolphin
        mesen
        mgba
        snes9x
      ]))
  ];
}