#!/bin/sh
	docker rm -f $(docker ps -q)
	docker rm $(docker ps -a -q)
	
	docker build -t hadoop .
	docker run -itd --name=HadoopInDocker\
		-p 50070:50070 \
		-p 50075:50075 \
	        -p 50090:50090 \
		-p 8088:8088 \
	        -p 9000:9000 \
	       	-e HA_USER=hadoop \
		-e HA_PASS=hadoop \
		--hostname=master \
		hadoop

#docker exec -it HadoopInDocker bash
docker logs HadoopInDocker
