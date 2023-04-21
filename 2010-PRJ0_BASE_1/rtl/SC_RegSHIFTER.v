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
	SC_RegSHIFTER_contador,
	SC_RegSHIFTER_RESET_InHigh
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegSHIFTER_DATAWIDTH-1:0]	SC_RegSHIFTER_data_OutBUS;
input		SC_RegSHIFTER_contador;
input		SC_RegSHIFTER_RESET_InHigh;
//input		[RegSHIFTER_DATAWIDTH-1:0]	SC_RegSHIFTER_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Register;
reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Signal;
wire RegXOR_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin	  
		//RegSHIFTER_Signal = {RegSHIFTER_Register[DATAWIDTH_BUS-2:0],0}
		RegSHIFTER_Signal = {RegSHIFTER_Register[2:0],RegXOR_Signal}; //2;0 limita la salida a 3 bits
	end
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegSHIFTER_contador, posedge SC_RegSHIFTER_RESET_InHigh)
begin
	if (SC_RegSHIFTER_RESET_InHigh == 1'b1)
		RegSHIFTER_Register <= 4'b1001; //4 bits
	else
		RegSHIFTER_Register <= RegSHIFTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign RegXOR_Signal = RegSHIFTER_Register[0]^RegSHIFTER_Register[1]^RegSHIFTER_Register[2]^RegSHIFTER_Register[3];
assign SC_RegSHIFTER_data_OutBUS = RegSHIFTER_Register;
endmodule
