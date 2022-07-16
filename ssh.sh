#!/bin/bash

echo "ngrok-vps-a2pd" | passwd --stdin root
echo "Start ssh service."
service ssh start
