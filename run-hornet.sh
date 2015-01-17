#!/bin/sh

# S3_LOCATION, AWS_ACCESS_KEY, AWS_SECRET_KEY and HOSTNAME must all be set by docker environment
# variables in order for jgroups / hornetq clustered mode to work

cat /opt/hornetq/onyx-jgroups-s3ping.xml | sed s/"<S3_LOCATION>"/$S3_LOCATION/ | sed s/"<S3_ACCESS_KEY>"/$AWS_ACCESS_KEY/ | sed s/"<S3_SECRET>"/$AWS_SECRET_KEY/ > ../config/stand-alone/clustered/onyx-jgroups.xml

export CLUSTER_PROPS="-Djgroups.bind_addr=global -Djava.net.preferIPv4Stack=true -Djnp.host=$HOSTNAME -Dhornetq.remoting.netty.host=$HOSTNAME"

./run.sh ../config/stand-alone/clustered/
