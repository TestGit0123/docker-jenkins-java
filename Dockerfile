FROM eclipse-temurin:21-jre
WORKDIR /app
COPY javahello.java .
CMD ["java","javahello.java"]
