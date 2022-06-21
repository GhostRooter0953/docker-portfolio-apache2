#!/bin/bash
echo -e "\033[33m - Вот все контейнеры:"
docker ps -a
echo -e "\033[32m"
read -p "Останавливаем и удаляем контейнер: " name
docker stop $name 1>/dev/null 2>&1 && docker rm $name 1>/dev/null 2>&1 && echo -e "\033[32m - Успешно." && echo && docker ps -a && sleep 1.5 || echo -e "\033[31m - Нет такого контейнера"
echo
echo -e "\033[33m - Вот все образы:"
docker images
echo
echo -e "\033[32m"
read -p "Удаляем образ: " image
docker rmi $image 1>/dev/null 2>&1 &&  sleep 1.5 && echo -e "\033[32m - Успешно." && echo && docker images || echo -e "\033[31m - Нет такого образа"
echo