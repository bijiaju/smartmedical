FROM openjdk:8-jdk-alpine
MAINTAINER bee byq_work@163.com
# RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime \
    && echo $TIME_ZONE > /etc/timezone

VOLUME /home/bee
ADD docker_base-0.0.1-SNAPSHOT.jar app.jar
RUN touch /app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]