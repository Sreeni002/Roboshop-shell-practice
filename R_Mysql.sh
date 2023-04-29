echo -e "\e[36m>>>>>>>>>>>>>>>>>Disable mysql existing mysql<<<<<<<<<<<<<<<<<<\e[0m"
dnf module disable mysql -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Create mysql repo file<<<<<<<<<<<<<<<<<<\e[0m"
cp /root/Roboshop-shell-practice/R_Mysql.repo /etc/yum.repos.d/R_Mysql.repo

echo -e "\e[36m>>>>>>>>>>>>>>>>>Install mysql community version<<<<<<<<<<<<<<<<<<\e[0m"
yum install mysql-community-server -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Enable and start systemd service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable mysqld
systemctl restart mysqld

echo -e "\e[36m>>>>>>>>>>>>>>>>>Setup user id and password<<<<<<<<<<<<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1

echo -e "\e[36m>>>>>>>>>>>>>>>>>Input the password for the user id<<<<<<<<<<<<<<<<<<\e[0m"
mysql -uroot -pRoboShop@1

