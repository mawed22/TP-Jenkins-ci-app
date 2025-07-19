# CI/CD App - Flask + Docker + Jenkins

Ce projet met en place une application Flask simple déployée via une pipeline CI/CD Jenkins. L'application est containerisée avec Docker, puis poussée sur Docker Hub et déployée sur un serveur distant (ex: EC2) grâce à un script bash automatisé.

---

## Technologies utilisées

- Python + Flask
- Docker & Docker Compose
- Jenkins Pipeline
- Bash (déploiement distant)
- GitHub + Docker Hub
- Serveur cible (EC2 par exemple)

---

## Lancement local (dev)

1. Avec Docker Compose:
   ```bash
   docker-compose up --build -d

2. Nettoyer l’infrastructure  :
   ```bash
   docker rm -f TP_app
   docker rmi TP-app



### configuration jenkins
*** Configuration des plugins Jenkins ***

- Pour le pipeline CI/CD Docker + déploiement SSH, installe ces plugins :

- Pipeline (déjà présent dans Jenkins LTS)

- Docker Pipeline (pour intégrer docker dans pipeline)

- Credentials Binding Plugin (pour gérer variables secrètes)

- SSH Agent Plugin (pour gérer les clés SSH dans pipeline)

- Git Plugin (pour cloner le repo)


*** Ajouter les Credentials dans Jenkins ***
- Dans Jenkins → Credentials → Système → Global credentials

- Ajoute ta clé SSH privée pour accéder à l’EC2 (ec2-key) → type SSH Username with private key

- Ajoute tes identifiants Docker Hub (dockerhub-creds) → type Username with password
