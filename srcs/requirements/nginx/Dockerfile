FROM alpine:latest
RUN apk upgrade --update-cache --available && \
    apk add --no-cache nginx && \
    apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey \
    rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=student/CN=ssabbaji.1337.ma"

COPY nginx.conf /etc/nginx/
CMD ["nginx", "-g", "daemon off;"] 
