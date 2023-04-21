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
//=======================================================
//  MODULE Definition
//=======================================================
module SC_RegSHIFTER #(parameter RegSHIFTER_DATAWIDTH=4)(
	//////////// OUTPUTS //////////
	SC_RegSHIFTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_RegSHIFTER_REG_In,
	SC_RegSHIFTER_STATEMACHINE_In,
	SC_RegSHIFTER_CLOCK_50,
	SC_RegSHIFTER_bits
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	[RegSHIFTER_DATAWIDTH-1:0]	SC_RegSHIFTER_data_OutBUS;
input		SC_RegSHIFTER_REG_In;
input		SC_RegSHIFTER_STATEMACHINE_In;
input		SC_RegSHIFTER_CLOCK_50;
input		SC_RegSHIFTER_bits[3:0]
//input		[RegSHIFTER_DATAWIDTH-1:0]	SC_RegSHIFTER_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Register;
//reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Signal;
//wire RegXOR_Signal;
//reg SC_RegSHIFTER_resultado [3:0]
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)

begin
	if (SC_RegSHIFTER_STATEMACHINE_In) //Desplazar a la izquierda
    SC_RegSHIFTER_data_OutBUS <= {SC_RegSHIFTER_REG_In[2:0], 1'b0};
  else //Desplazar a la derecha
    SC_RegSHIFTER_data_OutBUS <= {1'b0, SC_RegSHIFTER_REG_In[2:1]};
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL

endmodule
