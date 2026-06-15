#!/bin/bash

c=$1

if [ "$c" = "build_generator" ]; then
    docker build -t gen_img ./generator
elif [ "$c" = "run_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" gen_img
elif [ "$c" = "create_local_data" ]; then
    python3 generator/generate.py local_data
elif [ "$c" = "build_reporter" ]; then
    docker build -t rep_img ./reporter
elif [ "$c" = "run_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" rep_img
elif [ "$c" = "structure" ]; then
    ls -R
elif [ "$c" = "clear_data" ]; then
    rm -f data/*.csv data/*.html
elif [ "$c" = "inside_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" gen_img ls /data
elif [ "$c" = "inside_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" rep_img ls /data
elif [ "$c" = "report_server" ]; then
    docker run --rm -d -p 8080:80 -v "$(pwd)/data:/usr/share/nginx/html" nginx
fi
