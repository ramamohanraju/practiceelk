FROM openjdk:11-jdk

# Install maven
RUN apt-get update  
RUN apt-get install -y maven

# Adding springboot-elk app to container
ADD . /usr/config-client  
WORKDIR /usr/config-client
RUN ["mvn", "package", "-Dmaven.test.skip=true"]

EXPOSE 8080 
CMD ["/usr/bin/java", "-jar", "target/springboot-elk-0.0.1-SNAPSHOT.jar"]
