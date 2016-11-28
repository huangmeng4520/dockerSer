# dockerSer
docker server

git init

git add README.md

git commit -m "first commit"

git remote add origin https://github.com/huangmeng4520/dockerSer.git

git push -u origin master

elasticsearch 5.0.1纯净版dockerfile，目前不能直接集成head插件，head插件必须单独作为nodejs服务器启动

虚拟机启动docker es时候汇报如下错误：max virtual memory areas vm.max_map_count [65530] likely too low, increase to at least [262144]

可以参照：http://blog.csdn.net/u012371450/article/details/51776505

 sysctl -w vm.max_map_count=262144
