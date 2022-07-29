#!/bin/bash
vermelho="\033[0;31m"
verde="\033[0;32m"
branco="\033[1;37m"
licenca="BOT-4433-8282"
url='http://144.217.129.190/key'
clear
echo -e ''
echo -ne "${verde}INFORME A KEY: \033[0m"; read resp 
[[ $(grep -wc $resp <(wget -qO- $url)) == 0 ]] && {
  clear
  echo -e "${verde}Verificando... \033[0m"
  sleep 3s
  clear
  echo -e "${vermelho} KEY INVALIDA \033[0m"
  exit 1
} || {
  clear
  echo -e "${verde}Verificando... \033[0m"
  sleep 3s
  clear
  echo -e "${verde} KEY VALIDA! \033[0m"
  sleep 2s
}

clear
verde="\033[0;32m"
red="\033[0;31m"
echo -e "\E[44;1;37m INSTALACAO BOT SSH \E[0m"
echo -e "\nINSTALANDO AGUARDE...."
apt update -y > /dev/null 2>&1 && apt install unzip at jq curl -y > /dev/null 2>&1
mkdir $HOME/BOT
cd $HOME/BOT && wget 144.217.129.190/botssh.zip
unzip botssh.zip > /dev/null 2>&1 && rm botssh.zip > /dev/null 2>&1
chmod +x $(ls)
mv botssh /bin/botssh
clear && echo -e "${verde}INSTALADO COM SUCESSO!\E[0m" 
echo -e "\n${verde}PREENCHA SEUS DADOS NO ARQUIVO\E[0m ${red}/ROOT/BOT/CONFIG.SH\E[0m ${verde}ANTES DE LIGAR O BOT ! \E[0m"

echo -e "\n${verde}COMANDO PRINCIPAL:\E[0m ${branco}botssh\E[0m"

cd $HOME && rm install > /dev/null 2>&1
