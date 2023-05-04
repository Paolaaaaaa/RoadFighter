///*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINE #(parameter MUX41_SELECTWIDTH=2)(
	//////////// OUTPUTS //////////
	
	SC_STATEMACHINE_SIGNAL_OUT,
	
	SC_STATEMACHINE_SIGNAL_OUT_1,
	SC_STATEMACHINE_SIGNAL_OUT_2,
	SC_STATEMACHINE_SIGNAL_OUT_3,
	SC_STATEMACHINE_SIGNAL_OUT_4,
	SC_STATEMACHINE_SIGNAL_OUT_5,
	SC_STATEMACHINE_SIGNAL_OUT_6,
	SC_STATEMACHINE_SIGNAL_OUT_7,
	//////////// INPUTS //////////
	SC_STATEMACHINE_CONTADOR,
	SC_STATEMACHINE_RESET_INHigh,
	SC_STATEMACHINE_START_INLow
);	
//=======================================================
//  PARAMETER declarations
//=========
//=============================================


output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_1;

output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_2;
output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_3;
output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_4;
output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_5;
output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_6;
output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_7;
output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT;

input  	[MUX41_SELECTWIDTH-1:0] SC_STATEMACHINE_CONTADOR;
input 	SC_STATEMACHINE_RESET_INHigh;
input 	SC_STATEMACHINE_START_INLow;




reg	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_1_reg;

reg	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_2_reg;
reg	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_3_reg;
reg	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_4_reg;
reg	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_5_reg;
reg	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_6_reg;
reg	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_7_reg;
reg	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT_reg;

always @(*)
begin
   if( SC_STATEMACHINE_CONTADOR  == 1)// cuando el select está en 0 la pantalla está en 0s
   begin   
	
	
		
	  SC_STATEMACHINE_SIGNAL_OUT_1_reg= 0;

	  SC_STATEMACHINE_SIGNAL_OUT_2_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_3_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_4_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_5_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_6_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_7_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_reg= 0;
	end
   else if( SC_STATEMACHINE_RESET_INHigh == 1 && SC_STATEMACHINE_CONTADOR  == 1)/// cuando reset == 1 pantalla en 0 unos
   begin   	
	  SC_STATEMACHINE_SIGNAL_OUT_1_reg= 0;

	  SC_STATEMACHINE_SIGNAL_OUT_2_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_3_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_4_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_5_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_6_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_7_reg= 0;
	  SC_STATEMACHINE_SIGNAL_OUT_reg= 0;
	end	
   else // está en 2 saca el random
	begin	
	  SC_STATEMACHINE_SIGNAL_OUT_1_reg= 2;

	  SC_STATEMACHINE_SIGNAL_OUT_2_reg= 2;
	  SC_STATEMACHINE_SIGNAL_OUT_3_reg= 2;
	  SC_STATEMACHINE_SIGNAL_OUT_4_reg= 2;
	  SC_STATEMACHINE_SIGNAL_OUT_5_reg= 2;
	  SC_STATEMACHINE_SIGNAL_OUT_6_reg= 2;
	  SC_STATEMACHINE_SIGNAL_OUT_7_reg= 2;
	  SC_STATEMACHINE_SIGNAL_OUT_reg= 2;
		
	end

end

assign SC_STATEMACHINE_SIGNAL_OUT_1 = SC_STATEMACHINE_SIGNAL_OUT_1_reg;

assign  SC_STATEMACHINE_SIGNAL_OUT_2 = SC_STATEMACHINE_SIGNAL_OUT_2_reg;
assign  SC_STATEMACHINE_SIGNAL_OUT_3 = SC_STATEMACHINE_SIGNAL_OUT_3_reg;
assign SC_STATEMACHINE_SIGNAL_OUT_4 = SC_STATEMACHINE_SIGNAL_OUT_4_reg;
assign SC_STATEMACHINE_SIGNAL_OUT_5 = SC_STATEMACHINE_SIGNAL_OUT_5_reg;
assign SC_STATEMACHINE_SIGNAL_OUT_6 = SC_STATEMACHINE_SIGNAL_OUT_6_reg;
assign SC_STATEMACHINE_SIGNAL_OUT_7 =SC_STATEMACHINE_SIGNAL_OUT_7_reg;
assign SC_STATEMACHINE_SIGNAL_OUT = SC_STATEMACHINE_SIGNAL_OUT_reg;

 
 endmodule
