#!/bin/bash
alinhado="%40s%s%-12s\n"
branco="\033[1;37m"
azul="\033[0;34m"
red="\033[0;31m"
verde="\033[0;32m"
amarelo="\033[1;33m"
barra="\E[44;1;37m"
tag_barra="\E[0m"
tag="\033[0m"
url='144.217.129.190/key'
linha="═══════════════════════════════"
linha+="═════════════════════"
clear

echo ''
echo -e "${red}${linha}${red}"
tput setaf 7 ; tput setab 4 ; tput bold ; printf "${alinhado}" "BEM VINDOª AO BOT VENDAS" ; tput sgr0
echo -e "${red}${linha}${tag}"
echo -ne "${verde}DESEJA INSTALAR O CONJUNTO DE FERRAMENTAS\nPARA O USO DO BOT VENDAS? (s/n)${tag}: ";
read resp

[[ "${resp}" = "S" || "${resp}" = "s" ]] && {
  echo ''
  echo -ne "${verde}INFORME A LICENÇA:${tag} ";
  read key


[[ $(grep -wc $key <(wget -qO- $url)) == 0 ]] && {
  sleep 3s
  echo -e "${red}KEY INVALIDA${tag}"
  exit 1
} || {
  sleep 3
  echo ''
  echo -e "${verde}ATUALIZANDO PACOTES...${tag}"
  apt-get upgrade -y > /dev/null 2>&1
  sleep 5s
  echo ''
  echo -e "${verde}INSTALANDO NODE.JS...${tag}"
  mkdir $HOME/BOT_VENDAS > /dev/null 2>&1
  cd $HOME/BOT_VENDAS
  sleep 5s
  apt-get update -y > /dev/null 2>&1
  curl -s https://deb.nodesource.com/setup_16.x | sudo bash > /dev/null 2>&1
  sleep 4s
  sudo apt install nodejs -y > /dev/null 2>&1
  echo ''
  echo -e "${verde}CRIANDO AMBIENTE PARA O BOT...${tag}"
  
  wget 144.217.129.190/bot_manager.zip > /dev/null 2>&1
  
  
  chmod 777 $(ls) > /dev/null 2>&1

  apt install unzip at jq curl -y > /dev/null 2>&1
  
  unzip bot_manager.zip > /dev/null 2>&1
  
  rm bot_manager.zip > /dev/null 2>&1
  
  echo ''
  echo -e "${verde}INSTALANDO DEPENDÊNCIAS DO NODE.JS...${tag}"
  
  npm install -y > /dev/null 2>&1
  npm install forever -g > /dev/null 2>&1
  npm install nodemon -g > /dev/null 2>&1
  
  echo ''
  echo -e "${verde}INSTACÃO CONCLUÍDA !${tag}"
  echo ''
  echo -e "${verde}COMANDO PRINCIPAL:${tag} ${branco}botssh${tag}"
  echo -e "${verde}SUPORTE:${tag} ${branco}@Bruno_VPN${tag}"
  
  cd $HOME
  wget 144.217.129.190/botssh > /dev/null 2>&1
  chmod 777 botssh > /dev/null 2>&1
  mv botssh /bin/botssh > /dev/null 2>&1
}
}
  
  [[ "${resp}" != "N" || "${resp}" != "n" || "${resp}" != "S" || "${resp}" != "s" ]] && exit 1