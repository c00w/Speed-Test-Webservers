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
    plt.plot(np.arange(len(g_data)), g_data, np.arange(len(n_data)), n_data)
    
    plt.legend(('gevent', 'node'))
    
    plt.xlabel("Concurrent Users")

    plt.ylabel("Requests Per Second")
    
    plt.title("Node and Gevent speed with 2,000 Requests")
    
    plt.savefig('output.png')
