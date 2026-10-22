//-------------------------header guards----------------------------
`ifndef TEMP_MONITOR_SVH
`define TEMP_MONITOR_SVH

//------------------------Class Definition--------------------------
class temp_monitor extends uvm_monitor;

	//-------------------------Factory Registration---------------------------
	`uvm_component_utils(temp_monitor)

	//-------------------------Vitual Interface-------------------------------
	virtual temp_if vif;

	//--------------------------Analysis PORT---------------------------------
	uvm_analysis_port#(temp_sequence_item) ap;

	//-----------------------Sequence Item Handle-----------------------------
	temp_sequence_item tx;

	//--------------------------Constructor Function--------------------------
	function new(string name = "temp_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	//-----------------------------Build PHASE--------------------------------
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		ap = new("ap", this);
		
		if (!uvm_config_db#(virtual temp_if)::get(this, "", "vif", vif)) begin
			`uvm_fatal("TEMP_MONITOR", "Virtual interface must be set for vif!")
		end
	endfunction

	//------------------------------Run PHASE---------------------------------
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		
		forever begin
			sample_dut(tx);
			ap.write(tx);
		end
	endtask

	//------------------------Sampling from DUT task--------------------------
	virtual task sample_dut(output temp_sequence_item item);
		item = temp_sequence_item::type_id::create("item");
		
		// Wait for clock edge / sample signals from clocking block
		@(vif.temp_mon_cb);
		
		// Example signal sampling:
		// item.temp_data_out = vif.temp_mon_cb.temp_data_out;
	endtask

endclass : temp_monitor

`endif
