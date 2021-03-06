sudo ssh-keygen -t rsa -C "1379393531@qq.com"
sudo cat /root/.ssh/id_rsa.pub
sudo ssh -T git@gitee.com
sudo git clone git@gitee.com:vsqq0/demo.git
cd demo
sudo ./init.sh

部署
git tag v1.0
git push origin --tag

nohup node deploy.js &
sudo cat /home/ubuntu/nohup.out
jobs -l
kill -9 xxxx

变成可执行文件
sudo chmod +x init.sh 

停止nginx
nginx -s stop
开启生产环境前必须数据库迁移
rails db:migrate RAILS_ENV=production

生产环境生成 key 覆盖 config/secrets.yml 里的 secret_key_base
$ rake secret RAILS_ENV=production
docker --registry-mirror=https://registry.docker-cn.com daemon

docker-compose rm 关闭多余的容器
docker-compose build 重新构建 dockerFile
docker-compose up -d 开启项目

docker 里面 bundle
docker-compose.exe run cms bundle

本地 bundle i 将版本写入 Gemfile.lock
git 全部提交
heroku login
heroku keys:add
git push heroku master

实在 push 不到 重新创建 heroku
heroku create

heroku run bundle exec rake db:migrate

返回 ajax 的数据
render :json => {:key => "value"}.to_json

增加字段
rails generate migration add_category_id_to_cate_detail category_id:integer

class Mother
has_many :sons
end

class Son
belongs_to :mother
end
解释：一个妈妈又多个孩子，一个儿子属于一个妈妈。我们在 rails console 可以测试下：
xiao_wang = Son.first  
mom = xiaowang.mother

gem 'carrierwave',             '1.1.0'
gem 'mini_magick',             '4.7.0'
gem 'fog-aws',                 '2.0.0'
gem 'nokogiri',                '1.8.1'
rails generate uploader Picture
mount_uploader :picture, PictureUploader

dotenv config/application.yml 注释

docker容器互相访问端口demo，server容器暴露自己的8001端口，nginx配置文件通过访问http://server:8001来访问server容器的8001端口

version: "3"
services:
  nginx:
    image: registry.docker-cn.com/library/nginx
    volumes:
      - .:/usr/share/nginx/html
      - ./nginx/conf/nginx.conf:/etc/nginx/nginx.conf
      - ./nginx/logs:/var/log/nginx
      - ./nginx/cert:/etc/nginx/cert
    ports:
      - "443:443"
      - "80:80"
    depends_on:
      - server
      - post
    command: "nginx -g 'daemon off;'"

  server:
    image: hub.c.163.com/library/node:latest
    expose:
      - "8001"
    volumes:
      - ./:/app
    restart: always
    working_dir: /app
    command: "node ./deploy/deploy-server.js"
  
  post:
    image: hub.c.163.com/library/node:latest
    volumes:
      - ./:/app
    # restart: always
    working_dir: /app
    command: "node ./deploy/deploy.js"   
