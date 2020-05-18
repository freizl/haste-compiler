{ mkDerivation, base, bytestring, Cabal, semigroups
, deepseq, stdenv, text
}:
mkDerivation {
  pname = "system-filepath";
  version = "0.4.14";
  sha256 = "1656ce3c0d585650784ceb3f794748286e19fb635f557e7b29b0897f8956d993";
  revision = "1";
  doCheck = false;
  editedCabalFile = "18llfvisghrn9w9yfgacqn51gs50a0lngah3bmg852h0swj7vkp8";
  setupHaskellDepends = [ base Cabal ];
  libraryHaskellDepends = [ base bytestring deepseq text semigroups ];
  homepage = "https://github.com/fpco/haskell-filesystem";
  description = "High-level, byte-based file and directory path manipulations (deprecated)";
  license = stdenv.lib.licenses.mit;
}
