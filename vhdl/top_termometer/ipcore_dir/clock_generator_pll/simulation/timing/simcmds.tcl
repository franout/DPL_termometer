# file: simcmds.tcl

# create the simulation script
vcd dumpfile isim.vcd
vcd dumpvars -m /clock_generator_pll_tb -l 0
wave add /
run 50000ns
quit
