# Base image Tomcat
FROM tomcat:9.0-jdk17


# Xoá webapps mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR vào Tomcat webapps
COPY target/chapter12_01-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port Tomcat
EXPOSE 8080