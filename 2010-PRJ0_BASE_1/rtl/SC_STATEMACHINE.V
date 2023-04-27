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
module SC_STATEMACHINE (
	//////////// OUTPUTS //////////
	
	SC_STATEMACHINE_SIGNAL_OUT,
	//////////// INPUTS //////////
	SC_STATEMACHINE_INBUS_TIME,
	SC_STATEMACHINE_RESET_INHigh,
	SC_STATEMACHINE_START_INLow
);	
//=======================================================
//  PARAMETER declarations
//=========
=============================================
output	[MUX41_SELECTWIDTH-1:0]  SC_STATEMACHINE_SIGNAL_OUT;
input 	[MUX41_SELECTWIDTH-1:0] SC_STATEMACHINE_INBUS_TIME;
input 	SC_STATEMACHINE_RESET_INHigh;
input 	SC_STATEMACHINE_START_INLow;




always @(SC_STATEMACHINE_CONTADOR or CC_MUX41_select_InBUS)
begin
   if( SC_STATEMACHINE_CONTADOR  < 4)// cuando el select está en 0 la pantalla está en 0s
      SC_STATEMACHINE_SIGNAL_OUT = 1;
   else if( SC_STATEMACHINE_RESET_INHigh == 1)/// cuando reset == 1 pantalla en 0 unos
      SC_STATEMACHINE_SIGNAL_OUT = 1;
   else if( SC_STATEMACHINE_CONTADOR > 4)// está en 2 saca el random
      SC_STATEMACHINE_SIGNAL_OUT = 2;
	else if (SC_STATEMACHINE_START_INLow == 1)// cuando empieza
	      SC_STATEMACHINE_SIGNAL_OUT = 2;


end
endmodule
