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
module SC_STATEMACHINE #(parameter RegGENERAL_DATAWIDTH=2)(
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
	SC_STATEMACHINE_INBUS_TIME,
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

input 	SC_STATEMACHINE_RESET_INHigh;
input 	SC_STATEMACHINE_START_INLow;




always @(SC_STATEMACHINE_CONTADOR or CC_MUX41_select_InBUS)
begin
   if( SC_STATEMACHINE_CONTADOR  == 1)// cuando el select está en 0 la pantalla está en 0s
   begin   
	SC_STATEMACHINE_SIGNAL_OUT_1 = 0;
	SC_STATEMACHINE_SIGNAL_OUT_2 = 0;
	SC_STATEMACHINE_SIGNAL_OUT_3= 0;
	SC_STATEMACHINE_SIGNAL_OUT_4= 0;
	SC_STATEMACHINE_SIGNAL_OUT_5= 0;
	SC_STATEMACHINE_SIGNAL_OUT_6= 0;
	SC_STATEMACHINE_SIGNAL_OUT_7= 0;
	end
   else if( SC_STATEMACHINE_RESET_INHigh == 1 && SC_STATEMACHINE_CONTADOR  == 1)/// cuando reset == 1 pantalla en 0 unos
   begin   	
	SC_STATEMACHINE_SIGNAL_OUT_1 =0;
	SC_STATEMACHINE_SIGNAL_OUT_2 = 0;
	SC_STATEMACHINE_SIGNAL_OUT_3= 0;
	SC_STATEMACHINE_SIGNAL_OUT_4= 0;
	SC_STATEMACHINE_SIGNAL_OUT_5= 0;
	SC_STATEMACHINE_SIGNAL_OUT_6= 0;
	SC_STATEMACHINE_SIGNAL_OUT_7= 0;
	end
   else if( SC_STATEMACHINE_CONTADOR && SC_STATEMACHINE_CONTADOR  == 1)// está en 2 saca el random
		begin
	SC_STATEMACHINE_SIGNAL_OUT_1 = 2;
	SC_STATEMACHINE_SIGNAL_OUT_2 = 2;
	SC_STATEMACHINE_SIGNAL_OUT_3= 2;
	SC_STATEMACHINE_SIGNAL_OUT_4= 2;
	SC_STATEMACHINE_SIGNAL_OUT_5= 2;
	SC_STATEMACHINE_SIGNAL_OUT_6= 2;
	SC_STATEMACHINE_SIGNAL_OUT_7= 2;
	end


end
endmodule
