############# Exercice Docker-Compose ############

## Build de l'image a partir du dockerfile
$ docker build -t ex_docker_compose .

## Création du fichier Docker-Compose
version: '3.7'

services:
    app:
        image: ex_docker_compose
        ports:
            - 8080:80
        working_dir: /var/www/html
        volumes:
            - ./app:/var/www/html
    mysql_c:
        image: mysql:5.7
        volumes:
            - ex-mysql-data:/var/lib/mysql
            - ./articles.sql:/docker-entrypoint-initdb.d/articles.sql
        environment:
            MYSQL_ROOT_PASSWORD: test
            MYSQL_DATABASE: test
            MYSQL_USER: test
            MYSQL_PASSWORD: test
            MYSQL_DB: test
volumes:
    ex-mysql-data:

## Démarrage de notre app multi container
$ docker compose up -d

## Vérification du fonctionnement de l'app + ajout d'un article
http://localhost:3000/

## Connection a la BDD
docker exec -it 2ce2e734667a mysql -u root -p

## Saisir le MDP
$ test

## Affichage de la BDD
$ SHOW DATABASES;

## Choix de la BDD a utiliser
$ USE test;

## Affichage de la Table
$ SHOW TABLES;

+----------------+
| Tables_in_test |
+----------------+
| articles       |
+----------------+
1 row in set (0.00 sec)

## Affichage du contenue de la table
$ SELECT * FROM articles;

+----+-------+--------+---------------------+-------------+
| id | title | author | date                | content     |
+----+-------+--------+---------------------+-------------+
|  1 | Test  | Pierre | 2022-10-06 13:40:02 | Test-Pierre |
+----+-------+--------+---------------------+-------------+
1 row in set (0.03 sec)

## Quitte bash
$ exit

## Arret du multi conteneur le supprime ainsi que le volume
$ docker compose down --volumes
