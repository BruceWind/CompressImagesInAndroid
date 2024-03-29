#!/bin/sh
# @Author: bruce

command_exists() {
    # check if command exists and fail otherwise
    command -v "$1" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then #not found.
        return 0
    else
        return 1
    fi
}


install_app_on_ubuntu() {
    echo "Debian try to install $1."
    sudo apt update
    sudo apt install -y $1
}

install_app_on_debian() {
    echo "Debian try to install $1."
    apt update
    apt install  -y $1
}
install_app_on_mac() {
    echo "This computer try to install $1."
    brew install $1
}


install_app() {
    echo "try to install $1."
    if cat /etc/*release | grep ^NAME | grep Ubuntu; then
        install_app_on_ubuntu $1
    elif [ -f /etc/debian_version ]; then
        install_app_on_debian $1
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        install_app_on_debian $1
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        install_app_on_mac $1
    else
        echo "can't run on this system."
        exit 1
    fi
}




try_install_app() {
    command_exists $1
    is_app_installed=$?
    if [ "$is_app_installed" -eq "0" ]; then
        install_app $1
        command_exists $1
        is_app_installed=$?
        if [ "$is_app_installed" -eq "0" ]; then
            echo "$1 has not been installed."
            exit 1
        fi
    fi
}
