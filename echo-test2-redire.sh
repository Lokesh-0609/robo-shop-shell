# install nginx
echo log file out: /tmp/roboshop.log
echo -e "\\e[33m >>>>> This is for cp nginx file <<<<<<<<< \\e[0m"
cp nginx.conf /etc/nginx/nginx.conf &>>/tmp/roboshop.log
dnf install -y nginx &>>/tmp/roboshop.log
##Copy file from /etc/nginx/nginx.conf
echo -e "\e[33m >>>>>>>>> this is for nodejs setup <<<<<<<<<<<< \e[0m"
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -  &>>/tmp/roboshop.log
echo -e '\e[33m >>>>>>>>>> this is for install nodejs setup <<<<<<<<<<<<<< \e[0m'
dnf install -y nodejs &>>/tmp/roboshop.log

echo -e "\e[33m >>>>>>>>>>> this is for install frontend setup <<<<<<<<<<<< \e[0m"

curl -L -o /tmp/frontend.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/frontend.zip &>>/tmp/roboshop.log
rm -rf  /tmp/frontend &>>/tmp/roboshop.log
mkdir -p /tmp/frontend && cd /tmp/frontend &>>/tmp/roboshop.log
unzip /tmp/frontend.zip &>>/tmp/roboshop.log
echo -e "\e[31m >>>>>>>>>>>>>>>>>> this is for install npm <<<<<<<<<<<<<<< \e[0m"
npm install &>>/tmp/roboshop.log
echo -e "\e[31m >>>>>>>>>>>> this is for install npm build <<<<<<<<<<<<<< \e[0m"
npm run build &>>/tmp/roboshop.log
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
cp -r out/* /usr/share/nginx/html/ &>>/tmp/roboshop.log
nginx -t
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log