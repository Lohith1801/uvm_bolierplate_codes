//------------------header guards-------------------
`ifndef TEMP_DRIVER_SVH
`define TEMP_DRIVER_SVH

//----------------class definition------------------    
class temp_driver extends uvm_driver#(temp_sequence_item);

	//-------------------factory registration------------------
	`uvm_component_utils(temp_driver)

	//-----------------Constructor Function--------------------
	function new(string name = "temp_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	//----------------ALU_sequence_item Handle-----------------
	temp_sequence_item tx;

	//------------------Virtual Interface----------------------
	virtual temp_if vif;

	//---------------------Build PHASE-------------------------
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		if (!uvm_config_db#(virtual temp_if)::get(this, "", "vif", vif)) begin
			`uvm_fatal("TEMP_DRIVER", "Virtual interface must be set for vif!")
		end
	endfunction

endclass : temp_driver

`endif
