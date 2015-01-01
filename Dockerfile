FROM dockerfile/java:oracle-java8
RUN groupadd --gid 253 hornetq
RUN useradd --gid 253 --uid 253 --base-dir /opt --create-home hornetq
#ADD jmxagent.jar                        /opt/hornetq/hornetq-2.4.0.Final/bin/

ONBUILD USER hornetq
WORKDIR /opt/hornetq
USER hornetq
RUN wget -q -O - http://downloads.jboss.org/hornetq/hornetq-2.4.0.Final-bin.tar.gz | tar -C . -xz
RUN ln -s hornetq-2.4.0.Final hornetq
RUN mkdir -p hornetq/logs
RUN mkdir -p hornetq/data
#ONBUILD ADD ./config                    /opt/hornetq/hornetq-2.4.0.Final/config/

USER root

RUN cd hornetq-2.4.0.Final/lib && curl -ksS -L -O https://sourceforge.net/projects/javagroups/files/JGroups/3.6.1.Final/jgroups-3.6.1.Final.jar
ADD onyx-jgroups-s3ping.xml /opt/hornetq/hornetq-2.4.0.Final/config/stand-alone/clustered/onyx-jgroups.xml
ADD jgroups-clustered.xml /opt/hornetq/hornetq-2.4.0.Final/config/stand-alone/clustered/hornetq-configuration.xml
RUN chown -R hornetq:hornetq    /opt/hornetq/hornetq-2.4.0.Final/config/
RUN chown -R hornetq:hornetq    /opt/hornetq/hornetq-2.4.0.Final/lib/
ADD run-hornet.sh /opt/hornetq/hornetq/bin/
RUN chmod +x /opt/hornetq/hornetq/bin/run-hornet.sh

## -- hornetq
#VOLUME ["/opt/hornetq/hornetq-2.4.0.Final/logs", "/opt/hornetq/hornetq-2.4.0.Final/data" ]

USER hornetq
ENV HOME /opt/hornetq
ENV USER hornetq
ENV HORNETQ_HOME /opt/hornetq/hornetq

EXPOSE 5446
EXPOSE 5448

WORKDIR /opt/hornetq/hornetq/bin
CMD ./run-hornet.sh
