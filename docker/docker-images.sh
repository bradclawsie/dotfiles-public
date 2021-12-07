#!/usr/bin/env zsh

echo "-------------------------------";
date;
cd /home/brad/repos/dockerfiles;
git pull b7j0c master;
docker build --no-cache . -t b7j0c/perl:5.34.0 -f Dockerfile.perl-5.34.0;
docker tag b7j0c/perl:5.34.0 b7j0c/perl:dev;
docker push b7j0c/perl:5.34.0;
docker push b7j0c/perl:dev;
docker system prune -f;
docker system prune -f;
echo "done";
