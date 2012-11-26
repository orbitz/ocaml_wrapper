#!/usr/bin/env bash

set -e

OCAML_VERSION=`nix-env -q ocaml | cut -f2 -d '-'`

OCAMLFIND=`which ocamlfind`
OCAMLFIND_OUTPUT=`nix-store -qd $OCAMLFIND`
TOPFIND_DIR=`nix-store -q --outputs $OCAMLFIND_OUTPUT`

ocaml_run.sh rlwrap ocaml -I $TOPFIND_DIR/lib/ocaml/$OCAML_VERSION/site-lib
