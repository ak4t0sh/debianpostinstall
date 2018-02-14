#!/bin/bash

# TODO
# Check if root
# Ask if install package should be download or not
# If yes then which branch to allow multiple config
# Parse jobs to do & start :)
# End
# run_apt
run_apt() {
    local path="$1/apt";

    # search for apt dir
    if [ ! -d "${path}" ]; then
        return;
    fi
    echo "${path} exists"
    # TODO if exists copy custom source list files
    ls -l "${path}/sources.list.d"

    # TODO install apt keys

    # TODO install packages from packages.list
    cat "${path}/packages.list"
    return;
}
# run_job
run_job() {
    # if exists run pre.sh
    run_apt "$1"
    # run_configure
    # if exists run post.sh
    return;
}
# main
main() {
    # check for root
    # run enabled jobs
    for job in jobs-enabled/*; do
        echo "running_job $job"
        run_job "$job"
    done
    return;
}

# Run
main
