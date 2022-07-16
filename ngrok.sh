#!/bin/bash

mkdir -p /app/ngrok
wget --no-check-certificate -O /app/ngrok/ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -zxvf /app/ngrok/ngrok.tgz -C /app/ngrok

ngrok_ssh_authtoken="26C1mPxDCFYdnDeDHB2S3Oa2VCr_GrmMdG2vavc7ANoLjGt1"
ngrok_ssh_region="us"
ngrok_aria2_authtoken="26eVqJ81bHeGatCnVfUahlTtkbC_hYsYoe6hA3tnUuKbYGxx"
ngrok_aria2_region="us"

echo -e "authtoken: ${ngrok_ssh_authtoken}\nregion: ${ngrok_ssh_region}\nversion: "2"" > /app/ngrok/.ngrok_ssh.yml
echo -e "authtoken: ${ngrok_aria2_authtoken}\nregion: ${ngrok_aria2_region}\nversion: "2"" > /app/ngrok/.ngrok_aria2.yml

echo "Start ngrok services."
/app/ngrok/ngrok tcp --config /app/ngrok/.ngrok_ssh.yml 22
/app/ngrok/ngrok tcp --config /app/ngrok/.ngrok_aria2.yml 6800
