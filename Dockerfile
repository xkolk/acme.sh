FROM xkolk/nginx:latest
MAINTAINER Serhii Kolisnyk <kolkmail@gmail.com>

#ENV NGINX_VERSION 1.24.0
#ENV PKG_RELEASE   14

#RUN wget -q -O- https://get.acme.sh | sh
RUN apk add --no-cache wget
# create a docker-entrypoint.d directory
#  #  && mkdir /docker-entrypoint.d

#COPY docker-entrypoint.sh /
#COPY 10-listen-on-ipv6-by-default.sh /docker-entrypoint.d
#COPY 20-envsubst-on-templates.sh /docker-entrypoint.d
#COPY 30-tune-worker-processes.sh /docker-entrypoint.d
#ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["sh", "-c", "crond && nginx -g 'daemon off;'"]
