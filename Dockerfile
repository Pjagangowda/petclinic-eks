FROM maven:3.5-jdk-8 as BUILD

COPY src /usr/src/
COPY pom.xml /usr/src/
RUN mvn -f /usr/src/pom.xml clean package

FROM tomcat
COPY  --from=BUILD /usr/src/myapp/target/petclinic.war /usr/local/tomcat/webapps