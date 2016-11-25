#! /bin/bash
es_data=/home/ELK/es/data/
es_log=/home/ELK/es/logs/
es_config=/home/ELK/es/config/
images_data=/opt/elasticsearch/data/
images_log=/opt/elasticsearch/logs
images_config=/opt/elasticsearch/config/

docker run -d --name=zles -p 9200:9200 -p 9300:9300 -v $es_data:$images_data -v $es_log:$images_log -v $es_config:$images_config zles