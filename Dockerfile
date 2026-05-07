FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

COPY . .

# Install dos2unix and convert the wrapper script, this adde because it show error in copying file from window to linux
RUN apt-get update && apt-get install -y dos2unix && dos2unix gradlew

RUN chmod +x gradlew

RUN ./gradlew  build -x test

EXPOSE 8080

CMD ["java", "-jar", "build/libs/app-0.0.1-SNAPSHOT.jar"]


