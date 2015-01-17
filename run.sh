docker run -t -p 5446:5446 -p 5448:5448 -e "S3_LOCATION=$1" -e "AWS_ACCESS_KEY=$2" -e "AWS_SECRET_KEY=$3" lbradstreet/hornetq:latest 
