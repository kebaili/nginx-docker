FROM nginx:1.13.6-alpine

MAINTAINER Mohamed Omar Kebaili <kebaili.med.omar@gmail.com>

RUN apk update
RUN apk add tcpdump

ADD nginx-part1.conf.tmpl /etc/nginx/nginx-part1.conf.tmpl
ADD nginx-part2.conf.tmpl /etc/nginx/nginx-part2.conf.tmpl

COPY nginxscript.sh /nginxscript.sh

EXPOSE 1700/UDP

RUN chmod +x /nginxscript.sh

ENTRYPOINT ["/nginxscript.sh"]
