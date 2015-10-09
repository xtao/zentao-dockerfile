FROM ubuntu:14.04
RUN apt-get update -q \
&& DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends \
php5 apache2 mysql-server-5.5 php5-mysql
EXPOSE 80
VOLUME ["/var/log/apache2", "/var/www/zentaopms", "/var/lib/mysql"]
COPY zentao.conf /etc/apache2/sites-enabled/
COPY wrapper /usr/bin/
CMD ["/usr/bin/wrapper"]
