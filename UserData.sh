#!/bin/bash
dnf update -y
dnf install -y ruby wget httpd

# Iniciar e habilitar o serviço HTTPD
systemctl start httpd.service
systemctl enable httpd.service

# Baixar e instalar o agente do CodeDeploy
wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
chmod +x ./install
./install auto

# Certifique-se de que o script de instalação do CodeDeploy foi bem-sucedido
if [[ $? -eq 0 ]]; then
    echo "CodeDeploy agent installed successfully"
else
    echo "CodeDeploy agent installation failed"
    exit 1
fi
