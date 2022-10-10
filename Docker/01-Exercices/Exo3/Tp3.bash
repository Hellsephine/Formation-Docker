######################################################################
#				Tp3 - App Java
######################################################################

## => Executer le programme java dans un container à l'aide l'image openjdk:8

############################### Exercice #############################

# Création du Dockerfile
# import de l'image de base
FROM openjdk:8

# Information completentaire sur la version du dockerfile
LABEL version="1.0" maintainer="Pierre <pierre.gaillard.home@gmail.com>"

# Commande a executer dans le conteneur
RUN apt update && apt upgrade -y

# Se placer dans le working directory
WORKDIR /usr/src/myapp

# Copie des fichiers à l'interieur de notre conteneur
COPY . .

# Exposition des ports
EXPOSE 80

# Commande a executer dans le conteneur
RUN javac Main.java

# Commande de démarage du conteneur
CMD ["java","Main"]

# Build de notre image (ouvrir un terminal pointant sur l'emplacement du dockerfile)
$ docker build -t image_java .

# Run de notre container 
$ docker run image_java


