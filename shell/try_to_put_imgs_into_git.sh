# @Author: bruce
# Note: This file would like commit new files. And would not delete original image file.

#!/bin/sh

. image_info_reader.sh

## if new file need to be put into git, put it though,else delete new file.
put_new_into_git() {
    ## detect if file exist.
    if [ ! -f "$2" ]; then
        # echo "$2 does not exist."
        return 1
    fi

    ## detect if file readable.
    if [ ! -r "$2" ]; then
        # echo "$2 can't be read."
        rm $2
        return 1
    fi

    ## detect if file small enough.
    is_second_image_smaller_than_first_90_percent $1 $2
    if (($? == 0)); then
        git add $2
        git restore $1
        echo "added $2 into git."
        return 0
    else
        rm $2
    fi

    # echo " $2 cant be added into git."
    return 1
}