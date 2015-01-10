#!/bin/bash

function error
{
    echo -e "\033[1;31m${1}\033[0m" 1>&2
}

function checkRequireRootUser
{
    if [[ "$(whoami)" != 'root' ]]
    then
        error "ERROR: please run this program as 'root'"
        exit 1
    fi
}

function installChef()
{
    if [[ "$(which chef-client)" = '' ]]
    then
        local chefProfilePath='/root/.bashrc'

        apt-get update

        apt-get install curl -y

        curl -s -L 'https://www.opscode.com/chef/install.sh' | bash /dev/stdin -v 11.16.4  && \
        echo 'export PATH="/opt/chef/embedded/bin:$PATH"' > "${chefProfilePath}" && \
        source "${chefProfilePath}"
    fi
}

function main()
{
    checkRequireRootUser
    installChef
}

main