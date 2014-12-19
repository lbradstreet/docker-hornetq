FROM dockerfile/java:oracle-java8
RUN groupadd --gid 253 hornetq
RUN useradd --gid 253 --uid 253 --base-dir /opt --create-home hornetq
#ADD jmxagent.jar                        /opt/hornetq/hornetq-2.4.0.Final/bin/

ONBUILD USER hornetq
WORKDIR /opt/hornetq
USER hornetq
RUN wget -q -O - http://downloads.jboss.org/hornetq/hornetq-2.4.0.Final-bin.tar.gz | tar -C . -xz
#RUN tar zxvf hornetq-2.4.0.Final-bin.tar.gz
RUN ln -s hornetq-2.4.0.Final hornetq
RUN mkdir -p hornetq/logs
RUN mkdir -p hornetq/data
#ONBUILD ADD ./config                    /opt/hornetq/hornetq-2.4.0.Final/config/
#ONBUILD RUN chown -R hornetq:hornetq    /opt/hornetq/hornetq-2.4.0.Final/config/

## -- hornetq
#VOLUME ["/opt/hornetq/hornetq-2.4.0.Final/logs", "/opt/hornetq/hornetq-2.4.0.Final/data" ]

USER hornetq
ENV HOME /opt/hornetq
ENV USER hornetq
ENV HORNETQ_HOME /opt/hornetq/hornetq

EXPOSE 5445
EXPOSE 5455

WORKDIR /opt/hornetq/hornetq/bin
CMD ./run.sh
