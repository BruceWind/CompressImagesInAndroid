#!/bin/sh
# @Author: bruce

. install_app.sh
try_install_app "guetzli"
try_install_app "optipng"

## in gitlab-ci, you need to use apt to intall git-lfs,but in github action, installing is another way.


## this line it supposed to avoid 
git config --add core.filemode false