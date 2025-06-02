# --- Fase de construcción con Maven 3.9.9 y Java 17 ---
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /workspace
COPY pom.xml .
COPY src src
RUN mvn clean package -DskipTests  # Omite tests para construcción rápida
# --- Fase de ejecución con Java 17 ---
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=build /workspace/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]