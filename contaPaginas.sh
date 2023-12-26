#!/bin/bash

DIRECTORY="/Users/jhenriqueax/Downloads"

for file in "$DIRECTORY"/*.pdf; do
    if [ -f "$file" ]; then
        pages=$(pdftk "$file" dump_data | grep NumberOfPages | awk '{print $2}')
        echo "$file: $pages páginas"
    fi
done

