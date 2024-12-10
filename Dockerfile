FROM nginx:alpine
ARG SERVICE_NAME=default
RUN echo "server { \
    listen 80; \
    location /health { \
        return 200 'healthy'; \
    } \
    location / { \
        return 200 'Hello from ${SERVICE_NAME}'; \
    } \
}" > /etc/nginx/conf.d/default.conf