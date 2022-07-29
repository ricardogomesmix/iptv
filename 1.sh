#!/bin/bash

usuario=$1
senha=$2
validade=$3
limite=$4

dataValidade=$(date "+%Y-%m-%d" -d "+$validade days")
password=$(perl -e 'print crypt($ARGV[0], "password")' $senha)

/usr/sbin/useradd -M -s /bin/false -e $dataValidade -p $password $usuario

if [ $? -eq 0 ]; then
    
    echo "usuario criado"
    echo "$senha" > /etc/SSHPlus/senha/$usuario
    echo "$usuario $limite" >> /root/usuarios.db
    echo "#!/bin/bash 
pkill -f  "$nome" 
userdel __force $nome 
grep -v ^$nome[[:space:]] /root/usuarios.db > /tmp/ph ; cat /tmp/ph > /root/usuarios.db
rm /etc/SSHPlus/userteste/$nome.sh
rm -rf  /etc/SSHPlus/userteste/$nome.sh
exit" > /etc/SSHPlus/userteste/$nome.sh
chmod +x /etc/SSHPlus/userteste/$nome.sh
at -f /etc/SSHPlus/userteste/$nome.sh now + $u_temp min > /null 2>&1
echo "usuario criado"
