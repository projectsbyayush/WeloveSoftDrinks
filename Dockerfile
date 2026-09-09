# WeLoveSoftDrinks - deployable anywhere (Render, Railway, Fly.io, VPS)
# IMPORTANT: Tomcat 9, NOT 10 - our code uses javax.servlet (Tomcat 10 needs jakarta.*)

# ---- Stage 1: build the WAR file from source (no NetBeans needed) ----
FROM tomcat:9.0-jdk17 AS builder
WORKDIR /build

# Copy website files, Java code and MySQL driver
COPY we_love_soft_drinks/web ./web
COPY we_love_soft_drinks/src/java ./src
COPY we_love_soft_drinks/lib/mysql-connector-j-26.7.0.jar ./mysql.jar

# Compile servlets + pack everything into ROOT.war
RUN mkdir -p web/WEB-INF/classes web/WEB-INF/lib \
 && cp mysql.jar web/WEB-INF/lib/ \
 && javac -cp "/usr/local/tomcat/lib/servlet-api.jar:mysql.jar" -d web/WEB-INF/classes $(find src -name "*.java") \
 && jar -cf ROOT.war -C web .

# ---- Stage 2: run it on clean Tomcat ----
FROM tomcat:9.0-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /build/ROOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
# Render/Railway give us a $PORT number - make Tomcat listen on it
CMD ["sh", "-c", "sed -i s/8080/${PORT:-8080}/g /usr/local/tomcat/conf/server.xml && catalina.sh run"]
