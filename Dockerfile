# BUILD
FROM gradle:7-jdk11 AS build
COPY --chown=gradle:gradle . /container
WORKDIR /container
RUN chmod +x ./gradlew
RUN mvn clean package

# RUN
FROM openjdk:11
COPY --from=build . /bin
WORKDIR /bin/container/build/libs

ENTRYPOINT ["java","-jar","TaskSchedulerAvisi-1.0.jar"]
