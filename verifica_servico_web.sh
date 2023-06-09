#!/bin/bash

codigo_http=$(curl -w %{http_code} -s -o /dev/null www.google.com)

if [ $codigo_http -ne 200 ]; then

    echo "Houve um problema com o servidor, tentando reiniciá-lo  $(date +%F\ %T)" >> /logs/servidor.log

    systemctl restart httpd

fi
