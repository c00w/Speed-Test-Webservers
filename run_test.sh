
set -e

python2 start_gevent.py & # 8088
go run main.go & # 9999
sudo systemctl start nginx # 80
node node_test.js & # 8124
snaptest -p 9998 & # 9998
./warptest & # 3000

sleep 5
FILES="golang.speed node.speed gevent.speed nginx.speed snap.speed warp.speed"
declare -A PORT
PORT["golang.speed"]=9999 
PORT["node.speed"]=8124
PORT["gevent.speed"]=8088
PORT["nginx.speed"]=80
PORT["snap.speed"]=9998
PORT["warp.speed"]=3000

for FILE in $FILES;
do
    sleep 5
    rm $FILE
    echo $FILE
    for i in {1..255..2}
    do
        sleep 0.1
        echo $i
        ab -c $i -q -n 5000 http://127.0.0.1:${PORT[$FILE]}/ | grep \#/sec | awk '{ print $4 }' >> $FILE
    done
done

cleanexit() {
    kill $(ps aux | grep "python2 start_gevent.py" | awk '{print $2}')
    kill $(ps aux | grep "go run main.go" | awk '{print $2}')
    sudo systemctl stop nginx # 80
    kill $(ps aux | grep "node node_test.js" | awk '{print $2}')
    kill $(ps aux | grep "snaptest -p 9998" | awk '{print $2}')
    kill $(ps aux | grep "./warptest" | awk '{print $2}')
}

trap cleanexit EXIT SIGTERM SIGKILL SIGQUIT
