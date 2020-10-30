# @Author: bruce


#!/bin/sh
. install_app.sh
. compressing_helper.sh
. image_info_reader.sh
divider="---------------------------------------------------------------------"
#### 1.check if Guetzli has been installed.
# run function of installing apps.
try_install_app "guetzli"
try_install_app "optipng"

## 2.try to find all images in where a directory named "res/" and compress them.
echo "begin to compress imgs."

is_img_need_tobe_compressed() {
    is_bigger_than_minimum "$1"
    is_file_big_enough=$?

    if [[ -f "$2" ]]; then
        echo "$2  $1 cant be compressed is due to it exists."
        return 1
    elif (($is_file_big_enough == 1)); then
        echo "$1 cant be compressed is due to small.."
        return 1
    fi
    return 0
}

### give a parameter is directory. This funtion compress oprate all images blow the directory.
compress_imgs_in_dir() {
    ### got image list from "find" command
    ### begin compressing jpg
    declare -a images=$(find $1 -type f -name *.jpg -o -name *.JPG -o -name *.jpeg)
    for original_img in ${images[@]}; do
        img_filename="$(basename $original_img)"
        file_extension="${img_filename#$(echo $img_filename | sed 's/\.[^[:digit:]].*$//g;')}"
        new_image_path=${original_img//$file_extension/_new$file_extension}

        is_img_need_tobe_compressed "$original_img" "$new_image_path"
        is_filter=$?
        if (($is_filter == 1)); then
            echo $divider
            continue
        fi
        echo "start compressing $original_img..."
        compress_jpg $original_img $new_image_path
        is_compressed_suc=$?
        ### echo "$is_compressed_suc"
        if [ "$is_compressed_suc" -eq "0" ]; then
            echo "saved new file: $new_image_path"
        else
            echo "Error: $original_img cant be compress."
        fi
        echo $divider
    done
    #begin compressing png
    declare -a images=$(find $1 -type f -name *.png -o -name *.PNG)
    for original_img in ${images[@]}; do
        img_filename="$(basename $original_img)"
        file_extension="${img_filename#$(echo $img_filename | sed 's/\.[^[:digit:]].*$//g;')}"
        new_image_path=${original_img//$file_extension/_new$file_extension}
        is_img_need_tobe_compressed "$original_img" "$new_image_path"
        has_filtered=$?
        if (($has_filtered == 1)); then
            echo $divider
            continue
        fi
        echo "start compressing $original_img..."
        compress_png $original_img $new_image_path
        is_compressed_suc=$?
        ##echo "$is_compressed_suc"
        if [ "$is_compressed_suc" -eq "0" ]; then
            echo "Saved new file: $new_image_path"
        else
            echo "Error: $original_img cant be compress."
            rm $new_image_path
        fi
        echo $divider
    done
}

declare -a dirs=$(find ./ -type d -name res)
for res_dir in "${dirs[@]}"; do
    echo "found Dir : $res_dir"
    echo $divider
    compress_imgs_in_dir $res_dir
done

### 3.remove original file abnd  put new file into git repo.
