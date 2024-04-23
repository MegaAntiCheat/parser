{
  stdenv,
  rustPlatform,
  lib,
}: let
  inherit (lib.sources) sourceByRegex;
  src = sourceByRegex ./. ["Cargo.*" "(src|benches)(/.*)?"];
in
  rustPlatform.buildRustPackage {
    pname = "demostf-parser-codegen";
    version = "0.1.0";

    src = lib.traceVal src;

    buildType = "debug";
    buildFeatures = ["codegen"];

    doCheck = false;

    cargoLock = {
      lockFile = ./Cargo.lock;
      outputHashes = {
        "schemars-0.8.16" = "sha256-mQR56Ym76gSRulZrThmZHHw2JfhEgYhWXabwaYmyMYs=";
      };
    };
  }
