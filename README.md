#beego-blog

使用beego框架创建的博客系统

http://go-blog.igo9go.cn
###安装
- 安装go
    - mac 直接下载安装 https://storage.googleapis.com/golang/go1.7.3.darwin-amd64.pkg
    
    - linux
    
        1. wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
        2. 解压 tar -zxf go1.7.3.linux-amd64.tar.gz ,放到合适的位置
        
        3. 修改 etc/profile 文件在文件后加入 export的几行，在unset下面直接加，不要有空行
        ![](http://oc9orpe44.bkt.clouddn.com/16-10-31/49731129.jpg)
        
        4. 然后执行 source /etc/profile 刷新配置文件
        
        5. 运行命令 go 测试go是否安装成功
        
- go get github.com/astaxie/beego
- go get github.com/beego/bee
- go get igo9go/beego-blog

- cd $GOPATH/src/igo9go/beego-blog

- 数据库配置文件修改

- bee run 

- 访问 

    前端 http://127.0.0.1:8080
    
    后台 http://127.0.0.1:8080/admin
    
    账号:admin
    密码:admin
  
- 部署
    后台启动守护进程nohup ./blog &(可以使用supervisor)
    nginx代理8080端口

```
 server {
     listen       80;
     server_name  go-blog.igo9go.cn;
 
     charset utf-8;
     access_log  /tmp/beego.access.log;
 
     location /(css|js|fonts|img)/ {
         access_log off;
         expires 1d;
 
         root "/data/goproject/src/static";
     }
 
     location / {
         proxy_set_header X-Forwarded-For $remote_addr;
         proxy_set_header Host            $http_host;
         proxy_pass http://127.0.0.1:8080;
     }
 }
 ```
 

