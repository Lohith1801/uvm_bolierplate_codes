//--------------------header guard-----------------------
`ifndef TEMP_VIRTUAL_SEQUENCER_SVH
`define TEMP_VIRTUAL_SEQUENCER_SVH

//------------------Class definition---------------------    
class temp_virtual_sequencer extends uvm_sequencer;

	//---------------------Factory Registration---------------------
	`uvm_component_utils(temp_virtual_sequencer)

	//-------------------Sub-Sequencer Handles----------------------
	temp_sequencer seqr;

	//--------------------Constructor Function----------------------
	function new(string name = "temp_virtual_sequencer", uvm_component parent = null);
		super.new(name, parent);
	endfunction

endclass : temp_virtual_sequencer

`endif
