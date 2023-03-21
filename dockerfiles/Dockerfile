FROM psimonov/birt-viewer

WORKDIR $CATALINA_HOME
RUN mkdir -p webapps/birt/templates
ENV REPORT_TEMPLATES_DIR="$CATALINA_HOME/webapps/birt/templates"
VOLUME $REPORT_TEMPLATES_DIR
