#docker run -p 5455:5455 -p 5445:5445 -t hornetq:latest
#docker run -P -e "CLUSTER_OPTS=-Djgroups.bind_addr=global -Djava.net.preferIPv4Stack=true" -t hornetq:latest
#docker run -p 5446:5446 -p 5448:5448 -e "CLUSTER_PROPS=-Djgroups.bind_addr=global -Djava.net.preferIPv4Stack=true" -t hornetq:latest
#docker run -v /tmp/jgroups:/tmp/jgroups -e "CLUSTER_PROPS=-Djgroups.bind_addr=global -Djava.net.preferIPv4Stack=true" -ti hornetq:latest bash
#docker run -e "CLUSTER_PROPS=-Djgroups.bind_addr=global -Djava.net.preferIPv4Stack=true" -ti hornetq:latest bash
#docker run -P -e "CLUSTER_PROPS=-Djgroups.bind_addr=global -Djava.net.preferIPv4Stack=true" -t hornetq:latest
#docker run -e "CLUSTER_PROPS=-Djgroups.bind_addr=global -Djava.net.preferIPv4Stack=true" -t hornetq:latest
#-Dhornetq.remoting.netty.port=5445"
docker run -t hornetq:latest
