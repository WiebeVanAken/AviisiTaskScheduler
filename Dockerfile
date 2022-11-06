# BUILD
FROM maven:3.6.0-jdk-11-slim AS build
COPY --chown=gradle:gradle . /container
WORKDIR /container
RUN mvn clean package

# RUN
FROM openjdk:11
COPY --from=build . /bin
WORKDIR /bin/container/build/libs

ENTRYPOINT ["java","-jar","TaskSchedulerAvisi-1.0.jar"]