FROM eclipse-temurin:25.0.5_8-jre-noble
WORKDIR /app
COPY javahello.java .
CMD ["java","javahello.java"]
