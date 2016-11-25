FROM alpine:latest
MAINTAINER huangmeng<huangmeng4520@163.com>

ENV ELASTICSEARCH_MAJOR 5.0.1
ENV ELASTICSEARCH_VERSION 5.0.1
ENV ELASTICSEARCH_URL_BASE https://artifacts.elastic.co/downloads/elasticsearch
ENV PATH /opt/elasticsearch/bin:$PATH


# openjdk-8-base contains no GUI support. see https://mirrors.tuna.tsinghua.edu.cn<清华大学>
RUN echo 'https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/main/' > /etc/apk/repositories \
  && echo 'https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/community/' >> /etc/apk/repositories \
   #&& echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
  #&& echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
  && apk update \
  && apk upgrade \
  && apk add openssl \
  && apk add ca-certificates \
  && apk add  openjdk8-jre-base \
  && apk add bash curl \
  && rm -rf /var/cache/apk/*

RUN curl -fsSL -o /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 \
	&& chmod 0755 /usr/bin/dumb-init
RUN set -x \
	&& curl -fsSL -o /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 \
	&& chmod +x /usr/local/bin/gosu

RUN set -ex \
	&& mkdir -p /opt \
	&& curl -fsSL -o /tmp/elasticsearch.tar.gz $ELASTICSEARCH_URL_BASE/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz \
	&& tar -xzf /tmp/elasticsearch.tar.gz -C /opt \
	&& rm -f /tmp/elasticsearch.tar.gz \
	&& mv /opt/elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch \
	&& addgroup elasticsearch \
	&& adduser -D -G elasticsearch elasticsearch \
	&& chown -R elasticsearch:elasticsearch /opt/elasticsearch \
    && chmod +x /opt/elasticsearch/bin/elasticsearch

COPY config /opt/elasticsearch/config

VOLUME /opt/elasticsearch/data
#注意docker-entrypoint.sh权限777
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9200 9300

CMD ["elasticsearch"]
