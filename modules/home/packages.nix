{ inputs, pkgs, pkgs-unstable, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {}; 
in
{
  home.packages = (with pkgs; [
    _2048
    
    audacity
    bitwise                           # cli tool for bit / hex manipulation
    cbonsai                           # terminal screensaver
    evince                            # gnome pdf viewer
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    file                              # Show file information 
    fzf                               # fuzzy finder
    gtt                               # google translate TUI
    gifsicle                          # gif utility
    gimp
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    jdk17                             # java
    lazygit
    libreoffice
    nautilus     # file manager
    nitch                             # systhem fetch util
    nix-prefetch-github
    pipes                             # terminal screensaver
    prismlauncher                     # minecraft launcher
    ripgrep                           # grep replacement
    soundwireserver                   # pass audio to android phone
    tdf                               # cli pdf viewer
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    valgrind                          # c memory analyzer
    yazi                              # terminal file manager
    yt-dlp-light
    zenity
    winetricks
    nwg-displays
    wineWowPackages.wayland
    brave
    thunderbird
    keepassxc
    insomnia
    blender
    #pscircle                          # process
    prusa-slicer
    qFlipper

    #music
    musescore
    helio-workstation

    # IDE Apps
    jetbrains.clion
    jetbrains.pycharm-professional
    jetbrains.rust-rover
    jetbrains.idea-community-src
    jetbrains.rider
    godot_4

    # C / C++
    gcc
    gnumake
    cmake

    # C#
    mono

    # Haskell
    ghc
    haskell-language-server
    cabal-install

    bleachbit                         # cache cleaner
    cmatrix
    gparted                           # partition manager
    ffmpeg
    imv                               # image viewer
    icu
    killall
    libnotify
	  man-pages					            	  # extra man pages
    mpv                               # video player
    ncdu                              # disk space
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist                          # clipboard manager
    poweralertd
    qalculate-gtk                     # calculator
    unzip
    wget
    xdg-utils
    xxd
    inputs.alejandra.defaultPackage.${system}
  ]);
}
