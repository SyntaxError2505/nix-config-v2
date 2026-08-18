{ pkgs, kopuz, ... }:

let
  kopuzPkg = kopuz.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  environment.systemPackages = [ kopuzPkg ];
}
