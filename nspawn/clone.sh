cd /var/lib/machines
cp -a grokloc go
truncate -s 0 go/etc/machine-id
echo "go" | tee /var/lib/machines/go/etc/hostname
cp /etc/systemd/nspawn/grokloc.nspawn /etc/systemd/nspawn/go.nspawn
