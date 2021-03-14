{ pkgs ? import (builtins.fetchTarball {
  name = "nixos-20.03";
  url = "https://releases.nixos.org/nixos/20.03/nixos-20.03.3325.462c6fe4b11/nixexprs.tar.xz";
  sha256 = "0whfcirkdaakdhnnl9q1kb05wgy9x1vdbkg8q7l2cql9qrahr0cr";
}) { }, ... }:

with pkgs;

let
  # LLVM with AVR support enabled
  avr_llvm = llvm.overrideAttrs (oldAttrs: rec {
    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=AVR"
    ];
  });
in
mkShell {
  buildInputs = [
    (terra.overrideAttrs (oldAttrs: rec {
      buildInputs = with llvmPackages; [
        avr_llvm
        (clang-unwrapped.overrideAttrs (oldAttrs: rec {
          buildInputs = [ libxml2 avr_llvm lld ];
        }))
        ncurses
      ];
    }))
    avrdude
  ];
}
