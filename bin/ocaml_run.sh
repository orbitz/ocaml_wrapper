#!/usr/bin/env bash

set -e

OCAML_VERSION=`nix-env -q ocaml | cut -f2 -d '-'`

#OCAMLPATH=""
#CAML_LD_LIBRARY_PATH=""

SITE_LIB=$HOME/.nix-profile/lib/ocaml/$OCAML_VERSION/site-lib
OCAMLPATH=$OCAMLPATH:$SITE_LIB

for d in `ls $SITE_LIB`
do
    if [ -d $d ]
    then
	CAML_LD_LIBRARY_PATH=$CAML_LD_LIBRARY_PATH:$d
    fi
done

export OCAMLPATH
export CAML_LD_LIBARY_PATH

exec $@
