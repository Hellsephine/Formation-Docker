# import de l'image de base
FROM debian
 
# Information completentaire sur la version du dockerfile
LABEL version="1.0" maintainer="Pierre <pierre.gaillard.home@gmail.com>"
 
# Commande a executer dans le conteneur
RUN apt update && apt upgrade -y && apt install nodejs -y && apt install npm -y && apt install nano -y
 
# Se placer dans le working directory
WORKDIR /home/web
 
# Copie des fichiers à l'interieur de notre conteneur
COPY . .
 
# Exposition des ports
EXPOSE 80
 
# Commande a executer dans le conteneur
RUN npm install express
 
# Commande de démarage du conteneur
CMD ["node","index.js"]