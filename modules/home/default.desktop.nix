{
  inputs,
  username,
  host,
  pkgs-unstable,
  ...
}:
{
  imports = [ (import ./default.nix) ];
  # ++ [(import ./rider.nix)]                     # C# JetBrain editor
  # ++ [(import ./steam.nix)]
  # ++ [(import ./unity.nix)];
}
