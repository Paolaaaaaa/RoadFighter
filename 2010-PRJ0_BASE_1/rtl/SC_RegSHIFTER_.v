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
module SC_RegSHIFTER_ #(parameter RegSHIFTER_DATAWIDTH=4)(
    //////////// OUTPUTS //////////
    SC_RegSHIFTER_data_OutBUS,
    //////////// INPUTS //////////
    SC_RegSHIFTER_REG_In,
    SC_RegSHIFTER_STATEMACHINE_In,
    SC_RegSHIFTER_RESET_InHigh,
    SC_RegSHIFTER_startButton_InLow,
    SC_RegSHIFTER_CLOCK_50
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
    output [RegSHIFTER_DATAWIDTH-1:0] SC_RegSHIFTER_data_OutBUS;
    input [RegSHIFTER_DATAWIDTH-1:0] SC_RegSHIFTER_REG_In;
    input SC_RegSHIFTER_STATEMACHINE_In;
    input SC_RegSHIFTER_CLOCK_50;
    input SC_RegSHIFTER_RESET_InHigh;
    input SC_RegSHIFTER_startButton_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
    reg [RegSHIFTER_DATAWIDTH-1:0] shift_reg; // Registro para almacenar el valor de entrada
	 

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*) 
begin
        if (SC_RegSHIFTER_STATEMACHINE_In == 0)
            shift_reg = SC_RegSHIFTER_REG_In << 1;   
        else 
            shift_reg = SC_RegSHIFTER_REG_In >> 1;   
end 




    assign SC_RegSHIFTER_data_OutBUS = shift_reg;



endmodule