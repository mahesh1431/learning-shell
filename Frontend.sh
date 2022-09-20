amazon-linux-extras list | grep nginx
amazon-linux-extras enable nginx1
sudo yum clean metadata
yum -y install nginx
 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
 cd /usr/share/nginx/html
 rm -rf *
 unzip /tmp/frontend.zip
 mv frontend-main/static/* .
 mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
 systemctl enable nginx
 systemctl restart nginx