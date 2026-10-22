//-----------------------header guards-------------------------
`ifndef TEMP_IF_SV
`define TEMP_IF_SV

interface temp_if(input logic temp_clk, input logic temp_rst);

	//-----------------------Signals-----------------------
	logic        temp_valid;
	logic [7:0]  temp_data_in;
	logic [7:0]  temp_data_out;
	logic        temp_ready;

	//----------------DRIVER clocking block----------------
	clocking temp_drv_cb @(posedge temp_clk);
		default input #1ns output #1ns;
		output temp_valid, temp_data_in;
		input  temp_ready, temp_data_out;
	endclocking

	//----------------MONITO Clocking block----------------
	clocking temp_mon_cb @(posedge temp_clk);
		default input #1ns output #1ns;
		input temp_valid, temp_data_in, temp_ready, temp_data_out;
	endclocking

	//----------------------MODPORTS-----------------------
	modport temp_drv_mp (clocking temp_drv_cb, input temp_clk, input temp_rst);
	modport temp_mon_mp (clocking temp_mon_cb, input temp_clk, input temp_rst);

endinterface : temp_if

`endif
