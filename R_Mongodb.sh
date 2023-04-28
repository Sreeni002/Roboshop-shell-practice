yum install mongodb-org -y
cp R_mongo.repo /etc/yum.repos.d/R_mongo.repo
systemctl enable mongod
systemctl start mongod
#update mongo db listen address
systemctl restart mongod
