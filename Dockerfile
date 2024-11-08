FROM maven:3.8-jdk-11 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package


# Use the official Tomcat image as a base image
FROM tomcat:9.0-jdk11-openjdk
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/


# Expose port 8080 (Tomcat default port)
EXPOSE 8080

# Start Tomcat server (this will start when the container starts)
CMD ["catalina.sh", "run"]
