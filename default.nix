{ pkgs ? import <nixpkgs> {}, ... }:

pkgs.stdenv.mkDerivation {
  name = "mustard-watches";
  src = ./.;

  buildInputs = [
    pkgs.texlive.combined.scheme-full
  ];

  buildPhase = ''
    latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error mustard-watches.tex
  '';
}
