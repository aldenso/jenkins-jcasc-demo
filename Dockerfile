FROM jenkins/jenkins:lts-jdk11

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /usr/local/jenkins-casc.yaml

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY jenkins-casc.yaml /usr/local/jenkins-casc.yaml

USER root
RUN curl -OL https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip \
    && apt-get update && apt-get install -y ansible unzip \
    && unzip terraform_0.14.7_linux_amd64.zip -d /usr/local/bin \
    && rm -rf terraform_0.14.7_linux_amd64.zip && apt-get -y clean
USER jenkins