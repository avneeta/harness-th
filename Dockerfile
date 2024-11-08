# Use the official Tomcat image as a base image
FROM tomcat:9.0-jdk11-openjdk-slim

# Set the working directory
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file into the webapps directory
COPY target/Harness.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 (Tomcat default port)
EXPOSE 8080

# Start Tomcat server (this will start when the container starts)
CMD ["catalina.sh", "run"]
