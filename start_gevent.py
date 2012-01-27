#!/usr/bin/python2.7
from gevent import wsgi, pool
import os

def application(env, start_response):
        start_response('200 OK', [('Content-Type', 'text/html')])
        return ["<b>Hello World</b>"]
        
wsgi.WSGIServer(('',8088), application, log=None).serve_forever()
