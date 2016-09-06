`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:37:42 09/03/2016 
// Design Name: 
// Module Name:    StateMachine 
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
module StateMachine(
    input clk,
    input wire start,
    input wire progressive,
	 input wire finish,
    input wire regressive,
	 output reg forward,
	 output reg enable
    );
	 
	// Instantiate the Unit Under Test (UUT)
	 
	reg [1:0] state = 0; 
	reg [1:0] nextState = 0;
	reg finishAux = 0;
	reg killStateMachine = 0;

	always @(state,finish,start,finishAux,killStateMachine,progressive,regressive)
		begin
			case(state)
					0:                  // Estado inicial
						begin
						  killStateMachine = 0;      // Pone 0 en la bandera de la maquina de estados
						  enable = 0;				     // Pone 0 en el enable
						  forward = 0;				     // Pone 0 en el forward
						  if (start) nextState = 1;  //Si el usuario decidio inicial pasa al estado 1
						  else nextState = 0;	     //Si no entonces se queda en el estado 0
						end
					1:                  // Estado de la cuenta progresiva
						begin
						  enable = 1;                //Enable en 1 para que empiece el contador
						  forward = 1;					  //Forward en 1 para indicar que el contador sea progresivo
						  if (finish && ~finishAux)  //Si ya termino el contador entonces cambia de estado
								begin 
									if(~killStateMachine) nextState = 2; //Si no se le ha indicado terminar continua al estado dos
									else nextState = 0;						 //Si no entonces pasa al cero 
								end
						  else nextState = 1;		  //Si no ha terminado el contador se queda en el estado actual
						end
					2:  // Estado de la cuenta regresiva 
						begin
						  enable = 1;
						  forward = 0;              //Forward en 1 para indicar que el contador sea regresivo
						  if (finish && ~finishAux) 
								begin
									if(~killStateMachine) nextState = 3; 
									else nextState = 0;								
								end
						  else nextState = 2;
						end					
					3:  // Estado en el cual el usuario escoje si hacer otra cuenta progresiva o regresiva
						begin
						killStateMachine = 1; //Esta bandera indica que la maquina de estados debe regresar al estado inicial
						  if (progressive || regressive) //Revisa si el usuario quiere una cuenta regresiva o progresiva
								begin									
									if(progressive) nextState = 1; //Si es progresiva lo envia al estado 1
									else nextState = 2;				 //Si es regresiva lo envia al estado 2
								end
						  else nextState = 3;     //Si el usuario no ha escogido se queda en ese estado hasta que elija
						end
					default: nextState = 0;     //Estado default 
			endcase
		end
		
		always @(posedge clk)              
		begin
		   finishAux = 0; //
			state = nextState;
			if(finish) finishAux = 1; //Si la bandera finish del contador esta encendida al cambiar de estado entonces
		end								  //como el clock del contador es mas lento se usa otra bandera "finishAux"											 

endmodule
