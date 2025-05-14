# Stage 1: Build the app
FROM maven:3.9.4-eclipse-temurin-11 AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the app
FROM eclipse-temurin:11-jdk
WORKDIR /app
COPY --from=build /app/target/*.war app.war
ENTRYPOINT ["java", "-jar", "app.war"]
