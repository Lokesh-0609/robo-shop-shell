cp notification.service /etc/systemd/system/notification.service
dnf install -y python3 python3-pip

rm -rf /app
rm -rf /tmp/notification.zip
useradd -d /app -r -s /bin/false appuser
mkdir -p /app
curl -L -o /tmp/notification.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/notification.zip
cd /app
unzip /tmp/notification.zip
pip3 install -r requirements.txt
chown -R appuser:appuser /app
chmod o-rwx /app -R

systemctl daemon-reload
systemctl enable notification
systemctl restart notification

systemctl status notification
journalctl -u notification -f
