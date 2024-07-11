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

def big_endian(hex_value):
     return_val = bytearray(0)
     i=0
     while i+2 < len(hex_value):
        return_val[0:0] = hex_value[i:i+2]
        i += 2
     return_val[0:0] = hex_value[i:]
     if len(hex_value) != len(return_val):
     	raise Exception("Error during change in endianness!")
     return return_val

# GENERATED TEST PACKETS
print()
test_pkt = gen_data_pkt("001a000000030000000200000000"+4*"00", 0x2)
res_pkt  = gen_data_pkt("001a000000030000000200000001"+4*"00", 0x1)
test_pkt.show()
print("Input: ")
print(big_endian(bytearray(hexlify(bytes(test_pkt)))))
print("Output: ")
print(big_endian(bytearray(hexlify(bytes(res_pkt)))))

# FOR MULTISTAGE TEST: operation +, res = 28, op_a = 10, op_b = 5
# test_pkt = gen_data_pkt("000d0000000a0000000500000028"+4*"00", 0x1)
