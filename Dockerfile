# Base image with OpenJDK 17
FROM openjdk:17-jdk-slim

# Create a non-root user
RUN useradd -ms /bin/bash appuser

# Set working directory
WORKDIR /app

# Copy application files
COPY ./target/demo-0.0.1.jar /app/app.jar

# Copy application properties file
COPY src/main/resources/application.properties /app/application.properties

# Give appropriate permissions to the non-root user
RUN chown appuser:appuser /app

# Set environment variables
ENV USERNAME_DB=${USERNAME_DB} \
    PASSWORD_DB=${PASSWORD_DB}

# Expose port 8000
EXPOSE 8000

# Switch to non-root user
USER appuser

# Define health check
HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -f http://localhost:8000/actuator/health || exit 1

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]