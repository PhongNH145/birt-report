FROM tomcat:9.0

RUN apt-get update  \
    && apt-get install unzip nano -y  --no-install-recommends \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && apt-get install ttf-mscorefonts-installer -y --no-install-recommends \
    && mv /usr/share/fonts/truetype/msttcorefonts/* /usr/share/fonts/truetype/

ENV TEMP_FOLDER=/tmp/birt
RUN mkdir -p $TEMP_FOLDER
WORKDIR $TEMP_FOLDER

RUN wget -O birt-runtime-4.13.0-20230302.zip https://ftp.jaist.ac.jp/pub/eclipse/birt/downloads/drops/R-R1-4.13.0-202303022006/birt-runtime-4.13.0-20230302.zip \
    && unzip -q birt-runtime-4.13.0-20230302.zip \
    && wget -O postgresql-42.5.4.jar https://jdbc.postgresql.org/download/postgresql-42.5.4.jar


RUN mv WebViewerExample $CATALINA_HOME/webapps.dist/birt
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

WORKDIR $CATALINA_HOME
COPY ./entrypoint.sh .
COPY ./.java_opts_env .
RUN chmod +x entrypoint.sh
ENV ADDITION_JAVA_OPTS_ENV="$CATALINA_HOME/.java_opts_env"

ENTRYPOINT ./entrypoint.sh "$ADDITION_JAVA_OPTS_ENV" catalina.sh run