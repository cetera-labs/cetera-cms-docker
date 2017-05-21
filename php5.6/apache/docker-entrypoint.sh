#!/bin/bash
set -euo pipefail

# first run, download CMS installer
if ! [ -e .prefs ]; then
    echo >&2 "CeteraCMS not installed yet, let's do it ..."
    if [ "$(ls -A)" ]; then
        echo >&2 "WARNING: $PWD is not empty - press Ctrl+C now if this is an error!"
        ( set -x; ls -A; sleep 10 )
    fi

    curl -o install.php.zip -fSL "https://cetera.ru/cetera_cms/install.php.zip"
    unzip install.php.zip && rm install.php.zip
    chown www-data:www-data install.php #.htaccess

fi
apache2-foreground
