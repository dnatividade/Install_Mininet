#!/usr/bin/python

from mininet.topo import Topo
from mininet.net import Mininet
from mininet.cli import CLI
from mininet.node import CPULimitedHost
from mininet.link import TCLink
from mininet.util import dumpNodeConnections
from mininet.log import setLogLevel

class SingleTopologyPerformance(Topo):
            def __init__(self, k=3):
                       Topo.__init__(self)
                       switch = self.addSwitch('s1')
                       linkoptions = dict(bw=10, delay='10ms', max_queue_size=1000, use_htb=True)
                       for h in range(k):
                              host = self.addHost('h%s' % (h + 1), cpu=.4/k)
                              self.addLink(host, switch, **linkoptions)

def performaceTest():
    topo = SingleTopologyPerformance(k=5)
    net = Mininet(topo=topo, host=CPULimitedHost, link=TCLink)
    net.start()
    print "Exebindo informacoes de conexao do host"
    dumpNodeConnections(net.hosts)
    print "Testando a conectividade de rede"
    net.pingAll()
    print "Teste de largura de banda entre h1 e h3"
    h1, h3 = net.get('h1','h3')
    net.iperf((h1, h3))
    net.stop()

if __name__ == '__main__':
     setLogLevel('info')
     performaceTest()

