FROM php:7.0-alpine
RUN apk add --no-cache patch
RUN pear install PHP_CodeSniffer-3.3.2
ENV WPCS_VERSION 1.2.0
ADD https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards/archive/${WPCS_VERSION}.zip /wpcs.zip
RUN unzip /wpcs.zip -d / && \
    phpcs --config-set installed_paths /WordPress-Coding-Standards-${WPCS_VERSION}

WORKDIR /app

CMD ["php"]
CMD ["phpcbf"]
CMD ["phpcs"]
