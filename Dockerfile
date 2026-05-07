#FROM eclipse-temurin:21-jdk-jammy

#WORKDIR /app

#COPY . .

#RUN chmod +x gradlew

#RUN ./gradlew  build -x test

#EXPOSE 8080

#CMD ["java", "-jar", "build/libs/app-0.0.1-SNAPSHOT.jar"]
#============================================================
#FROM eclipse-temurin:21-jre-jammy

#WORKDIR /app

#COPY build/libs/*.jar app-0.0.1-SNAPSHOT.jar

#EXPOSE 8080

#ENTRYPOINT ["java", "-jar", "app-0.0.1-SNAPSHOT.jar"]

# Stage 1: Build
FROM eclipse-temurin:21-jdk-jammy AS build
WORKDIR /app

# Copy only gradle files first to cache dependencies
COPY gradlew .
COPY gradle gradle
COPY build.gradle.kts settings.gradle.kts ./


RUN chmod +x gradlew
RUN ./gradlew dependencies --no-daemon

# Copy source and build
COPY src src
RUN ./gradlew build -x test --no-daemon

# Stage 2: Runtime
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Create a non-root user for security
RUN useradd -ms /bin/bash appuser
USER appuser

# Copy only the built jar from the build stage
COPY --from=build /app/build/libs/*-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]