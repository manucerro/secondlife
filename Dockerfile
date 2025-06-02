# --- Fase de construcción (compila el JAR con Maven) ---

FROM maven:4.0.0-openjdk-17 AS build

WORKDIR /app

COPY pom.xml .

COPY src ./src

# Ejecuta Maven para empaquetar el proyecto (omite tests para mayor velocidad)

RUN mvn clean package -DskipTests

# --- Fase de ejecución (solo el JAR en una imagen ligera) ---

FROM openjdk:17-jdk-slim

WORKDIR /app

# Copia el JAR desde la fase de construcción

COPY --from=build /app/target/secondlife-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto que usa Spring Boot (normalmente 8080)

EXPOSE 8080

# Comando para ejecutar la aplicación

CMD ["java", "-jar", "app.jar"]
 