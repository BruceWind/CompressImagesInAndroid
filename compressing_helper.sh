#!/bin/bash

compress_png(){
    optipng -silent -o9 $1 -out $2
}


compress_jpg(){
    guetzli --memlimit 2048 --quality 100 $1 $2
}