# Use the official OpenJDK 11 image as the base image
FROM openjdk:11

# Set the working directory to /app
WORKDIR /app

# Copy the code into the container at /app
COPY . /app

# Build the application
RUN javac DemoApplication.java

# Specify the command to run when the container starts
CMD ["java", "DemoApplication"]

