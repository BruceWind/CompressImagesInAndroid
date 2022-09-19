#!/bin/sh
# @Author: bruce

. install_app.sh
try_install_app "guetzli"
try_install_app "optipng"

## this line it supposed to avoid 
git config --add core.filemode false