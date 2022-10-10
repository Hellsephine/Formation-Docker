###################################

## +> Executer le serveur express dans un container à l'aide l'image debian:latest

##################################

# Commencer par créer un projet node
$ npm init

# Création du fichier index.js (copier les instructions)
const express = require('express');

const app = express();

app.get('/',(req,res)=>{
    res.send("Bonjour depuis mon serveur node.js")
})

app.listen(80,()=>{
    console.log("App is running")
})

# Création du Dockerfile
# import de l'image de base
FROM debian

# Information completentaire sur la version du dockerfile
LABEL version="1.0" maintainer="Anthony Di Persio <anthony@utopios.net>"

# Commande a executer dans le conteneur
RUN apt update && apt upgrade -y && apt install nodejs -y && apt install npm -y && apt install nano

# Se placer dans le working directory
WORKDIR /home/web

# Copie des fichiers à l'interieur de notre conteneur
COPY . .

# Exposition des ports
EXPOSE 80

# Commande a executer dans le conteneur
RUN apt-get install express -y

# Commande de démarage du conteneur
CMD ["node","index.js"]

# Build de notre image (ouvrir un terminal pointant sur l'emplacement du dockerfile)
$ docker build -t my_node_server_image .