FROM openjdk:8-alpine

RUN apk add --no-cache  curl grep sed unzip

ENV SONAR_SCANNER_VERSION 3.0
WORKDIR /root
RUN curl --insecure -o ./sonarscanner.zip -L https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip
RUN unzip sonarscanner.zip
RUN rm sonarscanner.zip
RUN mv sonar-scanner-3.0.3.778-linux sonar-scanner
ENV SONAR_RUNNER_HOME=/root/sonar-scanner
ENV PATH $PATH:/root/sonar-scanner/bin

RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /root/sonar-scanner/bin/sonar-scanner
