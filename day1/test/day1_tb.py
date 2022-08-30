import random
import cocotb
from   cocotb.triggers import Timer


@cocotb.test()
async def runTest(dut):

  for _ in range(100):
    a_i  = random.getrandbits(8)
    b_i  = random.getrandbits(8)
    sel_i= random.getrandbits(1)

    dut.a_i.value   = a_i
    dut.b_i.value   = b_i
    dut.sel_i.value = sel_i

    await Timer(10, units="ns")
    if (sel_i == 0):
      assert a_i == dut.out_o.value
    else:
      assert b_i == dut.out_o.value


