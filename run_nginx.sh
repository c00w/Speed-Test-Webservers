rm nginx.speed
for i in {1..400..1}
do
    echo $i
    bash nginx.sh $i  | grep \#/sec  | awk '{ print $4 }' >> nginx.speed
done
