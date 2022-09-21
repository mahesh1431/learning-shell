amazon-linux-extras list | grep nginx
echo status = $?
amazon-linux-extras enable nginx1
echo status = $?
sudo yum clean metadata
echo status = $?
yum -y install nginx
echo status = $?
 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
 echo status = $?
 cd /usr/share/nginx/html
 rm -rf *
 unzip /tmp/frontend.zip
 mv frontend-main/static/* .
 mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
 systemctl enable nginx
 echo status = $?
 systemctl restart nginx
 echo status = $?