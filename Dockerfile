# FROM image
# ADD /my/Test.java /a/b/c/Test.java
# RUN apt-get install java
# ENV JAVA_HOME=/usr/bin/java
# WORKDIR /a/b/c
# EXPOSE 8050
# ENTRYPOINT ["sleep 5"]

FROM bellsoft/liberica-openjdk-alpine:17.0.8

# INSTALL curl AND jq
RUN apk add curl jq

# WORKSPACE
WORKDIR /home/selenium-docker

# ADD REQUIRED PROJECT FILES
ADD target/docker-resources .
ADD runner.sh runner.sh

# ENVIRONMENT VARIABLES
# BROWSER
# HUB_HOST
# THREAD_COUNT
# TEST_SUIT

# START THE runner.sh
ENTRYPOINT sh runner.sh