FROM httpd:2.4

COPY ./portfolio /usr/local/apache2/htdocs/

EXPOSE 80

ENV TZ Europe/Moscow
