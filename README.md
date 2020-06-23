Lancer le projet
================

Une fois lancé, le projet est disponible sur le port 80.

# Docker est obligatoire pour utiliser ce projet !

Rendez-vous sur Docker pour l'installer : https://www.docker.com/

# Une fois le repository téléchargé :
```
docker-compose up -d

docker-compose exec app yarn install --check-files

docker-compose exec app rails db:migrate
```
# Pour créer un admin :

Créer le premier compte.

Une fois le compte créé, se rendre sur la console :

```
docker-compose exec app rails s

#rb>user.find(1).update(role: 'admin')
```
L'admin peut supprimer des comptes utilisateurs et est le seul à pouvoir ajouter des genres.

