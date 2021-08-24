{
  pkgs ? import <textapp-pkgs> {},
  version ? "dev"
}:
with pkgs;
stdenv.mkDerivation rec {
  name = "udpipe-${version}";
  inherit version;
  src = if lib.inNixShell then null else ./.;

  nativeBuildInputs = [ ];
  buildInputs = [];

  direnvHook =
  ''
    [ ! -e compile_commands.json ] && intercept-build make -C src exe
    echo "%compile_commands.json" > .ccls
    stdlibpath=${pkgs.stdenv.cc.cc.outPath}/include/c++/${pkgs.stdenv.cc.cc.version}
    echo "-isystem" >> .ccls
    echo "$stdlibpath" >> .ccls
    echo "-isystem" >> .ccls
    echo "$stdlibpath/x86_64-unknown-linux-gnu" >> .ccls
    echo "-isystem" >> .ccls
    echo ${pkgs.stdenv.cc.libc_dev.outPath}/include >> .ccls
  '';
}
