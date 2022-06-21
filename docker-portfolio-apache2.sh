#!/bin/bash
echo -e "\033[32m"
read -p "Имя образа: " image
echo -e "\033[33m - Создаётся docker image с именем $image."
docker build -t $image . >/dev/null && echo -e "\033[32m - Готово." && sleep 1.5 || echo -e "\033[31m - Есть ошибка"
echo -e "\033[32m"
read -p "Имя контейнера: " name
read -p "На каком порту: " port
echo -e "\033[33m - Запускается docker container с именем $name на порту $port."
docker run -dit --name $name -p $port:80 $image >/dev/null && echo -e "\033[32m - Готово." && sleep 1.5 || echo -e "\033[31m - Есть ошибка"
echo -e "\033[33m"
docker ps
echo
echo -e "\033[32m - Можно проверять по IP адресу машины:$port."
echo