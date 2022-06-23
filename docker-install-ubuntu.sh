#!/bin/bash
echo -e "\033[33m - Установим несколько необходимых пакетов, что позволяют apt использовать пакеты через HTTPS."
sudo apt update 1>/dev/null 2>&1 && sudo apt install apt-transport-https ca-certificates curl software-properties-common 1>/dev/null 2>&1 && sleep 1
echo -e "\033[32m - Готово."
echo
echo -e "\033[33m - Добавляем ключ GPG для официального репозитория docker, а также в источники APT."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 1>/dev/null 2>&1 && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" 1>/dev/null 2>&1 && sleep 1.5
echo -e "\033[32m - Готово."
echo
echo -e "\033[33m - Обновляем базу данных пакетов и проверяем наличие репозитория docker."
sudo apt update 1>/dev/null 2>&1 && echo -e "\033[36m" && apt-cache policy docker-ce | grep "Кандидат:" && sleep 1
echo -e "\033[32m - Готово."
echo
echo -e "\033[33m - Устанавливаем docker и проверяем статус его демона."
sudo apt install docker-ce -y 1>/dev/null 2>&1 && echo -e "\033[35m" && sudo  systemctl status docker | grep "Active:" && sleep 1
echo -e "\033[32m - Готово."
echo
echo -e "\033[33m - Добавим текущего пользователя в группу docker."
sudo usermod -aG docker ${USER} && sleep 1
echo -e "\033[31m - Внимание! Чтобы изменения применились, требуется снова авторизоваться: 'su ${USER}'" 
#su ${USER}'
echo -e "\033[32m - Готово."
