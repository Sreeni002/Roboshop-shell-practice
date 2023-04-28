echo -e "\e[36m>>>>>>>>>>>>>>>>>Setup NodeJs Repos<<<<<<<<<<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>>>>>>>>>>>>>Install NodeJs<<<<<<<<<<<<<<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Add application user<<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Download Application content<<<<<<<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Unzip the application content<<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/user.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Install dependency files<<<<<<<<<<<<<<<<<<\e[0m"
npm install

echo -e "\e[36m>>>>>>>>>>>>>>>>>Create Systemd service file<<<<<<<<<<<<<<<<<<\e[0m"
cp /root/Roboshop-shell-practice/R_User.service /etc/systemd/system/R_User.service

echo -e "\e[36m>>>>>>>>>>>>>>>>>Load and start the service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable user
systemctl start user

echo -e "\e[36m>>>>>>>>>>>>>>>>>Install MongoDB Client<<<<<<<<<<<<<<<<<<\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Load schema<<<<<<<<<<<<<<<<<<\e[0m"
mongo --host mongodb-dev.sreenivasulareddydevops.online </app/schema/user.js