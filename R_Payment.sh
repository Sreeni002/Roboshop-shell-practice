echo -e "\e[36m>>>>>>>>>>>>>>>>>Install Python<<<<<<<<<<<<<<<<<<\e[0m"
yum install python36 gcc python3-devel -y

echo -e "\e[36m>>>>>>>>>>>>>>>>>Add application user<<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Download application content<<<<<<<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Extract the application content<<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/payment.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>>>>Install Python dependencies<<<<<<<<<<<<<<<<<<\e[0m"
pip3.6 install -r requirements.txt

echo -e "\e[36m>>>>>>>>>>>>>>>>>Create systemD files<<<<<<<<<<<<<<<<<<\e[0m"
cp /root/Roboshop-shell-practice/R_Payment.service /etc/systemd/system/R_Payment.service

echo -e "\e[36m>>>>>>>>>>>>>>>>>Load and restart service<<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable payment
systemctl start payment
