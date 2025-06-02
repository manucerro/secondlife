# Fase de construcción
FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /workspace
# Copia SOLO los archivos necesarios para evitar problemas de caché
COPY pom.xml .
COPY src src
# Empaqueta la aplicación
RUN mvn clean package -DskipTests
# Fase de ejecución
FROM openjdk:17-jdk-slim
WORKDIR /app
# Copia el JAR desde la fase de construcción
COPY --from=build /workspace/target/*.jar app.jar
# Puerto expuesto (debe coincidir con server.port de Spring)
EXPOSE 8080
# Comando de inicio
ENTRYPOINT ["java", "-jar", "app.jar"]