#!/bin/bash

######################################################
# Script de Instalação do Mininet                    #
# Versão: 1.0                                        #
######################################################

clear

echo  "Iniciando a atualização da lista de pacotes dos repositórios..."
sleep 3
echo " "
sudo apt-get update
sleep 3
clear

echo "Instando o Git, por favor aguarde..."
sleep 3
echo " "
sudo apt-get  install -y git
sleep 3
clear

echo "Instando o ifconfig, por favor aguarde..."
sleep 3
echo " "
# Instalação do ifconfig no Ubuntu 18.04
sudo apt-get  install -y net-tools
sleep 3
clear

echo "Instando o python-serial, por favor aguarde..."
sleep 3
echo " "
sudo apt-get install -y python-serial
sleep 3
clear

echo "Entrando no diretório home do usuário"
sleep 3
echo " "
cd $HOME
sleep 3
clear

echo "Fazendo o download do Mininet..."
sleep 3
echo " "
sudo git clone git://github.com/mininet/mininet
sleep 3
clear

echo "Instalando o Mininet, o POX e depedências necessárias..."
sleep 3
echo " "

echo "Etapa 1 de instalação iniciada..."
sleep 3
echo " "
sudo ~/mininet/util/install.sh -a
sleep 3
clear

echo "Etapa 2 de instalação iniciada..."
sleep 3
echo " "
sudo ~/mininet/util/install.sh -nfv
sleep 3
clear

echo "Testando a instalação do Mininet com uma topologia minimal..."
sleep 3
echo " "
sudo mn --test pingall
sleep 3
clear

echo "Movendo Icone, Script do Miniedit e arquivo de exemplo..."
sleep 3
cd $HOME/Downloads/Install_Mininet
sudo mv ExeMininet.mn $HOME/Área\ de\ Trabalho
sudo mv miniedit.sh $HOME/mininet/examples
sudo chmod +x $HOME/mininet/examples/miniedit.sh 
sudo chown root $HOME/mininet/examples/miniedit.sh 
sudo chgrp root $HOME/mininet/examples/miniedit.sh 
sudo mv miniedit.xpm $HOME/mininet/examples
sudo chown root $HOME/mininet/examples/miniedit.xpm 
sudo chgrp root $HOME/mininet/examples/miniedit.xpm
sudo mv miniedit.desktop /usr/share/applications 
sudo chmod 644 /usr/share/applications/miniedit.desktop
sudo chown root /usr/share/applications/miniedit.desktop  
sudo chgrp root /usr/share/applications/miniedit.desktop
sleep 3
clear

echo ""
echo "Instalação Finalizada :)"
echo ""
echo "A máquina será reiniciada!!!"
sleep 5
