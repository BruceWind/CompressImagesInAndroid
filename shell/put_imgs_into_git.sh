# @Author: bruce

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
        mv -f $2 $1
        git add $1
        echo "added $1 as modified file into git."
        put_file_path_into_config_file $1
        return 0
    else
        rm $2
    fi

    # echo " $2 cant be added into git."
    return 1
}
push_if_need() {
    if git diff-index --quiet HEAD --; then
        exit 0
    else
        git commit -m "[action]:{action commit images automatically.}"
        git push
    fi
}
