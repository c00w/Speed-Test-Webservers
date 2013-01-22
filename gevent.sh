#!/bin/bash
python2 start_gevent.py &
sleep 0.1
ab -n 2000 -c $1 -q http://127.0.0.1:8088/ 
kill $!
