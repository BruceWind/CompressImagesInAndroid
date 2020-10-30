#!/bin/bash

# compressing minium is 80k.
compress_minimum=80*1024

is_bigger_than_minimum() {
    filesize=$(wc -c "$1" | awk '{print $1}')

    if (($filesize >= $compress_minimum)); then
        return 0
    else
        return 1
    fi
}

# dont call this function.
test() {
    is_bigger_than_minimum ./res/test.jpg
    echo $?
    ass
    is_bigger_than_minimum ./res/thailand_2.png
    echo $?
}