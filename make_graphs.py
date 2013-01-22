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
        
    plt.plot(np.arange(len(g_data)), g_data, np.arange(len(n_data)), n_data,
    np.arange(len(ng_data)), ng_data,
    np.arange(len(go_data)), go_data,
    np.arange(len(snap_data)), snap_data,
    np.arange(len(warp_data)), warp_data)
    
    plt.legend(('gevent', 'node', 'nginx', 'go', 'snap', 'warp'))
    
    plt.xlabel("Concurrent Users")

    plt.ylabel("Requests Per Second")
    
    plt.title("Node and Gevent speed with 2,000 Requests")
    
    plt.savefig('output.png')
