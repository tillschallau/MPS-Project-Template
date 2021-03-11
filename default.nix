with (import <nixpkgs> {});
let
  ant = (import ./ant.nix).apacheAnt_1_9;
  jdk = (import ./jdk.nix).jdk11;  
  extension = fetchzip {
    url = https://github.com/JetBrains/MPS-extensions/releases/download/v2020.3/mps-extensions-2020.3.1579.52335ca.zip;
    sha256 = "1pyl6rsmq3vf6m9059vldcw0gyn8ljpcc7z32fzf9pg1isn9y60q";
  };
  mps = fetchzip {
	url = https://projects.itemis.de/nexus/content/repositories/mbeddr/com/jetbrains/mps/2020.3/mps-2020.3.zip;
    sha256 = "112fmj73fbq01rfa2n8ykdn053c0p7ydmpl3wgygmyniq36pzpzy";
	stripRoot = false;
  };
in
stdenv.mkDerivation {
  name = "simple";
  buildInputs = [ jdk ant ];
  src = ./src;
  dontInstall = true;
  buildPhase=''
    echo "MPS: "
    echo ${mps}
    ls ${mps}
	echo "----"
    ant cleanSources generate test -Dmps_home=${mps} -Dextensions_home=${extension}
    mkdir $out
    cp TEST-jetbrains.mps.testbench.junit.suites.AntModuleTestSuite0-de.tillschallau.mps.diagram.demo.xml $out/
  '';
}
