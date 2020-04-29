FROM openjdk:8-jdk-alpine

COPY target/api-gateway-1.0.jar /opt/api-gateway/

# setting proper TZ
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 8080
VOLUME /opt/api-gateway/logs

WORKDIR /opt/api-gateway/

CMD ["java","-jar","api-gateway-1.0.jar"]