{stdenv}:
stdenv.mkDerivation {
  pname = "lightbulb-plymouth";
  version = "0.0.1";

  src = ./src;

  installPhase = ''
    runHook preInstall
    sed -i 's:\(^ImageDir=\)/usr:\1'"$out"':' lightbulb.plymouth
    sed -i 's:\(^ScriptFile=\)/usr:\1'"$out"':' lightbulb.plymouth
    mkdir -p $out/share/plymouth/themes/lightbulb
    cp * $out/share/plymouth/themes/lightbulb
    runHook postInstall
  '';
}
