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
	 input wire finish,
	 output reg enableCounter  = 0,
	 output reg forward    = 0,
    output reg resetTimer = 0,
	 output reg [2:0] actualState = 3'b000,
	 output reg incrementSeg = 0,
	 output reg incrementMin = 0,
	 output reg stateFinish = 0
    );
	 
	 reg [2:0] state     = 3'b000; 
	 reg [2:0] nextState = 3'b000;
	 //Estados disponibles de la maquina de estados con sus valores respectivos
	 localparam [2:0] initialState = 3'b000;
	 localparam [2:0] settingState = 3'b001;
	 localparam [2:0] countState   = 3'b010;
	 localparam [2:0] stopState    = 3'b011;
	 localparam [2:0] deleteState  = 3'b100;
	 localparam [2:0] finalState   = 3'b101;
		 
	always @(state, start, stop, delete, initialState,countState,stopState, deleteState,
				segDemand,minDemand,finish)
		begin
		 nextState = initialState;
			case(state)
				initialState:
					begin
						//Asigno las salidas de la maquina (estados del contador)
						stateFinish = 0;
						enableCounter  = 0; // el contador está detenido
						resetTimer = 1; //reseteo el contador
						forward    = 0;
						incrementSeg = 1;// reseteo el contador de seg progresivo en el posedge del increment
						incrementMin = 1;// reseteo el contador de min progresivo en el posedge del increment
						//if(start) nextState = countState; 
						//else if (segDemand)
						if (segDemand)
						begin
							nextState = settingState;
							incrementSeg=1;
						end
						else if ( minDemand) 
						begin
							nextState = settingState;
							incrementMin=1;
						end
						else nextState = initialState;
					end								
				//Aqui van los estados de establecer
					
				settingState: 
					begin
						//Asigno las salidas de la maquina (estados del contador)
						enableCounter  = 1; //se activa en contador
						resetTimer = 0;		//no se resetea
						forward    = 1;		//cuenta hacia adelante
						incrementSeg=0; //Aumentar desactivado
						incrementMin=0; //Aumentar desactivado
						if(segDemand && ~start && ~delete)
						begin
							nextState = settingState; 
							incrementSeg=1; //Si se solicita incrementar segundos entonces activa dicho aumento
						end
						else if (minDemand && ~start && ~delete)
						begin
							nextState = settingState;
							incrementMin=1; //Si se solicita incrementar minutos entonces activa dicho aumento
						end
						else if(start && ~delete) nextState = countState;
						else if(delete) nextState = deleteState;
						else nextState = settingState;
					end
					
				countState: 
					begin
						//Asigno las salidas de la maquina (entradas del contador)
						enableCounter  = 1; //se activa en contador
						resetTimer = 0; // no reseteo el contador
						forward    = 0; //cuenta hacia atras
						incrementSeg=0; //Aumentar desactivado
						incrementMin=0; //Aumentar desactivado
						if(stop) nextState = stopState;
						else if(finish) nextState = finalState;
						else nextState = countState;
					end

				stopState: 
					begin
						//Asigno las salidas de la maquina (entradas del contador)
						enableCounter  = 0; //se desactiva en contador
						resetTimer = 0; // no reseteo el contador
						forward    = 0; //cuenta hacia atras
						incrementSeg=0; //Aumentar desactivado
						incrementMin=0; //Aumentar desactivado
						if(start && ~delete) nextState = countState;
						else if(delete) nextState = deleteState;
						else nextState = stopState;					
					end
				deleteState:
					begin
						//Asigno las salidas de la maquina (entradas del contador)
						enableCounter  = 0;//se desactiva en contador
						resetTimer = 1;  // reseteo el contador
						forward    = 0;  //cuenta hacia atras
						incrementSeg=0;  //Aumentar desactivado
						incrementMin=0;  //Aumentar desactivado
						nextState = initialState;
					end
				finalState:
					begin
						enableCounter  = 0; //se desactiva en contador
						resetTimer = 0; // no reseteo el contador
						forward    = 0; // reseteo el contador 
						incrementSeg=0; //Aumentar desactivado
						incrementMin=0; //Aumentar desactivado
						stateFinish = 1;
						if(start) nextState = initialState;
						else nextState = finalState;
						
					end
				 default:
					begin 
						incrementSeg=0; //Aumentar desactivado
						incrementMin=0; //Aumentar desactivado
						enableCounter  = 0; //contador desactivado
						resetTimer = 1; // reseteo el contador 
						forward    = 1; //cuenta hacia adelante
					end
			endcase
		end	
		
	always@(posedge clk)
		begin			
			state = nextState;
			actualState = nextState;
		end
endmodule
