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
module CC_MUX41 #(parameter MUX41_SELECTWIDTH=2,parameter MUX41_DATAWIDTH=4)(
//////////// OUTPUTS //////////
	CC_MUX41_z_OutBus,
//////////// INPUTS //////////
	CC_MUX41_select_InBUS,
	CC_MUX41_data_InBUS,
	CC_MUX41_CLOCK_50, // timer
	CC_MUX41_vel_InBUS //cuanto tiempo para pasar el registro
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	[MUX41_SELECTWIDTH-1:0]  CC_MUX41_z_OutBus;
input 	[MUX41_SELECTWIDTH-1:0] CC_MUX41_select_InBUS;
input 	[MUX41_DATAWIDTH-1:0] CC_MUX41_data_InBUS;
input		CC_MUX41_CLOCK_50;

input		CC_MUX41_vel_InBUS;

//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(CC_MUX41_data_InBUS or CC_MUX41_select_InBUS)
begin
   if( CC_MUX41_select_InBUS == 0)// cuando el select está en 0 la pantalla está en 0s
      CC_MUX41_z_Out =0;
   else if( CC_MUX41_select_InBUS == 1)/// cuando el select está en 1 la pantalla está en 1s
      CC_MUX41_z_Out = 15;
   else if( CC_MUX41_select_InBUS == 2)// está en 2 saca el random
      CC_MUX41_z_Out = CC_MUX41_data_InBUS;

end

endmodule
//=======================================================A/

