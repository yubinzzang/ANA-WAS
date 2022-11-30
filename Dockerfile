FROM openjdk:18-jdk-alpine AS anaconda
ADD ANA-Shopping.tar .
WORKDIR ANA-Shopping
RUN ./mvnw clean install -DskipTests=true

FROM openjdk:18-jdk-alpine
COPY --from=anaconda /ANA-Shopping/target/SpringShoppingCart2-0.0.1-SNAPSHOT.jar /
CMD ["java", "-jar", "-Dspring.profiles.active=mysql", "/SpringShoppingCart2-0.0.1-SNAPSHOT.jar"]
