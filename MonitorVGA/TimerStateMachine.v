`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:49 09/05/2016 
// Design Name: 
// Module Name:    TimerStateMachine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TimerStateMachine(
	 input wire clk,
	 input wire start,
    input wire stop,
    input wire delete,
	 input wire segDemand,
	 input wire minDemand,
    output reg enableSeg  = 0,
	 output reg enableMin  = 0,
	 output reg forward    = 0,
    output reg resetTimer = 0
    );
	 
	 reg [2:0] state     = 3'b000; 
	 reg [2:0] nextState = 3'b000;
	 localparam [2:0] initialState = 3'b000;
	 localparam [2:0] settingMinState   = 3'b001;
	 localparam [2:0] settingSegState   = 3'b010;
	 localparam [2:0] countState   = 3'b011;
	 localparam [2:0] stopState    = 3'b100;
	 localparam [2:0] deleteState  = 3'b101;
		 
	always @(state, start, stop, delete, initialState,countState,stopState, deleteState,
				segDemand,minDemand)
		begin
		 nextState= 0;
			case(state)
				initialState:
					begin
						//Asigno las salidas de la maquina (estados del contador)
						enableSeg  = 0;
						enableMin  = 0;
						resetTimer = 0;
						forward    = 0;
						if(start) nextState = countState;
						else nextState = initialState;
					end
					
				
				//Aqui van los estados de establecer
					
				settingMinState: 
					begin
						//Asigno las salidas de la maquina (estados del contador)
						enableSeg  = 0;
						enableMin  = 1;
						resetTimer = 0;
						forward    = 1;
						if(~segDemand && ~start) nextState = settingMinState ;
						else if(segDemand && ~start) nextState = settingSegState;
						else if(start) nextState = countState;
					end
					
				settingSegState: 
					begin
				//Asigno las salidas de la maquina (estados del contador)
						enableSeg  = 1;
						enableMin  = 0;
						resetTimer = 0;
						forward    = 1;
						if(~minDemand && ~start) nextState = settingSegState ;
						else if(minDemand && ~start) nextState = settingMinState;
						else if(start) nextState = countState;						
					end
					
				//---------------------------------
				
				countState: 
					begin
						//Asigno las salidas de la maquina (entradas del contador)
						enableSeg  = 1;
						enableMin  = 1;
						resetTimer = 0;
						forward    = 0;
						if(stop) nextState = stopState;
						else nextState = countState;
					end
				stopState: 
					begin
						//Asigno las salidas de la maquina (entradas del contador)
						enableSeg  = 0;
						enableMin  = 0;
						resetTimer = 0;
						forward    = 0;
						if(start) nextState = countState;
						else nextState = deleteState;					
					end
				deleteState:
					begin
						//Asigno las salidas de la maquina (entradas del contador)
						enableSeg  = 0;
						enableMin  = 0;
						resetTimer = 1;
						forward    = 0;
						if(delete) begin nextState = initialState; end
						else nextState = stopState;
					end
				 default:
					begin 
						enableSeg  = 1;
						enableMin  = 1;
						resetTimer = 1;
						forward    = 1;
					end
			endcase
		end	
		
	always@(posedge clk)
		begin
			state = nextState;
		end
endmodule
