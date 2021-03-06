#!/usr/bin/env bash
#
# For Android app, updates the contents of the google-service.json file.

if [ ! -n "$GOOGLE_SERVICES_JSON" ]
then
    echo "You need define the GOOGLE_SERVICES_JSON variable in App Center"
    exit
fi

GOOGLE_SERVICES_JSON_FILE=$APPCENTER_SOURCE_DIRECTORY/android/app/google-services.json

if [ -e "$GOOGLE_SERVICES_JSON_FILE" ]
then
    echo "Updating google-services.json"
    echo "$GOOGLE_SERVICES_JSON" > $GOOGLE_SERVICES_JSON_FILE
    sed -i -e 's/\\"/'\"'/g' $GOOGLE_SERVICES_JSON_FILE

    echo "File content:"
    cat $GOOGLE_SERVICES_JSON_FILE
fi
