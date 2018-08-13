FROM sonarqube

WORKDIR /root
RUN curl --insecure -o ./sonarscanner.zip -L https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip
RUN unzip sonarscanner.zip
RUN rm sonarscanner.zip
RUN mv sonar-scanner-3.0.3.778-linux sonar-scanner

ENV SONAR_RUNNER_HOME=/root/sonar-scanner
ENV PATH $PATH:/root/sonar-scanner/bin

WORKDIR $SONARQUBE_HOME
ENTRYPOINT ["./bin/run.sh"]
