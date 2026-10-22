//---------------------------header guards---------------------------
`ifndef TEMP_SEQUENCE_ITEM_SVH
`define TEMP_SEQUENCE_ITEM_SVH

//-----------------------sequence_item CLASS-----------------------	
class temp_sequence_item extends uvm_sequence_item;

	//------------------------Declarations-----------------------
	`uvm_object_utils(temp_sequence_item)

	//---------------------------Signals-------------------------
	rand logic [7:0]  temp_a;
	rand logic [7:0]  temp_b;
	rand logic [3:0]  temp_opcode;
	      logic [15:0] temp_result;
	      logic        temp_error;

	//---------------------Field Automation----------------------
	`uvm_object_utils_begin(temp_sequence_item)
		`uvm_field_int(temp_a,      UVM_ALL_ON)
		`uvm_field_int(temp_b,      UVM_ALL_ON)
		`uvm_field_int(temp_opcode, UVM_ALL_ON)
		`uvm_field_int(temp_result, UVM_ALL_ON)
		`uvm_field_int(temp_error,  UVM_ALL_ON)
	`uvm_object_utils_end

	//-------------------Constructor Function---------------------
	function new(string name = "temp_sequence_item");
		super.new(name);
	endfunction

	//----------------------Constraints---------------------------
	constraint temp_opcode_c {
		temp_opcode inside {4'h0, 4'h1, 4'h2, 4'h3};
	}

	//------------------------POST RANDOMIZE function---------------------
	virtual function void post_randomize();
		super.post_randomize();
		// Add any post-randomization logic here
	endfunction

endclass : temp_sequence_item

`endif
