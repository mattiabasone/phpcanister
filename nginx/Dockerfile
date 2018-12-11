FROM nginx:latest

ARG HOST_USER_UID
ARG APP_CODE_PATH_CONTAINER

COPY nginx.conf /etc/nginx/

RUN useradd -r phpcanister
RUN usermod -u ${HOST_USER_UID} phpcanister
RUN groupmod -g ${HOST_USER_UID} phpcanister

RUN mkdir -p ${APP_CODE_PATH_CONTAINER}
RUN chown phpcanister:phpcanister ${APP_CODE_PATH_CONTAINER}

VOLUME ${APP_CODE_PATH_CONTAINER}

CMD nginx

EXPOSE 80