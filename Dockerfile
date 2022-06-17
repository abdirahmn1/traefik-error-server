FROM nginx:stable-alpine

COPY ./error-pages /usr/share/nginx/error-pages

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf