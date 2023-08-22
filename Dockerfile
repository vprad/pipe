# Use an official Java runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory to /app
WORKDIR /app

# Copy the application jar file to the container
COPY target/*.jar app.jar

# Expose port 8080 for the container
EXPOSE 8080

# Run the application when the container starts
CMD ["java", "-jar", "demo.jar"]
