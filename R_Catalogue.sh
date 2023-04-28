echo -e "\e[36m>>>>>>>>>>>>>>>>>Setup NodeJs<<<<<<<<<<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m>>>>>>>>>>>>>>>>>Install NodeJs<<<<<<<<<<<<<<<<<<\e[0m"
yum install nodejs -y
echo -e "\e[36m>>>>>>>>>>>>>>>>>Create user roboshop<<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app
echo -e "\e[36m>>>>>>>>>>>>>>>>>Download app content<<<<<<<<<<<<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
echo -e "\e[36m>>>>>>>>>>>>>>>>>Extract app content<<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/catalogue.zip
echo -e "\e[36m>>>>>>>>>>>>>>>>>Install NodeJs Dependencies<<<<<<<<<<<<<<<<<<\e[0m"
npm install
echo -e "\e[36m>>>>>>>>>>>>>>>>>Create systemd file<<<<<<<<<<<<<<<<<<\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[36m>>>>>>>>>>>>>>>>>Load system service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
echo -e "\e[36m>>>>>>>>>>>>>>>>>Enable catalogue service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable catalogue
echo -e "\e[36m>>>>>>>>>>>>>>>>>Restart catalogue service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl restart catalogue
echo -e "\e[36m>>>>>>>>>>>>>>>>>Install Mongodb<<<<<<<<<<<<<<<<<<\e[0m"
yum install mongodb-org-shell -y
echo -e "\e[36m>>>>>>>>>>>>>>>>>Load schema<<<<<<<<<<<<<<<<<<\e[0m"
mongo --host mongodb-dev.sreenivasulareddydevops.online </app/schema/catalogue.js