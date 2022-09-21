amazon-linux-extras list | grep nginx &>>/tmp/fronted
echo status = $?
amazon-linux-extras enable nginx1 &>>/tmp/fronted
echo status = $?
sudo yum clean metadata &>>/tmp/fronted
echo status = $?
yum -y install nginx &>>/tmp/fronted
echo status = $?
 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/fronted
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