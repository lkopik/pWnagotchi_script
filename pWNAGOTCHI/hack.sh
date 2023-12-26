#!/bin/bash

read -p "Малина подключена? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]] 
then
    ./connect_to_pwn.sh 
    ./scp.sh
    ./convert.sh
    ./test3.sh
else
echo "чел блять иди нахуй... Подключи малину."
sleep 3
    ./convert.sh
    ./test3.sh

fi

