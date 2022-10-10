###### Création d'image #######

## Creation du docker file pour création de l'image
FROM node:12-alpine
RUN apk add --no-cache python2 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node","src/index.js"]

## Build de l'image ##
$ docker build -t docker_demo_image .

###### Création du container ##########

## Instanciation de l'image créer
$ docker run --name=docker_demo_container -dp 3000:3000 --rm docker_demo_image

## Vérification du fonctionnement de l'app
http://localhost:3000/

####### Update Container #######

## Arret du container
$ docker stop docker_demo_container

## Modification de notre app
-     <p className="text-center">You have no todo items yet! Add one above!</p> // update
+     <p className="text-center">You have nothing in the todolist! Add one above!</p> // update

# Re-build de l'image
$ docker build -t docker_demo_image .

## Instanciation de l'image modif
$ docker run --name=docker_demo_container -dp 3000:3000 --rm docker_demo_image

## Vérification du fonctionnement de l'app
http://localhost:3000/

###### DOCKER HUB #####

## Création d'une image MAJ pour la push sur le HUB => Convention de nommage : NomRepoDocker/NomImage
$ docker commit docker_demo_container kaldwins/my_demo_docker

## Push de notre image sur Hub Docker:Tag (ici Tag => :latest)
$ docker push kaldwins/my_demo_docker:latest

## Arret du container
$ docker stop docker_demo_container

## Instanciation de l'image depuis le répertoire distant / Hub Docker
$ docker run --name=my_docker_demo_container -dp 3000:3000 --rm kaldwins/my_demo_docker:latest

####### Volume #######

## Création d'un volume todo-db
$ docker volume create todo-db

#Vérification
$ docker volume ls

# Instanciation de l'image et connection au volume
$ docker run --name=my_docker_demo_container --rm -dp 3000:3000 -v todo-db:/etc/todos kaldwins/my_demo_docker:latest

## Vérification du fonctionnement de l'app + ajout de données
http://localhost:3000/

## Observer le volume
$ docker volume inspect todo-db

## Arret du container (suppression auto)
$ docker stop my_docker_demo_container

# Re-Instanciation de l'image et 
$ docker run --name=my_docker_demo_container --rm -dp 3000:3000 -v todo-db:/etc/todos kaldwins/my_demo_docker:latest

## Vérification du fonctionnement de l'app et de la persistance des données
http://localhost:3000/

## Instanciation d'un conteneur node:alpine et bind de notre repertoire de travail en Volume
## Version Windows
$ MSYS_NO_PATHCONV=1 docker run --name=my_demo_docker_container_dev --rm -dp 3000:3000 -w /app -v "$(pwd):/app" node:12-alpine sh -c "yarn install && yarn run dev"
## Version Mac
docker run --name=my_demo_docker_container_dev --rm -dp 3000:3000 -w /app -v "$(pwd):/app" node:12-alpine sh -c "apk add --no-cache python2 g++ make && yarn install && yarn run dev"

## Affichage des logs du serveur
$ docker logs -f my_demo_docker_container_dev

########### Multi Container App ###############

## Création du réseau
$ docker network create todo-db

## Création d'un container MySQL
## Version Windows
$ MSYS_NO_PATHCONV=1 docker run --name=my_sql_container -d --network todo-db --network-alias mysql -v todo-mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=todos mysql:5.7
## Version Mac
$ docker run --name=my_sql_container --rm -d --network todo-db --network-alias mysql --platform "linux/amd64" -v todo-mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=todos mysql:5.7

## Connection a la BDD
$ docker exec -it my_sql_container mysql -u root -p

## Saisir le MDP
$ secret

## Vérification de la BDD
$ SHOW DATABASES;

## Résultat
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| todos              |
+--------------------+
5 rows in set (0.04 sec)

## Exit de la BDD
$ exit

## Instanciation de l'app dans un conteneur en mode dev avec connection au reseau et insertion
$ docker run --name=todo_app_container --rm -dp 3000:3000 -w /app -v "$(pwd):/app" --network todo-db -e MYSQL_HOST=mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=secret -e MYSQL_DB=todos node:12-alpine sh -c "apk add --no-cache python2 g++ make && yarn install && yarn run dev"

## Vérification du fonctionnement de l'app + ajout d'une todo
http://localhost:3000/

## Connection a la BDD
$ docker exec -it my_sql_container mysql -u root -p

## Saisir le MDP
$ secret

## Affichage de la BDD
$ SHOW DATABASES;

## Choix de la BDD a utiliser
$ USE todos;

## Affichage de la Table
$ SHOW TABLES;

+-----------------+
| Tables_in_todos |
+-----------------+
| todo_items      |
+-----------------+
1 row in set (0.01 sec)

## Affichage du contenue de la table
$ SELECT * FROM todo_items;

+--------------------------------------+--------+-----------+
| id                                   | name   | completed |
+--------------------------------------+--------+-----------+
| 51642c09-3449-4780-983a-254bbc906a1d | Test-1 |         0 |
+--------------------------------------+--------+-----------+
1 row in set (0.01 sec)

## Exit de la BDD
$ exit

######### DOCKER compose ###########

## Création du fichier Docker-Compose
version: '3.7'

services:
    mysql:
        image: mysql:5.7
        volumes:
            - todo-mysql-data:/var/lib/mysql
        environment:
            MYSQL_ROOT_PASSWORD: secret
            MYSQL_DATABASE: todos
    app:
        image: node:12-alpine
        command: sh -c "apk add --no-cache python2 g++ make && yarn install && yarn run dev"
        ports:
            - 3000:3000
        working_dir: /app
        volumes:
            - ./:/app
        environment:
            MYSQL_HOST: mysql
            MYSQL_USER: root
            MYSQL_PASSWORD: secret
            MYSQL_DB: todos
volumes:
    todo-mysql-data:

## Démarrage de notre app multi container
$ docker compose up -d

## Vérification du fonctionnement
http://localhost:3000/

## Arret de notre app multi container
$ docker compose down


