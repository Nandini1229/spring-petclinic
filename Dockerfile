FROM maven:3.9.11-eclipse-temurin-17-alpine AS build
RUN apk  add  --no-cache git
RUN git clone git@github.com:Nandini1229/spring-petclinic.git \ 
    cmd spring-petclinic && \ 
    && .mvn package
FROM openjdk:25-ea-17-jdk AS run 
RUN adduser -D -h /usr/share/demO -s/bin/bash nandana user
USER nandana user
WORKDIR /usr/share/demo 
COPY --from=build /target/*.jar .
EXPOSE 8080/tcp
CMD ["jar","jar","*jar"]