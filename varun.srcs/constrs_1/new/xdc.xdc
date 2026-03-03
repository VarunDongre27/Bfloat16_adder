## Final Basys3 XDC Constraints for bfloat16_top

# Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# Reset button
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# Load A button
set_property PACKAGE_PIN T18 [get_ports loadA]
set_property IOSTANDARD LVCMOS33 [get_ports loadA]

# Load B button
set_property PACKAGE_PIN W19 [get_ports loadB]
set_property IOSTANDARD LVCMOS33 [get_ports loadB]

# Add button
set_property PACKAGE_PIN T17 [get_ports add]
set_property IOSTANDARD LVCMOS33 [get_ports add]

# Sub button
set_property PACKAGE_PIN U17 [get_ports sub]
set_property IOSTANDARD LVCMOS33 [get_ports sub]

# Switches (switches[15:0])
set_property PACKAGE_PIN V17 [get_ports {switches[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[0]}]
set_property PACKAGE_PIN V16 [get_ports {switches[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[1]}]
set_property PACKAGE_PIN W16 [get_ports {switches[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[2]}]
set_property PACKAGE_PIN W17 [get_ports {switches[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[3]}]
set_property PACKAGE_PIN W15 [get_ports {switches[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[4]}]
set_property PACKAGE_PIN V15 [get_ports {switches[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[5]}]
set_property PACKAGE_PIN W14 [get_ports {switches[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[6]}]
set_property PACKAGE_PIN W13 [get_ports {switches[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[7]}]
set_property PACKAGE_PIN V2 [get_ports {switches[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[8]}]
set_property PACKAGE_PIN T3 [get_ports {switches[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[9]}]
set_property PACKAGE_PIN T2 [get_ports {switches[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[10]}]
set_property PACKAGE_PIN R3 [get_ports {switches[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[11]}]
set_property PACKAGE_PIN W2 [get_ports {switches[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[12]}]
set_property PACKAGE_PIN U1 [get_ports {switches[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[13]}]
set_property PACKAGE_PIN T1 [get_ports {switches[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[14]}]
set_property PACKAGE_PIN R2 [get_ports {switches[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[15]}]
  
 
# LEDs (leds[15:0])
set_property PACKAGE_PIN U16 [get_ports leds[0]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[0]]

set_property PACKAGE_PIN E19 [get_ports leds[1]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[1]]

set_property PACKAGE_PIN U19 [get_ports leds[2]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[2]]

set_property PACKAGE_PIN V19 [get_ports leds[3]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[3]]

set_property PACKAGE_PIN W18 [get_ports leds[4]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[4]]

set_property PACKAGE_PIN U15 [get_ports leds[5]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[5]]

set_property PACKAGE_PIN U14 [get_ports leds[6]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[6]]

set_property PACKAGE_PIN V14 [get_ports leds[7]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[7]]

set_property PACKAGE_PIN V13 [get_ports leds[8]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[8]]

set_property PACKAGE_PIN V3 [get_ports leds[9]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[9]]

set_property PACKAGE_PIN W3 [get_ports leds[10]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[10]]

set_property PACKAGE_PIN U3 [get_ports leds[11]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[11]]

set_property PACKAGE_PIN P3 [get_ports leds[12]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[12]]

set_property PACKAGE_PIN N3 [get_ports leds[13]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[13]]

set_property PACKAGE_PIN P1 [get_ports leds[14]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[14]]

set_property PACKAGE_PIN L1 [get_ports leds[15]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[15]]