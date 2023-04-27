yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module enable redis:remi-6.2 -y
yum install redis -y
#update the listen address in the below files
cp redis.conf /etc/redis.conf
cp redis.conf /etc/redis/redis.conf
systemctl enable redis
systemctl start redis
