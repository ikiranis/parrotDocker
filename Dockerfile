FROM eclipse-temurin:21-jdk-alpine
ENV TZ=Europe/Athens
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Europe/Athens /etc/localtime && \
    echo "Europe/Athens" > /etc/timezone
COPY app/app.jar /app/app.jar
WORKDIR /app
EXPOSE 8444
ENTRYPOINT ["java","-jar","/app/app.jar"]
