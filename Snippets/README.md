# AWS LABs Snippets

## NGINX Rever Proxy

        cd /etc/nginx/sites-available/

        sudo nano [Application Name]

Paste the content from `nginx-reverse-proxy`

        sudo ln -s /etc/nginx/sites-available/[Application Name] /etc/nginx/sites-enabled/

        sudo systemctl restart nginx

## Docker Installation

Steps are followed form [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
