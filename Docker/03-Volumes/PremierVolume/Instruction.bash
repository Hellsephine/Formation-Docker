#########################################
# LES VOLUMES #
#########################################

## Création du volume
$ docker volume create <volume_name>
$ docker volume create Vtest

## Lister les volume existant
$ docker volume ls

## Inspecter un volume
$ docker volume inspect Vtest

## Supprimer un volume
$ docker volume rm <volume_name>

## Création de l'image
$ docker build -t img_test .

## Verification de l'image
$ docker images

## Instanciation de l'image
$ docker run --name=img_volume_test_container -it -v  Vtest:/data img_test

## Création d'un conteneur 
FROM ubuntu:latest

RUN mkdir /data

WORKDIR /data

## Créer un fichier dans le dossier surveillé par le volume
echo "Ceci est un test" > test.txt

## Afficher le contenu du ficher test.txt
$ cat test.txt

