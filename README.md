# Shlink Web Client for Docker

This repository is to preconfigure the servers and add HTTP authentication to the web client of [Shlink][2].

For further documentation see [the official Shlink Dockerhub page][1].

## Environment variables 

    SHLINK_SERVER_NAME (default: local)
    SHLINK_SERVER_URL (default: http://localhost:8080) 
    SHLINK_SERVER_API_KEY
    SHLINK_BASIC_AUTH_USERS (default: admin:shlink)
    SHLINK_BASIC_AUTH_NAME (default: Shlink Web Client)

[1]: https://hub.docker.com/r/shlinkio/shlink-web-client
[2]: https://shlink.io