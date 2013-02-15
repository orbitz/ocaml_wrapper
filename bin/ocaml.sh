#!/usr/bin/env bash

set -e

OCAML_VERSION=`nix-env -q ocaml | cut -f2 -d '-'`

if [ -z $OCAML_TOPLEVEL_PATH ]; then
    OCAML_TOPLEVEL_PATH=$HOME/.nix-profile/lib/ocaml/$OCAML_VERSION/site-lib
fi

ocaml_run.sh rlwrap ocaml -I $OCAML_TOPLEVEL_PATH
