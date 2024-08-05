#!/bin/bash

sudo apt install -y squid

sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.original
sudo chmod a-w /etc/squid/squid.conf.original

squidfile="/etc/squid/squid.conf"

aclline=$(grep -n "acl Safe_ports port 777" $squidfile | awk --field-separator=":" '{ print $1 }')
newacl="acl aws_vpc src "$1

echo ""
echo "Adding new acl '$newacl' under $aclline"
sudo sed -i "${aclline}a$newacl" "$squidfile"

httpline=$(grep -n "# Deny requests to certain unsafe ports" $squidfile | awk --field-separator=":" '{ print $1 }')
newhttp="http_access allow aws_vpc"

echo ""
echo "Adding new http_access '$newhttp' under $httpline"
sudo sed -i "${httpline}a$newhttp" "$squidfile"

portline=$(grep -n "http_port 3128" $squidfile | awk --field-separator=":" '{print $1}')
newport="http_port 8888"

echo ""
echo "Changing default port '$newport' under $portline"
sudo sed -i "$portline s/^/# /" "$squidfile"
sudo sed -i "${portline}a$newport" "$squidfile"

sudo systemctl restart squid.service