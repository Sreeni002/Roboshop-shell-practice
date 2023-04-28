echo -e "\e[36m>>>>>>>>>>>>>>>>>Setup NodeJs<<<<<<<<<<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>>>>>>>>>>>>>Install nodeJs<<<<<<<<<<<<<<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Add application user<<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Download Application content<<<<<<<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Extract the application content<<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/cart.zip

echo -e "\e[36m>>>>>>>>>>>>>>>>>Install dependencies<<<<<<<<<<<<<<<<<<\e[0m"
npm install

echo -e "\e[36m>>>>>>>>>>>>>>>>>Create system service file <<<<<<<<<<<<<<<<<<\e[0m"
cp /root/Roboshop-shell-practice/R_Cart.service /etc/systemd/system/R_Cart.service

echo -e "\e[36m>>>>>>>>>>>>>>>>>Enable and start cart service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable cart
systemctl restart cart
