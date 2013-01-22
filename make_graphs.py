import numpy as np
import matplotlib.pyplot as plt

def int_wrap(gen):
    for i in gen:
        yield float(i)

if __name__ == "__main__":
    gevent = open('gevent.speed')
    g_data = [x for x in int_wrap(gevent.readlines())]
    node = open('node.speed')
    n_data = [x for x in int_wrap(node.readlines())]
    nginx = open('nginx.speed')
    ng_data = [x for x in int_wrap(nginx.readlines())]
    golang = open('golang.speed')
    go_data = [x for x in int_wrap(golang.readlines())]
    snap = open('snap.speed')
    snap_data = [x for x in int_wrap(snap.readlines())]
    warp = open('warp.speed')
    warp_data = [x for x in int_wrap(warp.readlines())]
        
    plt.plot(np.arange(1,len(g_data)*2+1,2), g_data, 
    np.arange(1,len(n_data)*2+1,2), n_data,
    np.arange(1,len(ng_data)*2+1,2), ng_data,
    np.arange(1,len(go_data)*2+1,2), go_data,
    np.arange(1,len(snap_data)*2+1,2), snap_data,
    np.arange(1,len(warp_data)*2+1,2), warp_data)
    
    plt.legend(('gevent', 'node', 'nginx', 'go', 'snap', 'warp'))
    
    plt.xlabel("Concurrent Connections")

    plt.ylabel("Requests Per Second")
    
    plt.title("Webserver speed with 5,000 Requests")
    
    plt.savefig('output.png')
