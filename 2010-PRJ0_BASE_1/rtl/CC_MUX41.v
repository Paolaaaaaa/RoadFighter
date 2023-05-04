/*######################################################################
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
///Q=======================================================
//  MODULE Definition
//=======================================================
module CC_MUX41 #(parameter MUX41_SELECTWIDTH=8)(
//////////// OUTPUTS //////////
	CC_MUX41_z_OutBus,
//////////// INPUTS //////////
	CC_MUX41_select_InBUS,
	CC_MUX41_data_InBUS

);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	[MUX41_SELECTWIDTH-1:0] CC_MUX41_z_OutBus;

input [MUX41_SELECTWIDTH-1:0] CC_MUX41_select_InBUS;
input 	[MUX41_SELECTWIDTH-1:0] CC_MUX41_data_InBUS;


//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================


reg [MUX41_SELECTWIDTH-1:0] reg_datainbus;
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
   if( CC_MUX41_select_InBUS == 1'b0000000)// cuando el select está en 0 la pantalla está en 0s
      
		 reg_datainbus = 1'b00000000;
   else if( CC_MUX41_select_InBUS == 1'b00000001)/// cuando el select está en 1 la pantalla está en 1s
	
		 reg_datainbus =1'b00000001;
	
   else if( CC_MUX41_select_InBUS == 2'b00000010)// está en 2 saca el random
	
       reg_datainbus = CC_MUX41_data_InBUS;
	

end

assign CC_MUX41_z_OutBus = reg_datainbus;


endmodule
//=======================================================A/

