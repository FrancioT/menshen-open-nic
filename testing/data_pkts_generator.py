from binascii import hexlify
from scapy.all import *
from ctypes import *

def gen_data_pkt(data, vid):
    used_data = data
    # padding:
    if len(data)%2 != 0:
    	used_data = "0"+data
    pkt = Ether(src='00:01:02:03:04:05', dst='00:00:00:00:00:09')/Dot1Q(vlan=vid) \
                /IP(src='111.111.111.111', dst='222.222.222.222')/UDP(sport=1234, dport=4321) \
                /Raw(load=bytes.fromhex(used_data))
    return pkt



# GENERATED TEST PACKETS
print()
test_pkt = gen_data_pkt("0026000000030000000200000000"+4*"00", 15)
res_pkt  = gen_data_pkt("0026000000030000000200000001"+4*"00", 15)
#test_pkt.show()
print("Input: ")
print(bytearray(hexlify(bytes(test_pkt))))
print("Output: ")
print(bytearray(hexlify(bytes(res_pkt))))
