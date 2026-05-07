#FROM eclipse-temurin:21-jdk-jammy

#WORKDIR /app

#COPY . .

#RUN chmod +x gradlew

#RUN ./gradlew  build -x test

#EXPOSE 8080

#CMD ["java", "-jar", "build/libs/app-0.0.1-SNAPSHOT.jar"]

FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

COPY build/libs/*.jar app-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app-0.0.1-SNAPSHOT.jar"]



