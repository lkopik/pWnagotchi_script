
password_file="/home/ula/pWNGOTCHI/WIFI_password/01234_8_8.txt"

AP="/home/ula/pWNGOTCHI/AP_completed/"

cd /home/ula/pWNGOTCHI/HASH_pcap/HASH_hc2200
# Получаем список файлов
files=$(ls *.hc2200)

# Перебираем каждый файл
for file in $files
do
    # Проверяем наличие файла с таким же названием во второй директории
    if ls "$AP"/* | grep -q "$(basename "$file")"; then
    echo  "Этот файл уже юзался -" "$file"  
    mv "$file" "$AP" # Если файл уже существует, перемещаем его во вторую директорию
    else
    hashcat -a 0 -m 22000 "$file" "$password_file" --outfile=/home/ula/pWNGOTCHI/COMPLETED/result_"$file".tx
    mv "$file" /home/ula/pWNGOTCHI/AP_completed/
    fi

#    hashcat -a 0 -m 22000 "$file" "$password_file" --outfile=/home/ula/pWNGOTCHI/COMPLETED/result_"$file".txt
done

