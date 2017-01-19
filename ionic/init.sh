#!/bin/sh

# creation du projet ionic si il n'existe pas
if !([ -d $PROJET ]) then
  ionic start $PROJET sidemenu --v2
fi
cd $PROJET
ionic serve --all --port $IONIC_SERVE_PORT --livereload-port $IONIC_LIVERELOAD_PORT --consolelogs --serverlogs --nobrowser