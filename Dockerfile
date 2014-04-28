FROM goodguide/base-oracle-java-7

ADD http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.4.4.tar.gz /opt/confluence.tar.gz

RUN mkdir /opt/confluence \
 && cd /opt/confluence \
 && tar -xzf ../confluence.tar.gz --strip-components=1

RUN mkdir -p /opt/confluence/confluence/WEB-INF/classes/ \
 && echo "confluence.home=/data" > /opt/confluence/confluence/WEB-INF/classes/confluence-init.properties

WORKDIR /opt/confluence
VOLUME /data

EXPOSE 8090

CMD ["bin/start-confluence.sh", "-fg"]