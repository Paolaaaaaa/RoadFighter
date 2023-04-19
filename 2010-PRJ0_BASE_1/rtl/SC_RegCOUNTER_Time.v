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
module SC_RegGENERAL #(parameter RegGENERAL_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_RegGENERAL_data_OutBUS,
	//////////// INPUTS //////////
	SC_RegGENERAL_CLOCK_50,
	SC_RegGENERAL_RESET_InHigh,
	SC_RegGENERAL_INBUS_InHigh
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegGENERAL_DATAWIDTH-1:0]	SC_RegGENERAL_data_OutBUS;
input		SC_RegGENERAL_CLOCK_50;
input		SC_RegGENERAL_RESET_InHigh;
input		SC_RegGENERAL_INBUS_InHigh;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegGENERAL_DATAWIDTH-1:0] RegGENERAL_Register;
reg [RegGENERAL_DATAWIDTH-1:0] RegGENERAL_Signal;
reg [RegGENERAL_DATAWIDTH-1:0] RegGENERAL_Count;
reg [RegGENERAL_DATAWIDTH-1:0] RegGENERAL_Time;
reg [RegGENERAL_DATAWIDTH-1:0] RegGENERAL_CountC;
reg [RegGENERAL_DATAWIDTH-1:0] RegGENRAL_TCount;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegGENERAL_INBUS_InHigh <= 10)
		RegGENERAL_TCount = 0.35;
	else if (SC_RegGENERAL_INBUS_InHigh >= 10 && <18)
		RegGENERAL_TCount = 0;
	else if (SC_RegGENERAL_INBUS_InHigh > 18 && <=32)
		RegGENERAL_TCount = 0.28;
	else if (SC_RegGENERAL_INBUS_InHigh > 32 && <=40)
		RegGENERAL_TCount = 0;
	else if (SC_RegGENERAL_INBUS_InHigh >40 && <=60)
		RegGENERAL_TCount = 0.2;
	else
		RegGENERAL_Signal = RegGENERAL_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegGENERAL_CLOCK_50, posedge SC_RegGENERAL_RESET_InHigh)
begin
	if (SC_RegGENERAL_RESET_InHigh == 1'b1)
		RegGENERAL_Register <= 0;
	else
		RegGENERAL_Register <= RegGENERAL_Signal;
end
//STATE COUNT_1: SEQUENTIAL
always @(posedge SC_RegGENERAL_CLOCK_50, posedge RegGENERAL_CountC)
begin
	if (RegGENERAL_Count*RegGENRAL_TCount == RegGENERAL_Time)
			RegGENERAL_Register = 1'b1;
	else
		RegGENERAL_Register <= 0;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegGENERAL_data_OutBUS = RegGENERAL_Register;
assign RegGENERAL_Time = 1/SC_RegGENERAL_CLOCK_50;
assign RegGENERAL_Count = RegGENERAL_CountC+1;

endmodule
