//--------------------header guard-----------------------
`ifndef TEMP_VIRTUAL_SEQUENCE_SVH
`define TEMP_VIRTUAL_SEQUENCE_SVH

//------------------Class definition---------------------    
class temp_virtual_sequence extends uvm_sequence;

	//---------------------Factory Registration---------------------
	`uvm_object_utils(temp_virtual_sequence)

	//--------------------Virtual Sequencer Handle------------------
	`uvm_declare_p_sequencer(temp_virtual_sequencer)

	//---------------------Sequence Handles-------------------------
	temp_sequence seq;

	//--------------------Constructor Function----------------------
	function new(string name = "temp_virtual_sequence");
		super.new(name);
	endfunction

	//--------------------------Task Body---------------------------
	virtual task body();
		seq = temp_sequence::type_id::create("seq");
		
		// Start the concrete sequence on the sub-sequencer via p_sequencer
		seq.start(p_sequencer.seqr);
	endtask

endclass : temp_virtual_sequence

`endif
