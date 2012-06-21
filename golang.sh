#!/bin/bash
./speed_test &
sleep 0.1
ab -n 2000 -c $1 -q http://127.0.0.1:9999/ 
kill $!
