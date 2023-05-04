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
module CC_REG #(parameter CC_REG_WIDTH=4)(
//////////// OUTPUTS //////////
	CC_REG_z_OutBus,
//////////// INPUTS //////////
	CC_REG_data_InBUS,
	CC_RegGENERAL_RESET_InHigh
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	[CC_REG_WIDTH-1:0]  CC_REG_z_OutBus;
input 	[CC_REG_WIDTH-1:0] CC_REG_data_InBUS;
input		CC_RegGENERAL_RESET_InHigh;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

reg 	[CC_REG_WIDTH-1:0] reg_you;
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
	if (CC_RegGENERAL_RESET_InHigh == 1)
		 reg_you = 0;
	else 
		reg_you = CC_REG_data_InBUS;

end
assign CC_REG_z_OutBus = reg_you;


endmodule
//=======================================================A/

