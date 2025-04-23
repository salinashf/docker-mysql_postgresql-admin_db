# Contenedor con BdD(mysql-postgresql) y sus Administradores BdD

> Este contenedor carga los dos motores de BDD y sus administradores

## Volúmenes

> Para poder crear los Volúmenes

- `docker volume create mysql_data_springboot`

- `docker volume create postgresql_data_springboot`

- `docker volume create postgresql_db_admin_springboot`

- `docker volume create mysql_db_admin_springboot`

## Red de Conexión

Para crear la red que une a todos los contendores

Se crea la red en el rango 100.188.0.1 - 100.188.0.14

`docker network create --driver bridge --subnet 100.188.0.0/28 --gateway 100.188.0.1 networkDevicesMySqlSpringboot`

## Para controlar el contenedor

El contenedor se está ejecutándose agrupado por nombre de proyecto: **docker-data_springboot-pry**

> iniciar `docker-compose -p docker-data_springboot-pry up -d`

> apagar `docker-compose -p docker-data_springboot-pry down`
