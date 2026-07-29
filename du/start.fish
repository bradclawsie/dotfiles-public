#!/usr/bin/env fish

echo "START";
date;
date > /tmp/finished.txt;

mkdir -p /home/brad/local/uds;
cd /home/brad/local/uds;
rm -f *;

echo "GET UDS";
wget https://github.com/defenseunicorns/uds-cli/releases/download/v0.34.3/uds-cli_v0.34.3_Linux_amd64;
chmod a+rx ./uds-cli_v0.34.3_Linux_amd64;
cd /home/brad/local/bin;
rm -f uds;
ln -s ../uds/uds-cli_v0.34.3_Linux_amd64 uds;

echo "BUILD UDS-CLI";
date;
cd /home/brad/repos/defenseunicorns/uds-cli;
git fetch origin;
git checkout -b main --track origin/main;
uds run build-cli-linux-amd;
mv build/uds /home/brad/local/uds/uds-cli-main;
date;

echo "BUILD UDS-CORE"
cd /home/brad/repos/defenseunicorns/uds-core;
git fetch origin;
git checkout -b main --track origin/main;
echo "CREATE STANDARD PACKAGE";
uds run create-standard-package;
date;
echo "CREATE BUNDLE";
TMPDIR=~/tmp UDS_TMP_DIR=~/tmp uds run -f tasks/create.yaml k3d-standard-bundle
date;
echo "DEPLOY BUNDLE";
TMPDIR=~/tmp UDS_TMP_DIR=~/tmp uds run -f tasks/deploy.yaml k3d-standard-bundle
date;
echo "VALIDATE PACKAGES";
TMPDIR=~/tmp UDS_TMP_DIR=~/tmp uds run -f tasks/test.yaml validate-packages
date;

echo "DONE";
date;
date >> /tmp/finished.txt;

