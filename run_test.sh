rm node.speed
for i in {1..400..1}
do
    bash node.sh $i  | grep \#/sec  | awk '{ print $4 }' >> node.speed
    echo $i
done

rm python.speed
for i in {1..400..1}
do
    echo $i
    bash gevent.sh $i  | grep \#/sec  | awk '{ print $4 }' >> gevent.speed
done
