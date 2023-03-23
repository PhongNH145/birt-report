FROM tomcat:9.0
MAINTAINER XMars (xtruongptit@gmail.com)

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

RUN apt-get update && apt-get install unzip nano -y
ENV TEMP_FOLDER=/tmp/birt
RUN mkdir -p $TEMP_FOLDER
WORKDIR $TEMP_FOLDER

RUN wget -O birt-runtime-4.5.0-20150609.zip https://archive.eclipse.org/birt/downloads/drops/R-R1-4_5_0-201506092134/birt-runtime-4.5.0-20150609.zip \
    && unzip -q birt-runtime-4.5.0-20150609.zip \
    && wget -O postgresql-42.5.4.jar https://jdbc.postgresql.org/download/postgresql-42.5.4.jar

RUN mv birt-runtime-4_5_0/WebViewerExample $CATALINA_HOME/webapps.dist/birt
RUN mv postgresql-42.5.4.jar $CATALINA_HOME/lib

COPY ./add_db_resource/* .
RUN chmod +x run.sh && ./run.sh

RUN rm -rf $TEMP_FOLDER

WORKDIR $CATALINA_HOME
RUN rm -rf webapps
RUN mv webapps.dist webapps

COPY ./tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml
COPY ./context.xml $CATALINA_HOME/webapps/manager/META-INF/context.xml

RUN mkdir -p webapps/birt/templates
ENV REPORT_TEMPLATES_DIR="$CATALINA_HOME/webapps/birt/templates"
VOLUME $REPORT_TEMPLATES_DIR
