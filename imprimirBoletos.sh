#!/bin/bash

# Diretório onde estão os arquivos PDF e JPEG
diretorio=~/downloads

# Loop para processar cada arquivo PDF e JPEG no diretório
for arquivo in "$diretorio"/*.{pdf,jpg,jpeg,png}; do
    if [ -f "$arquivo" ]; then
        echo "=== $arquivo ==="
        extensao="${arquivo##*.}"

        case "$extensao" in
            pdf)
                pdftoppm -f 1 -l 1 "$arquivo" | lp
                ;;
            jpg | jpeg | png)
                lp "$arquivo"
                ;;
            *)
                echo "Extensão não suportada: $extensao"
                ;;
        esac

        sleep 1
        echo
    fi
done
