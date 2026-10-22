//--------------------------------Header Guards-------------------------------------
`ifndef TEMP_SEQUENCE_SVH
`define TEMP_SEQUENCE_SVH

//------------------------------Class Definition------------------------------------
class temp_sequence extends uvm_sequence#(temp_sequence_item);

	//-----------------------------Factory Registration--------------------------------
	`uvm_object_utils(temp_sequence)

	//-----------------------------Constructir function--------------------------------
	function new(string name = "temp_sequence");
		super.new(name);
	endfunction

	//---------------------------ALU_seuence_item handle-------------------------------
	temp_sequence_item req;

	//--------------------------------task body----------------------------------------
	virtual task body();
		req = temp_sequence_item::type_id::create("req");
		
		start_item(req);
		if (!req.randomize()) begin
			`uvm_error("TEMP_SEQUENCE", "Failed to randomize sequence item!")
		end
		finish_item(req);
	endtask

endclass : temp_sequence

`endif
