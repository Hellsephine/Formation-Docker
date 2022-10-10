######################################################################
#				Tp2 - Conteneur Web
######################################################################

## => Démarer un conteneur nommé "My_httpd" en tache de fond à partir de l'image httpd:latest (ne pas oublier le mapping des ports)
## => Se connecter au bash du conteneur
## => mise à jour de ce conteneur
## => Vérifier sur "http://localhost:8080/" que le message s'affiche bien
## => Changez le message retourné par le serveur web: /usr/local/apache2/htdocs/index.html
## => Vérifier sur "http://localhost:8080/" que le nouveau message s'affiche bien
## => Proceder à l'installation de git
## => Vérifier son installation avec la commande git --version

######################### Exercice ##################################

$ docker search httpd:latest

$ docker pull httpd:latest

$ docker run -tidp 8080:80 --name=exo2_container httpd:latest

$ docker exec -it exo2_container bash

$ apt update && apt upgrade -y && apt instal nano -y

$ ls -la

$ nano htdocs/index.html

$ apt install git

$ git --version

######################## Correction ##################################

## Téléchargement de l'image debian:latest
$ docker pull httpd:latest

## Instanciation du container
$ docker run --name=My_Httpd -dp 8080:80 httpd:latest

## Connection au bash du container
$ docker exec -it My_Httpd bash

## Modification du fichier index.html (dans le bash)
$ echo "<h1>J'ai modifie le message</h1>" > /usr/local/apache2/htdocs/index.html

## Télécharger les mises à jour puis metre à jour
$ apt update && apt upgrade -y && apt install git -y
