# install nginx
Log_file = ${Log_file}
hs="\e[33m >>>>>>>>>"
he="<<<<<<<<<<<< \e[0m"
component_name=frontend
echo log file output: ${Log_file}
echo -e ${hs} This is for cp nginx file ${he} | tee -a ${Log_file}
cp nginx.conf /etc/nginx/nginx.conf &>>${Log_file}
echo $?

dnf install -y nginx &>>${Log_file}
echo $?
##Copy file from /etc/nginx/nginx.conf
echo -e ${hs} this is for nodejs setup ${he} | tee -a ${Log_file}
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -  &>>${Log_file}
echo $?
echo -e ${hs} this is for install nodejs setup ${he} | tee -a ${Log_file}
dnf install -y nodejs &>>${Log_file}
echo $?

echo -e ${hs} this is for install ${component_name} setup ${he} | tee -a ${Log_file}

curl -L -o /tmp/${component_name}.zip https://raw.githubusercontent.com/raghudevopsb89/roboshop-microservices/main/artifacts/${component_name}.zip &>>${Log_file}
echo $?

rm -rf  /tmp/${component_name} &>>${Log_file}
echo $?

mkdir -p /tmp/${component_name} && cd /tmp/${component_name} &>>${Log_file}
echo $?

unzip /tmp/${component_name}.zip &>>${Log_file}
echo $?

echo -e ${hs} this is for install npm ${he} | tee -a ${Log_file}
npm install &>>${Log_file}
echo $?

echo -e ${hs} this is for install npm build ${he} | tee -a ${Log_file}
npm run build &>>${Log_file}
echo $?

rm -rf /usr/share/nginx/html/* &>>${Log_file}
echo $?

cp -r out/* /usr/share/nginx/html/ &>>${Log_file}
echo $?
nginx -t
systemctl enable nginx &>>${Log_file}
systemctl restart nginx &>>${Log_file}