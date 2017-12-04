#!/bin/sh

function servers_def(){

	IFS=","
	N=0
	for broker in $ALL_SERVERS; do
        	for output in $(nslookup $broker $HOSTNAME| grep Address | cut -d ' ' -f 3 |sed -e '1,1d')
        	do
        	        N=$((N+1))
        	        echo "    server $output:PORT;"
        	done
	done

}

function server_def(){

	for output in $(nslookup $ALL_SERVERS $HOSTNAME| grep Address | cut -d ' ' -f 3 |sed -e '1,1d')
	do
		N=$((N+1))
		echo "    server $output:PORT;"
	done
}

cp /etc/nginx/nginx-part1.conf.tmpl /etc/nginx/nginx.conf

if [[ $ALL_SERVERS == *","* ]]; 
then
	servers_def >> /etc/nginx/nginx.conf
else
	server_def >> /etc/nginx/nginx.conf
fi

cat /etc/nginx/nginx-part2.conf.tmpl >> /etc/nginx/nginx.conf


sed --in-place "s~BALANCE~$BALANCE~" /etc/nginx/nginx.conf
sed --in-place "s~PORT~$PORT~" /etc/nginx/nginx.conf

exec nginx -g "daemon off;"
