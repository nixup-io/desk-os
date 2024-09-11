{stdenv}:
stdenv.mkDerivation {
  pname = "eu-flag-installer-plymouth";
  version = "0.0.1";

  src = ./src;

  installPhase = ''
    runHook preInstall
    sed -i 's:\(^ImageDir=\)/usr:\1'"$out"':' eu-flag-installer.plymouth
    sed -i 's:\(^ScriptFile=\)/usr:\1'"$out"':' eu-flag-installer.plymouth
    mkdir -p $out/share/plymouth/themes/eu-flag-installer
    cp * $out/share/plymouth/themes/eu-flag-installer
    runHook postInstall
  '';
}
