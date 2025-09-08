# Etapa 1: build do JAR
FROM gradle:8.4.0-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle bootJar --no-daemon

# Etapa 2: imagem final para rodar o app
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
