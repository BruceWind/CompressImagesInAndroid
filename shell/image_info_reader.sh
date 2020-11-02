#!/bin/sh

## compressing minium is 80k.
compress_minimum=80*1024

## I dont think use this funtion to filter big file is a appropriate way. Might use find command to do everytgthing is better way.
is_bigger_than_minimum() {
    filesize=$(wc -c "$1" | awk '{print $1}')
    if (($filesize >= $compress_minimum)); then
        return 0
    else
        return 1
    fi
}

## Is that first file smaller than 90% of that first file?
## Comressed file might be bigger than original file. So I wrote this funtion.
is_second_image_smaller_than_first_90_percent() {
    first_size=$(wc -c "$1" | awk '{print $1}')
    second_size=$(wc -c "$2" | awk '{print $1}')
    subtracted_value=$[$first_size - $second_size]
    if (($second_size >= $first_size)); then
        # echo "got size $second_size is unexpected."
        return 1
    elif (($subtracted_value <= ($first_size / 10))); then
        # echo " first_size: $first_size second_size : $second_size"
        return 1
    else
        return 0
    fi

}

# dont call this function.
test() {
    is_bigger_than_minimum ./res/test.jpg
    echo $?
    is_bigger_than_minimum ./res/thailand_2.png
    echo $?
}
