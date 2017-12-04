# nginx-docker
it's a automatic generation for a part of the configuration file of nginx using some environment variable in docker-compose file
(it's with the case of UDP protocol)
the environment variable for the build are 
- BALANCE: it describe the method that the nginx balance between the servers
- HOSTNAME: is the server hostname
- PORT: the UDP port used by the service
- ALL_SERVERS: the name server to insert there IPs
