# Base image
FROM nginx:alpine

# Copy code files in ngix files
COPY . /usr/share/nginx/html

# Expose on Port 80
EXPOSE 80
