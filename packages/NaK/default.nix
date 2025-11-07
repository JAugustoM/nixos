{
  lib,
  appimageTools,
  fetchurl,
  libepoxy,
  ...
}:

let
  pname = "NaK";
  version = "4.0.0";

  src = fetchurl {
    url = "https://github.com/SulfurNitride/NaK/releases/download/${version}/NaK-Linux-Modding-Helper-Flet.AppImage";
    hash = "sha256-wjMWfndsXi5ImUvkFtFlMWpM74r2iZ4OroyuMqOKHIw=";
  };

  # appimageContents = appimageTools.extractType1 { inherit pname src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPackages = [ libepoxy ];

  # extraInstallCommands = ''
  #   substituteInPlace $out/share/applications/${pname}.desktop \
  #     --replace-fail 'Exec=AppRun' 'Exec=${meta.mainProgram}'
  # '';

  meta = {
    description = "NaK, is a modding helper. It automatically sets up MO2 and Vortex to the best of my abilities for you.";
    homepage = "https://github.com/SulfurNitride/NaK";
    downloadPage = "https://github.com/SulfurNitride/NaK/releases";
    license = lib.licenses.mit;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    maintainers = with lib.maintainers; [ ];
    platforms = [ "x86_64-linux" ];
  };
}
