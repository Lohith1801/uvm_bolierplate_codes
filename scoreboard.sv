//---------------------------Header Guards----------------------------
`ifndef TEMP_SCOREBOARD_SVH
`define TEMP_SCOREBOARD_SVH

//-------------------------Class Definition---------------------------
class temp_scoreboard extends uvm_scoreboard;

	//------------------------Factory Registration-----------------------------
	`uvm_component_utils(temp_scoreboard)

	//------------------------Constructor Function-----------------------------
	function new(string name = "temp_scoreboard", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	//-------------------------Analysis IMP Port-------------------------------
	uvm_analysis_imp#(temp_sequence_item, temp_scoreboard) analysis_export;

	//----------------------ALU_sequenece_item Handle--------------------------
	temp_sequence_item act_tx;
	temp_sequence_item exp_tx;

	//--------------------------Reporting Statistics---------------------------
	int match_count    = 0;
	int mismatch_count = 0;

	//-------------------------Reference model variables-----------------------
	// Add reference or predicted variables here

	//------------------------------Tx COUNTER---------------------------------
	int tx_count = 0;

	//-----------------------------Build Phase---------------------------------
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		analysis_export = new("analysis_export", this);
	endfunction

	//---------------------------AP Write function-----------------------------
	virtual function void write(temp_sequence_item t);
		$cast(act_tx, t.clone());
		
		exp_tx = temp_sequence_item::type_id::create("exp_tx");
		golden_alu_model(act_tx, exp_tx);

		// act_tx.print();
		// exp_tx.print();

		checker_function(act_tx, exp_tx);
		tx_count++;
	endfunction

	//-----------------------------CHECK PHASE----------------------------------
	virtual function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		// Additional end-of-simulation checks can be placed here
	endfunction

	//-----------------------------REPORT PHASE----------------------------------
	virtual function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("TEMP_SCOREBOARD", $sformatf("Simulation Summary - Total: %0d, Matches: %0d, Mismatches: %0d", tx_count, match_count, mismatch_count), UVM_LOW)
		if (mismatch_count > 0)
			`uvm_error("TEMP_SCOREBOARD", "Test FAILED with mismatches!")
		else
			`uvm_info("TEMP_SCOREBOARD", "Test PASSED successfully!", UVM_LOW)
	endfunction

	//------------------------------GOLDEN ALU----------------------------------
	virtual function void golden_alu_model(temp_sequence_item in_tx, output temp_sequence_item out_tx);
		
		//-------------RST assertion--------------
		// Add reset check logic here

		//---------------CE-----------------------
		// Add clock enable logic here

		//---------------INP_VALID----------------
		// Add input valid check logic here

		//---------------ERR assertions-------------
		// Add error assertion checks here

		//----------------OPERATIONS----------------
		// Implement golden model expected calculations here
		
	endfunction

	//---------------------------------CHECKER Function-----------------------------------------
	virtual function void checker_function(temp_sequence_item act, temp_sequence_item exp);
		// exp_tx.print();
		// act_tx.print();
		
		if (act.compare(exp)) begin
			match_count++;
			`uvm_info("TEMP_SCOREBOARD", "Transaction Match!", UVM_HIGH)
		end else begin
			mismatch_count++;
			`uvm_error("TEMP_SCOREBOARD", "Transaction Mismatch!")
			act.print();
			exp.print();
		end
	endfunction

endclass : temp_scoreboard

`endif
