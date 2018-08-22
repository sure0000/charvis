#/bin/bash
hosts=$(pwd)"/hosts"
for hostname in $(cat hosts)
do
	ssh -t $hostname "killall -9 filebeat;mkdir /data0/log/;mkdir /data0/log/filebeat"
	ssh -t $hostname 'bash -s' < start.sh
	echo $hostname
done
