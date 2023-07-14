#!/bin/bash

# Установка dos2unix
apt update
apt install -y dos2unix

# Конвертация формата скрипта в Unix (LF)
dos2unix vpn_install.sh

# Настройка debconf для выбора lightdm по умолчанию
echo "lightdm shared/default-x-display-manager select lightdm" | debconf-set-selections
echo "lightdm shared/default-x-display-manager seen true" | debconf-set-selections

# Обновление и обновление пакетов
apt update
apt upgrade -y

# Установка необходимых пакетов
apt install -y privoxy lightdm tor wget

# Загрузка и установка AnyDesk
wget https://download.anydesk.com/linux/anydesk_6.1.0-1_amd64.deb
apt install -y ./anydesk_6.1.0-1_amd64.deb

# Получение пароля от пользователя
read -p "Введите пароль для AnyDesk: " password

# Настройка пароля AnyDesk
echo "$password" | anydesk --set-password

# Получение номера AnyDesk
anydesk_id=$(anydesk --get-id)

# Получение пароля от пользователя
read -p "Введите пароль: " password

# Настройка пароля AnyDesk
echo "$password" | anydesk --set-password

# Вывод номера и пароля
printf "\n"
printf "Номер: %s\n" "$anydesk_id"
printf "Пароль: %s\n" "$password"




