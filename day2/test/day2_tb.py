import random
import cocotb
from   cocotb.triggers import Timer
from   cocotb.clock import Clock
from   cocotb.triggers import FallingEdge


@cocotb.test()
async def runTest(dut):
  await cocotb.start(Clock(dut.clk, 10, units="ns").start())

  dut.reset_n.value   = 1
  dut.d_i.value       = 0

  await FallingEdge(dut.clk)
  await FallingEdge(dut.clk)
  dut.reset_n.value   = 0

  await FallingEdge(dut.clk)
  await FallingEdge(dut.clk)
  dut.reset_n.value   = 0

  for _ in range(100):
    await FallingEdge(dut.clk)
    dut.d_i.value = random.getrandbits(4)
    wait = random.randrange(20, 50)
    await Timer(wait, units="ns")
    dut.reset_n.value=random.getrandbits(1)



