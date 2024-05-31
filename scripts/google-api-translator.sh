#!/bin/bash

# WHAT DO YOU NEED TO USE THIS SCRIPT?
#
# 1. Install gcloud locally on the computer: https://cloud.google.com/sdk/docs/install-sdk
#    - Make sure to use these two commands at the end to use it properl (replacing path_to_the_google-cloud-sdk with the actual path to the folder where gcloud is intalled):
#      source 'path_to_the_google-cloud-sdk/path.zsh.inc'
#      source 'path_to_the_google-cloud-sdk/completion.zsh.inc'
# 2. The JSON file stored in 1Password under "Google service account credentials — mbd-translation-service"
# 3. Authenticate the service account using the JSON file (replace path_to_json_file with the path to the file):
#      gcloud auth activate-service-account --key-file=path_to_json_file/mbd-translation-service-894707d1513b.json
# 4. Delete the JSON file once you are authenticated.


# HOW TO USE THIS SCRIPT
#
# 1. Once the "mbd-translation-service@mbd-translation-service.iam.gserviceaccount.com" service account is authenticated, you can use this script.
# 2. Optionally, check if the correct account is logged in with this command : gcloud auth list. You should see this:
#      mbd-translation-service@mbd-translation-service.iam.gserviceaccount.com
# 3. In terminal, cd into the directory where this script is located, presumably the gtfs.org repo, then inside the scripts folder.
# 4. The script assumes the source language is always english, and will translate in all the other languages it knows.
# 5. You need to search and replace backticks (`) for \` to escape them otherwise they will interfere with the command by closing the argument too soon.
#    - Use a simple text editor like TextEdit for this.
# 4. Call the command like this:
#      ./google-api-translator.sh "This is some text to translate."
# 5. Copy and paste the results into a text editor and use the script to clean it up of the usual mistakes.
#    - Inspect the translations for any other errors that might have been introduced and is not fixed by the script mentioned above.
# 6. When pasting in the final file, confirm visually that the markdown is not broken. Always refer to the English version as a reference.


# HOW TO UPDATE THE GLOSSARIES
#
# 1. Edit the .csv files for each of the language(s) you wish to add an entry to
#    - For "do not translate" entries, you need to add the same entries to all the files.
# 2. Commit and do a PR, have it reviewed and approved.
# 3. Merge into "main" on the repo.
# 4. A GitHub action will start the process of updating the glossaries. Allow up to 30 minutes for this to complete before using this script.


# Array of target languages
target_languages=("fr" "es" "ru" "ja" "id" "de" "pt_BR" "ko" "zh" "zh_TW")

# Prefix for the name of a glossary
glossary_name_prefix="mobilitydata-glossary-en-to-"

# Argument provided to the script
input_string="$1"

# Replace apostrophes with '"'"'
processed_string=$(echo "$input_string" | sed "s/'/'\"'\"'/g")

# Insert some space before outputting the translations...
echo ""
echo "----------------------------------------------------------------"
echo ""

# Loop through each target language
for index in "${!target_languages[@]}"; do
    lang="${target_languages[$index]}"
    
    curl_command=$(cat <<EOF
    curl -s --request POST \
        'https://content-translation.googleapis.com/v3/projects/mbd-translation-service/locations/us-central1:translateText?access_token=$(gcloud auth print-access-token)' \
        --header 'Accept: application/json' \
        --header 'Content-Type: application/json' \
        --data '{"sourceLanguageCode":"en", \
            "targetLanguageCode":"$lang", \
            "contents":"$processed_string", \
            "glossaryConfig": {\
                "glossary":"projects/mbd-translation-service/locations/us-central1/glossaries/$glossary_name_prefix$lang", \
                "ignoreCase":false\
                }\
            }' \
        --compressed
    )

    # Execute curl command
    curl_output=$(eval "$curl_command")
    second_translated_text=$(echo "$curl_output" | jq -r '.glossaryTranslations[0].translatedText')
    echo "Translating to $lang:"
    echo ""
    echo "$second_translated_text"
    echo ""
    echo "----------------------------------------------------------------"
    echo ""
done