LOG_FILE=/tmp/mongodb
echo "Setting Mongo DB Repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE
echo status = $?

echo "Installing MongoDB server"
yum install -y mongodb-org &>>$LOG_FILE
echo status = $?

echo "MongoDB Listen Addres"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo status = $?

echo "MongoDB service start"
systemctl enable mongod &>>$LOG_FILE
systemctl start mongod &>>$LOG_FILE
echo status = $?