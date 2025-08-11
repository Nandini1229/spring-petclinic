FROM maven:3.9.11-eclipse-temurin-17-alpine AS build
RUN apk  add  --no-cache git
RUN git clone git@github.com:Nandini1229/spring-petclinic.git && \ 
    cmd spring-petclinic && \ 
    mvn package



FROM openjdk:25-ea-17-jdk AS run 
RUN adduser -D -h /usr/share/demo -s/bin/bash nandana 
USER nandana 
WORKDIR /usr/share/demo 
COPY --from=build /spring-petclini/target/*.jar app.jar
EXPOSE 8080/tcp
CMD ["jar","jar","app.jar"]