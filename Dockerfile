FROM eclipse-temurin:17-jre
WORKDIR /app
COPY *.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
