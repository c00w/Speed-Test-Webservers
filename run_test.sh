
set -e

python2 start_gevent.py & # 8088
go run main.go & # 9999
sudo systemctl start nginx # 80
node node_test.js & # 8124
snaptest -p 9998 & # 9998
./warptest & # 3000

sleep 1
#FILES="golang.speed node.speed gevent.speed nginx.speed snap.speed warp.speed"
FILES="warp.speed "
declare -A PORT
PORT["golang.speed"]=9999 
PORT["node.speed"]=8124
PORT["gevent.speed"]=8088
PORT["nginx.speed"]=80
PORT["snap.speed"]=9998
PORT["warp.speed"]=3000

for FILE in $FILES;
do
    rm $FILE
    echo $FILE
    for i in {1..100..1}
    do
        sleep 0.1
        echo $i
        ab -c $i -q -n 5000 http://127.0.0.1:${PORT[$FILE]}/ | grep \#/sec | awk '{ print $4 }' >> $FILE
    done
done

trap "kill 0" SIGINT SIGTERM EXIT
