#!/bin/bash
ab -n 2000 -c $1 -q http://127.0.0.1:80/
