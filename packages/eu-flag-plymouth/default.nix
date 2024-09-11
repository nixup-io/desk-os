{stdenv}:
stdenv.mkDerivation {
  pname = "eu-flag-plymouth";
  version = "0.0.1";

  src = ./src;

  installPhase = ''
    runHook preInstall
    sed -i 's:\(^ImageDir=\)/usr:\1'"$out"':' eu-flag.plymouth
    sed -i 's:\(^ScriptFile=\)/usr:\1'"$out"':' eu-flag.plymouth
    mkdir -p $out/share/plymouth/themes/eu-flag
    cp * $out/share/plymouth/themes/eu-flag
    runHook postInstall
  '';
}
