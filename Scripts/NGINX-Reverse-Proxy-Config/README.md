# NGINX Rever Proxy

- Download the shell script file
- execute with following command:

      nginx-reverse-proxy.sh [Application Name] [Destination URL] [Server Port] [Server URL]

This scripts require following arrguments:

1. Application Name: Name of application/file that will be created in NGINX configuration (required)
2. Destination URL: URL of application that is required to be served from reverse proxy (required)
3. Server Port: Port of the server that will be exposed for this application (required)
4. Server URL: URL that will resolved this application (optional)
