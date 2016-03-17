#建立初始化数据
##初始化用户名和密码部分
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/username asiainfoLDP
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/password 2016asia

##初始化catalog
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon/catalog

###创建服务 redis
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73 #服务id

###创建服务级的配置
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/name "redis_sample"
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/description "A Sample Redis instance on Mesos"
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/bindable true
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/planupdatable false
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/tags 'redis,mesos,marathon,experiment'
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/metadata '{"displayName":"REDIS","imageUrl":"https://d33na3ni6eqf5j.cloudfront.net/app_resources/18492/thumbs_112/img9069612145282015279.png","longDescription":"Redis is an open source (BSD licensed), in-memory data structure store, used as database, cache and message broker. It supports data structures such as strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyperloglogs and geospatial indexes with radius queries. Redis has built-in replication, Lua scripting, LRU eviction, transactions and different levels of on-disk persistence, and provides high availability via Redis Sentinel and automatic partitioning with Redis Cluster.","providerDisplayName":"Asiainfo","documentationUrl":"http://redis.io/documentation","supportUrl":"http://redis.io"}'

###创建套餐目录
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/plan
###创建套餐1
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/plan/BBA0DB50-6CEE-4F9D-B10C-6C56E444481A
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/plan/BBA0DB50-6CEE-4F9D-B10C-6C56E444481A/name "Sample"
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/plan/BBA0DB50-6CEE-4F9D-B10C-6C56E444481A/description "one docker on mesos"
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/plan/BBA0DB50-6CEE-4F9D-B10C-6C56E444481A/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/885AE7CE-B859-4F75-AEAE-392530F15D73/plan/BBA0DB50-6CEE-4F9D-B10C-6C56E444481A/free true

##初始化instance
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon/instance

###创建服务 elasticsearch
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB #服务id

###创建服务级的配置
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/name "elasticsearch_sample"
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/description "A Sample Elasticsearch instance on Mesos"
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/bindable true
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/planupdatable false
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/tags 'elasticsearch,mesos,marathon,experiment'
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/metadata '{"displayName":"KAFKA","imageUrl":"https://d33na3ni6eqf5j.cloudfront.net/app_resources/18492/thumbs_112/img9069612145282015279.png","longDescription":"elasticsearch is a restful api for search","providerDisplayName":"Asiainfo","documentationUrl":"https://www.elastic.co/products/elasticsearch","supportUrl":"https://www.elastic.co/products/elasticsearch"}'

###创建套餐目录
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/plan
###创建套餐1
docker exec etcd /etcdctl -u root:asiainfoLDP mkdir /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/plan/46266B0D-8C96-47CA-A351-986A655AD522
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/plan/46266B0D-8C96-47CA-A351-986A655AD522/name "Sample"
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/plan/46266B0D-8C96-47CA-A351-986A655AD522/description "one docker on mesos"
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/plan/46266B0D-8C96-47CA-A351-986A655AD522/metadata '{"bullets":["20 GB of Disk","20 connections"],"displayName":"Shared and Free" }'
docker exec etcd /etcdctl -u root:asiainfoLDP set /servicebroker/marathon/catalog/611D2A65-2824-4E47-85E6-BC53A8528EBB/plan/46266B0D-8C96-47CA-A351-986A655AD522/free true


