#!/bin/bash

# Путь к директории с файлами .hc22000
directory="/home/ula/pWNGOTCHI/HASH_pcap/HASH_hc2200"

# Путь к файлу с паролями
password_file="/home/ula/pWNGOTCHI/WIFI_password/01234_8_8.txt"

# Переходим в директорию
cd "$directory"



#!/bin/bash

# Получаем список файлов
files=$(ls *.hc2200)

# Перебираем каждый файл
for file in $files
do
  # Запускаем hashcat с текущим файлом
  hashcat -a 0 -m 22000 $file $password_file --outfile=/home/ula/pWNGOTCHI/COMPLETED/result_"$file".txt
  mv "$file" /home/ula/pWNGOTCHI/AP_completed/
done


#    hashcat -a 0 -m 22000 "$file" "$password_file" --outfile=result_"$file".txt

