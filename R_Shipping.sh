echo -e "\e[36m>>>>>>>>>>>>>>>>>Install Maven<<<<<<<<<<<<<<<<<<\e[0m"
yum install maven -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Add application user<<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Download application content<<<<<<<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Extract App content<<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/shipping.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Clean existing Maven package<<<<<<<<<<<<<<<<<<\e[0m"
mvn clean package
mv target/shipping-1.0.jar shipping.jar

echo -e "\e[36m>>>>>>>>>>>>>>>>>Create systemd service<<<<<<<<<<<<<<<<<<\e[0m"
cp shipping.service /etc/systemd/system/shipping.service

echo -e "\e[36m>>>>>>>>>>>>>>>>>Load, Enable and restart service <<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping

echo -e "\e[36m>>>>>>>>>>>>>>>>>Install my sql<<<<<<<<<<<<<<<<<<\e[0m"
yum install mysql -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Load schema<<<<<<<<<<<<<<<<<<\e[0m"
mysql -h mysql-dev.sreenivasulareddydevops.online -uroot -pRoboShop@1 < /app/schema/shipping.sql

echo -e "\e[36m>>>>>>>>>>>>>>>>>Restart shipping service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl restart shipping