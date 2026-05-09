# install nginx
echo -e \\e[33mThis is for cp nginx file \\e[0m
cp nginx.conf /etc/nginx/nginx.conf
dnf install -y nginx
##Copy file from /etc/nginx/nginx.conf
echo -e "\e[33m this is for nodejs setup \e[0m"
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
echo -e '\e[33m this is for install nodejs setup \e[0m'
dnf install -y nodejs

echo -e "\e[33m this is for install frontend setup \e[0m"

curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip
rm -rf  /tmp/frontend
mkdir -p /tmp/frontend && cd /tmp/frontend
unzip /tmp/frontend.zip
echo -e "\e[31m this is for install npm \e[0m"
npm install
echo -e "\e[31m this is for install npm build \e[0m"
npm run build
rm -rf /usr/share/nginx/html/*
cp -r out/* /usr/share/nginx/html/
nginx -t
systemctl enable nginx
systemctl restart nginx