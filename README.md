## 进入容器命令


```angular2html

主站稳定版本
docker run -p 4000:4000 -d docker.io/xiquwugou/s110b:stable-20230922114239
docker exec -it $(docker ps --format '{{.ID}}\t{{.Image}}\t{{.Status}}' | grep 's110b' | grep 'Up' | awk '{print $1}') sh

vip版本的docker

```

* 用github 编译了一个适应各中平台的jekyll编辑器，默认会启动一个jekyll静态网站
* 访问地址： [http://127.0.0.1:4000](http://localhost:4000)
* jekyll没有生成文章的命令，直接复制现有的文章改日期就ok
* 这个镜像体积较大，因为集成了各种工具，和zsh，方便命令操作
* *对命令做了精简，现在镜像只有160MB，之前是600多mB*

两种方式：
* 直接拉取镜像执行
* 用compose命令执行。

```shell

docker-compose  up -d
docker-compose exec s110b sh



启动docker

docker run -p 4000:4000 -d xiquwugou/s110b

进入zsh，执行命令

docker exec -it $(docker ps --format '{{.ID}}\t{{.Image}}\t{{.Status}}' | grep 's110b' | grep 'Up' | awk '{print $1}') sh
```

- I wanted two images, one for easy CLI (`bretfisher/jekyll`) and one for

