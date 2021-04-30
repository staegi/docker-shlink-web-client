FROM shlinkio/shlink-web-client:3.1.0

ENV SHLINK_SERVER_NAME local
ENV SHLINK_SERVER_URL 'http://localhost:8080'
ENV SHLINK_BASIC_AUTH_USERS 'admin:$apr1$SxPSieqj$tL5m5a6u7zGk/eN2eNJX20'
ENV SHLINK_BASIC_AUTH_NAME 'Shlink Web Client'

RUN sed -i "6 i auth_basic \"SHLINK_BASIC_AUTH_NAME\";\nauth_basic_user_file /etc/nginx/.htpasswd;" /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html/

COPY servers.json.template .
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
