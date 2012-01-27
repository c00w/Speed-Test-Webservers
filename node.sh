#!/bin/bash

node node_test.js &
sleep 1
ab -n 2000 -c $1 -q http://127.0.0.1:8124/ 
kill $!
