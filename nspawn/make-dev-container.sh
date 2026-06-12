sudo apt install systemd-container

sudo systemctl start systemd-machined.service

sudo debootstrap --include=dbus,libpam-systemd,libnss-systemd stable /var/lib/machines/$machine

