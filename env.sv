//------------------------------------Header Guards--------------------------------------
`ifndef TEMP_ENV_SVH
`define TEMP_ENV_SVH

//-----------------------------------Class Definition------------------------------------
class temp_env extends uvm_env;

	//----------------------------------------Factory egistration---------------------------------------
	`uvm_component_utils(temp_env)

	//-------------------------------------Cobnstructor function----------------------------------------
	function new(string name = "temp_env", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	//---------------------------------------Child Components Handles-----------------------------------
	temp_agent      agt;
	temp_scoreboard sb;

	//-----------------------------------------Build PHASE----------------------------------------------
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		agt = temp_agent::type_id::create("agt", this);
		sb  = temp_scoreboard::type_id::create("sb", this);
	endfunction

	//-----------------------------------------Connect PHASE----------------------------
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		
		// Connect monitor analysis port to scoreboard analysis export
		agt.mon.ap.connect(sb.analysis_export);
	endfunction

endclass : temp_env

`endif
