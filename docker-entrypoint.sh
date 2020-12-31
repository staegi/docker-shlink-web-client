#!/bin/sh
set -e

if [[ -z "$SHLINK_SERVER_API_KEY" ]]; then
    echo "No API key has been set"
else
    echo "Adding server '$SHLINK_SERVER_NAME' under $SHLINK_SERVER_URL"
    envsubst < servers.json.template > servers.json
fi


if [[ -z "$SHLINK_BASIC_AUTH_USERS" ]]; then
    echo "No users found for basic auth"
else
    echo "Creating .htpasswd file"
    echo "$SHLINK_BASIC_AUTH_USERS" > /etc/nginx/.htpasswd
fi

if [[ -z "$SHLINK_BASIC_AUTH_USERS" ]]; then
    echo "No name found for basic auth"
else
    echo "Setting basic auth name"
    sed -i "s/SHLINK_BASIC_AUTH_NAME/$SHLINK_BASIC_AUTH_NAME/g" /etc/nginx/conf.d/default.conf
fi

exec "$@"
