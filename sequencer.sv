//--------------------header guard-----------------------
`ifndef TEMP_SEQUENCER_SVH
`define TEMP_SEQUENCER_SVH

//------------------Class definition---------------------	
class temp_sequencer extends uvm_sequencer#(temp_sequence_item);

	//---------------------Factory Registration---------------------
	`uvm_component_utils(temp_sequencer)

	//--------------------Constructor Function----------------------
	function new(string name = "temp_sequencer", uvm_component parent = null);
		super.new(name, parent);
	endfunction

endclass : temp_sequencer

`endif
