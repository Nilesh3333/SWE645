FROM tomcat
COPY /src/main/webapp/Assignment1_645.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]