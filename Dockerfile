FROM shlinkio/shlink-web-client:2.3.1

ENV SHLINK_SERVER_NAME local
ENV SHLINK_SERVER_URL 'http://localhost:8080'
ENV SHLINK_BASIC_AUTH_USERS 'admin:$apr1$SxPSieqj$tL5m5a6u7zGk/eN2eNJX20'
ENV SHLINK_BASIC_AUTH_NAME 'Shlink Web Client'

WORKDIR /usr/share/nginx/html/

COPY servers.json.template .
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
