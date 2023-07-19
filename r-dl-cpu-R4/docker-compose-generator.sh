#!/bin/bash



while true; do
    read -s -p "Coloque sua senha de login no Rstudio: " SENHA
    echo
    read -s -p "Repita sua senha: " SENHA2
    echo
    [ "$SENHA" = "$SENHA2" ] && break
    echo "Senhas diferentes, repita por favor."
done

read -p "Agora, coloque a pasta que sera montada no container: " CAMINHO

read -p "Qual o nome da pasta dentro do container? " NOME_FOLDER_C

echo


echo "
version: '2.3'
services:
  r-dl-cpu_navarro:
    build: ./
    image: zegkreist/r-dl-cpu:latest
    container_name: r-dl-cpu-navarro
    restart: always
    environment:
     - USER=$USER
     - USERID=$UID
     - PASSWORD=$SENHA
    ports:
     - '8787:8787'
    volumes:
     - $CAMINHO:/home/$USER/$NOME_FOLDER_C:rw   # Not tested
" > docker-compose.yml




while true; do
    read -p "Gostaria de iniciar o container? (S ou N) " yn
    case $yn in
        [YySs]* ) sudo docker-compose up -d; break;;
        [Nn]* ) exit;;
        * ) echo "Responda!!!";;
    esac
done
