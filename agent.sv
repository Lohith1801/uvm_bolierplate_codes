//-----------------------header guards-------------------------
`ifndef TEMP_AGENT_SVH
`define TEMP_AGENT_SVH

//-----------------------Class definition----------------------
class temp_agent extends uvm_agent;

	//-----------------------Factory Registration---------------------------
	`uvm_component_utils(temp_agent)

	//---------------------Child Component Handles--------------------------
	temp_driver    drv;
	temp_sequencer seqr;
	temp_monitor   mon;

	//----------------------Constructor function----------------------------
	function new(string name = "temp_agent", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	//-----------------------------Build PHASE------------------------------
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		drv  = temp_driver::type_id::create("drv", this);
		seqr = temp_sequencer::type_id::create("seqr", this);
		mon  = temp_monitor::type_id::create("mon", this);
	endfunction

	//---------------------------Connect PHASE------------------------------
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		
		drv.seq_item_port.connect(seqr.seq_item_export);
	endfunction

endclass : temp_agent

`endif
