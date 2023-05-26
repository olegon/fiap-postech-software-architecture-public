FROM maven:3-amazoncorretto-17 AS build

WORKDIR /opt/app

COPY app/ .

RUN mvn package

FROM amazoncorretto:17

WORKDIR /opt/app

COPY --from=build /opt/app/target/app*.jar app.jar

CMD [ "java", "-jar", "app.jar" ]
