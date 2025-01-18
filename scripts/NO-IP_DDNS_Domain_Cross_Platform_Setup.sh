#!/bin/bash

# Check for DDNS domain username and password environment variables
if [ -z "$NO_IP_DDNS_KEY_USERNAME" ] || [ -z "$NO_IP_DDNS_KEY_PASSWORD" ]; then
  echo "Please set NO_IP_DDNS_KEY_USERNAME and NO_IP_DDNS_KEY_PASSWORD environment variables"
  read -p "Do you have a DDNS domain setup yet? (y/n) " -i "" response
  if [ "$response" = "y" ]; then
    echo "Please enter your DDNS domain username: "
    read -p "Enter DDNS domain username: " username
    echo "Please enter your DDNS domain password: "
    read -p "Enter DDNS domain password: " password
    export NO_IP_DDNS_KEY_USERNAME=$username
    export NO_IP_DDNS_KEY_PASSWORD=$password
  elif [ "$response" = "n" ]; then
    echo "Please select a DDNS domain type (A, AAAA, CNAME, MX, TXT): "
    read -p "Select DDNS domain type: " domain_type
    echo "Please enter your DDNS domain name: "
    read -p "Enter DDNS domain name: " domain_name
    export NO_IP_DDNS_KEY_USERNAME="new_$domain_name"
    export NO_IP_DDNS_KEY_PASSWORD="new_$domain_name"
    echo "Please select the DDNS domain type: $domain_type"
    echo "Please enter your DDNS domain IP address: "
    read -p "Enter DDNS domain IP address: " domain_ip
    echo "Please select the DDNS domain port (80, 443, etc.): "
    read -p "Select DDNS domain port: " domain_port
    export NO_IP_DDNS_KEY_USERNAME=$domain_name
    export NO_IP_DDNS_KEY_PASSWORD=$domain_name
    echo "Please select the DDNS domain URL masking: (yes/no): "
    read -p "Select DDNS domain URL masking: " domain_masking
    if [ "$domain_masking" = "yes" ]; then
      echo "Please select the DDNS domain URL masking type (full, subdomain, etc.): "
      read -p "Select DDNS domain URL masking type: " domain_masking_type
      export NO_IP_DDNS_KEY_USERNAME=$domain_name
      export NO_IP_DDNS_KEY_PASSWORD=$domain_name
    fi
  fi
else
  echo "Please set NO_IP_DDNS_KEY_USERNAME and NO_IP_DDNS_KEY_PASSWORD environment variables"
fi

# Generate DDNS domain
echo "Please select a DDNS domain type (A, AAAA, CNAME, MX, TXT): "
read -p "Select DDNS domain type: " domain_type
echo "Please enter your DDNS domain name: "
read -p "Enter DDNS domain name: " domain_name
echo "Please enter your DDNS domain IP address: "
read -p "Enter DDNS domain IP address: " domain_ip
echo "Please select the DDNS domain port (80, 443, etc.): "
read -p "Select DDNS domain port: " domain_port
echo "Please select the DDNS domain URL masking: (yes/no): "
read -p "Select DDNS domain URL masking: " domain_masking
if [ "$domain_masking" = "yes" ]; then
  echo "Please select the DDNS domain URL masking type (full, subdomain, etc.): "
  read -p "Select DDNS domain URL masking type: " domain_masking_type
  echo "Please enter your DDNS domain URL masking IP address: "
  read -p "Enter DDNS domain URL masking IP address: " domain_masking_ip
fi

# Generate and set DDNS security keys
noip-duc -g $domain_name.ddnskey.com --username $NO_IP_DDNS_KEY_USERNAME --password $NO_IP_DDNS_KEY_PASSWORD