#!/bin/bash

# Путь к исходной директории, содержащей файлы .pcap
source_dir="/home/ula/pWNGOTCHI/HASH_pcap/handshakes"

# Создаем новую директорию для сохранения сконвертированных файлов
converted_dir="/home/ula/pWNGOTCHI/HASH_pcap/HASH_hc2200"
mkdir -p "$converted_dir"

# Переходим в исходную директорию
cd "$source_dir"

# Получаем список файлов .pcap
pcap_files=(*.pcap)

# Итерируемся по каждому файлу и конвертируем его
for file in "${pcap_files[@]}"
do
  new_filename="${file%.pcap}.hc2200"  # Получаем новое имя файла
  hcxpcapngtool "$file" -o "$converted_dir/$new_filename"  # Конвертируем файл и сохраняем в новую директорию
done
