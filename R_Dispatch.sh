echo -e "\e[36m>>>>>>>>>>>>>>>>>Install golan<<<<<<<<<<<<<<<<<<\e[0m"
yum install golang -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Add application user<<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Download application content<<<<<<<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Extract application content<<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/dispatch.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Initiate and build golang<<<<<<<<<<<<<<<<<<\e[0m"
go mod init dispatch
go get
go build

echo -e "\e[36m>>>>>>>>>>>>>>>>>Create systemd file<<<<<<<<<<<<<<<<<<\e[0m"
cp /root/Roboshop-shell-practice/R_Dispatch.service /etc/systemd/system/R_Dispatch.service

echo -e "\e[36m>>>>>>>>>>>>>>>>>Load and restart the service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch
