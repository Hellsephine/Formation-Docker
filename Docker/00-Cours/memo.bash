LISTE COMMANDE DOCKER & LINUX

$ docker —version
## Verification de la version installer

$ docker info
## Montre les information de docker

$ docker images
## Liste les images installer 

$ docker rmi <nom/id de l’image>
## Supprime une image

$ docker rmi - f <nom/id de l’image>
## Force la suppression de l’image

$ docker rmi - f $(docker image -q)
## Supprime tout

$ docker search <nom_image> —filter 
## permet de filtrer selon le critère donner

$ docker search <nom_image> —filter « is-official=true »
## Exemple de filtre pour trouver l'image offciel

$ docker pull <nom_image>
## Telecharge l’image a partir du hub

$ docker pull ubuntu 16.04
## Telecharge un version précise

$ docker pull ubuntu:latest
## Telecharge la dernière version

$ docker run [OPTION] <nom/id de l’image>
## Créer une instance de l’image

$ docker login 
## Pour ce connecter au docker hub

$ docker tag <img_name> <hub_user>/<repository_name>[:<tag>]
## Push de notre images dans notre repertoire public du hub docker

########################## OPTION ######################### 

[OPTION] : -tid, —name, —expose, 

—help
## Affiche la liste des option

-t 
## Alloue un terminal

-i 
## Garde le clavier accessible

-d 
## Exécute le conteneur en arrière plan

-p 
## Expose un ou plusieurs ports

-name:<nom>
## Permet de nommé l'objet voulu

--rm
## Execute le code puis supprime le container

#################################################

$ docker inspect <nom_conteneur>
## Inspecter le conteneur

$ docker stop <nom_conteneur>
## Stopper un conteneur Actif

$ docker rm <nom_conteneur>
## Supprime un conteneur

$ docker ps / docker container ls
## Liste les conteneur

$ docker ps -a
## Liste les conteneur actif et stopper

$ docker exec [OPTION]
## Exécute une commande donnée

$ docker start <nom_container>
## Lance le conteneur deja existant

$ docker exec -it <nom_container> bash
## Lance le bash 

$ docker build -t <nom_image> .
## Créer une image

$ docker volume create <volume_name>
## Création du volume

$ docker volume ls
## Lister les volume existant

$ docker volume inspect <name_volume>
## Inspecter un volume

$ docker volume rm <volume_name>
## Supprimer un volume

$ docker commit <name_container> <name_User>/<name_image>
## Création d'une image MAJ pour la push sur le HUB => Convention de nommage : NomRepoDocker/NomImage

$ docker push <name_User>/<name_image>:<Tag>
## Push de notre image sur Hub Docker:Tag (ici Tag => :latest)

$ docker logs -f <name_container>
## Affichage des logs du serveur

$ docker network create todo-db
## Création du réseau

$ docker compose up -d
## Démarrage de l'app multi container

$ docker compose logs <nom_container>
## Permet de voir les logs du conteneur

$ docker compose down
## Arret le multi conteneur et le supprime

$ docker compose down --volumes
## Arret du multi conteneur le supprime ainsi que le volume

#################### COMMANDE LINUX #############################

$ apt update
## Mets a jour les paquet linux

$ apt upgrade
## Applique les mise a jour 

$ apt install <nom_app>
## Installe l’app demandé

$ apt install <nom_app> -y
## Installe l’app demandé et valide directement

$ nano (apt install nano ,si pas deja installé)
## Ouvre l’éditeur de texte nano

$ ls -la
## ## Affiche tout les fichier

$ cat <nom_fichier>
## Affiche le contenue du fichier

$ cd <nom_dossier>
## Entre dans le dossier spécifié

$ exit
## Quitte bash





