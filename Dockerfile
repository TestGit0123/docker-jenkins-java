FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY javahello.java .
RUN javac javahello.java
CMD ["java","javahello"]
