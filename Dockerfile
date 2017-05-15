FROM alpine:3.5

WORKDIR /app

LABEL maintainer "bonamy.klu@pearson.com"

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN apk --update add bash curl su-exec openjdk8 maven git make

COPY ["src", "src/"]
COPY ["aws", "aws/"]
COPY ["packer", "packer/"]
COPY ["docker-*", "Makefile", "pom.xml", "./"]

CMD ["./docker-entrypoint.sh"]