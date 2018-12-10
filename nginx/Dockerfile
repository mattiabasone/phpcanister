FROM nginx:latest

ARG HOST_USER_UID

COPY nginx.conf /etc/nginx/

RUN useradd -r phpcanister
RUN usermod -u ${HOST_USER_UID} phpcanister
RUN groupmod -g ${HOST_USER_UID} phpcanister