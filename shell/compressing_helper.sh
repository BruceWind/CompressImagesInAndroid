#!/bin/sh
compress_png(){
    fileinfo=$(file "$1")
    # echo $fileinfo
    optipng -silent -o9 $1 -out $2
}


compress_jpg(){
    fileinfo=$(file "$1")
    # echo $fileinfo
    guetzli --memlimit 2048 --quality 85 $1 $2
}
