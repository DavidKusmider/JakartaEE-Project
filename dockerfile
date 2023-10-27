# Utilisez l'image officielle Maven comme base pour la phase de build
FROM maven:3.8.4-openjdk-11 AS builder

# Copiez le fichier pom.xml pour installer les dépendances
COPY pom.xml /tmp/

# Copiez tout le code source dans le conteneur
COPY src /tmp/src/

# Définissez le répertoire de travail
WORKDIR /tmp/

# Exécutez Maven pour compiler le projet et générer le fichier WAR
RUN mvn package

# Utilisez l'image officielle Tomcat comme base pour la phase d'exécution
FROM tomcat:10.1.15-jdk11-temurin-jammy

# Copiez le fichier WAR généré à partir de la phase de build dans le répertoire webapps de Tomcat
COPY --from=builder /tmp/target/*.war $CATALINA_HOME/webapps/

# Exposez le port sur lequel Tomcat écoute (par défaut 8080)
EXPOSE 8080
