cp mangodb.repo /etc/yum.repos.d/mongodb.repo

dnf install -y mongodb-org

systemctl enable mongod
systemctl start mongod

sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf

systemctl restart mongod