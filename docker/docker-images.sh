#!/usr/bin/env zsh

if [[ `ip -4 addr show` =~ "inet 144.202.72.212" ]]; then
    echo "-------------------------------";
    date;
    docker pull perl:slim
    cd /home/brad/repos/dockerfiles;
    git pull b7j0c master;
    docker build --no-cache . -t b7j0c/perl:5.34.0 -f Dockerfile.perl-5.34.0;
    docker tag b7j0c/perl:5.34.0 b7j0c/perl:dev;
    docker push b7j0c/perl:5.34.0;
    docker push b7j0c/perl:dev;
    docker system prune -f;
    docker system prune -f;
    echo "done";
fi
