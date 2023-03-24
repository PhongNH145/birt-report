# About
+ Birt version: 4.13.0
+ Tomcat version: 9.0.73

# Instruction
+ Add db source:
  + create file **.env** contain
  ```pycon
  DB_HOST=localhost
  DB_PORT=5432
  DB_USER=odoo
  DB_PASSWORD=odoo
  DB_NAME=odoo
  ```
  + run image with mapping volume: .env:/usr/local/tomcat/.java_opts_env 

# Reference
+ [Docker image](https://hub.docker.com/r/xmars/birt-report/tags)
+ Template example with global JNDI source:
  - [so_chi_tiet_cong_no.rptdesign](templates/so_chi_tiet_cong_no.rptdesign) : line 121->122
+ Template example with specific database source:
  - [so_chi_tiet_tien_vay_341.rptdesign](templates/so_chi_tiet_tien_vay_341.rptdesign): line 122->125
+ Docker commands
```shell
# Prune every unused docker objects
docker system prune --volumes -f

# Remove dangling volumes
docker volume rm -f $(docker volume ls -f dangling=true)

# Remove exited container
docker rm -f $(docker ps --filter status=exited -q)

# Docker removes dangling (<none> tag) image
docker rmi $(sudo docker images -f "dangling=true" -q)

# Display full content of all tag for container
docker ps --no-trunc -a
```
+ [How to create Dockerfile with cmd and entrypoint by bash script](https://docs.docker.com/engine/reference/builder/#entrypoint)

+ [Birt report main page](https://eclipse.github.io/birt-website/)
+ [Download archived birt versions](https://archive.eclipse.org/birt/downloads/drops/)
+ [XMars birt report image](https://hub.docker.com/r/xmars/birt-report/tags)
