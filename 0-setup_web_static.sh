#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get -y install nginx
sudo sed -i "15i add_header X-Served-By \$hostname;" /etc/nginx/nginx.conf
mkdir -p /data/web_static/{releases/test,shared}
echo "<html>
<head>
</head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sed -i '/listen 80 default_server/a location /hbnb_static/ { alias /data/web_static/current/;}' /etc/nginx/sites-available/default
sudo service nginx restart
exit 0

