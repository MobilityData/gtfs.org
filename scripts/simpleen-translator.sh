#!/bin/bash

# Array of target languages
target_languages=("FR", "ES" "RU" "JA" "id" "DE" "PT-BR" "ko" "ZH" "zh-TW")

escape_quotes() {
    echo "$1" | sed 's/"/\\"/g'
}

# Argument provided to the script
input_string="$1"

# Loop through each target language
for lang in "${target_languages[@]}"; do
    # Replace placeholders with actual values
    curl_command=$(cat <<EOF
curl -s -X POST \
   'https://api.simpleen.io/translate?auth_key=$SIMPLEEN_API_AUTH_KEY' \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' \
   -d '{
      "dataformat": "Markdown",
      "source_language": "EN",
      "target_language": "$lang",
      "glossary": 89,
      "text": "$input_string"
   }'
EOF
)
    # Execute curl command
    echo "Translating to $lang:"
    eval $curl_command
    echo ""
done
