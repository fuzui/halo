FROM adoptopenjdk/openjdk8-openj9
VOLUME /tmp

ARG JAR_FILE=build/libs/halo-1.4.0.jar
ARG PORT=8090
ARG TIME_ZONE=Asia/Shanghai

ENV TZ=${TIME_ZONE}
ENV JAVA_OPTS="-Xms1024m -Xmx1024m"

COPY ${JAR_FILE} halo.jar

EXPOSE ${PORT}

ENTRYPOINT java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -server -jar halo.jar
