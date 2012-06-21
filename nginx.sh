#!/bin/bash
ab -n 2000 -c $1 -q http://localhost:80/
