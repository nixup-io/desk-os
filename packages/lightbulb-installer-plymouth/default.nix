{stdenv}:
stdenv.mkDerivation {
  pname = "lightbulb-installer-plymouth";
  version = "0.0.1";

  src = ./src;

  installPhase = ''
    runHook preInstall
    sed -i 's:\(^ImageDir=\)/usr:\1'"$out"':' lightbulb-installer.plymouth
    sed -i 's:\(^ScriptFile=\)/usr:\1'"$out"':' lightbulb-installer.plymouth
    mkdir -p $out/share/plymouth/themes/lightbulb-installer
    cp * $out/share/plymouth/themes/lightbulb-installer
    runHook postInstall
  '';
}
