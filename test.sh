#!/usr/bin/env bash

while getopts ":m:i" option; do
    case "${option}" in
        m )
            message=${OPTARG}
            ;;
        i )
            image=${OPTARG}
            ;;
    esac
done

shift "$((OPTIND-1))"

echo "${message};${image};"

