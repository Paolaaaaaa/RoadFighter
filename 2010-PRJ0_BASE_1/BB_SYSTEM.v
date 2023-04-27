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
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

	BB_SYSTEM_startButton_Out, 
	BB_SYSTEM_leftButton_Out,
	BB_SYSTEM_rightButton_Out,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow,
	BB_SYSTEM_RESET_InHigh2,
	BB_SYSTEM_leftButton_InLow_2,
	BB_SySTEM_rightButton_inLow_2
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 8; //4?
 parameter PRESCALER_DATAWIDTH = 23;
 parameter DISPLAY_DATAWIDTH = 12;

 parameter DATA_FIXED_INITREGPOINT_7 = 8'b00010000;
 parameter DATA_FIXED_INITREGPOINT_6 = 8'b00111000;
 parameter DATA_FIXED_INITREGPOINT_5 = 8'b01111100;
 parameter DATA_FIXED_INITREGPOINT_4 = 8'b01111100;
 parameter DATA_FIXED_INITREGPOINT_3 = 8'b00111000;
 parameter DATA_FIXED_INITREGPOINT_2 = 8'b00010000;
 parameter DATA_FIXED_INITREGPOINT_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_0 = 8'b00010000;
 
 //=======================================================
//  PORT declarations
//=======================================================
output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

output 		BB_SYSTEM_startButton_Out;
output 		BB_SYSTEM_leftButton_Out;
output 		BB_SYSTEM_rightButton_Out;


input			BB_SYSTEM_CLOCK_50;
input			BB_SYSTEM_RESET_InHigh;
input			BB_SYSTEM_startButton_InLow; 
input			BB_SYSTEM_leftButton_InLow;
input			BB_SYSTEM_rightButton_InLow;
input			BB_SYSTEM_RESET_InHigh2;
input			BB_SYSTEM_leftButton_InLow_2;
input			BB_SySTEM_rightButton_inLow_2;
//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_2_cwire;
wire 	BB_SYSTEM_rightButton_InLow_2_cwire;
// GAME
wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;

wire 	[7:0] data_max;
wire 	[2:0] add;


// COMPONENTS

	//### P1 ###
		//counters
			//TIME
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_load_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_LV_cwire;
			//Lv
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_COUNTER_LV_cwire;
		//MUX
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_1_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_2_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_3_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_4_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_5_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_6_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_7_cwire;
		//REG
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_1_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_2_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_3_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_4_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_5_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_6_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_7_cwire;
		//RANDOM
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANDOM_cwire;
		// State Machine (General)
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_SM_cwire;
		// State Machine (Palyer)
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_SMP_cwire;
		// RegShifeter
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RegSHIFTER_cwire;

	//### P2 ###
		//counters
			//TIME
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_load_2_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_LV_2_cwire;
			//Lv
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_COUNTER_LV_2_cwire;
		//MUX
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_8_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_9_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_10_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_11_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_12_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_13_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_14_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_MUX_15_cwire;
		//REG
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_8_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_9_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_10_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_11_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_12_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_13_cwire;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_REG_14_cwire;
		//RANDOM
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANDOM_2_cwire;
		// State Machine (General)
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_SM_2_cwire;
		// State Machine (Palyer)
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_SMP_2_cwire;
		// RegShifeter
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RegSHIFTER_2_cwire;
//=======================================================
//  Structural coding
//=======================================================

//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);

//######################################################################
//#	!!! ACA VAN TUS COMPONENTES
//######################################################################

								//############################
								//##########PLAYER 1##########
								//############################
								
/*		//STATE MACHINES
SC_SM_u0 (
//máquina de estados de registros
.SC_SM_OutBUS(BB_SYSTEM_SM_cwire),
.SC_SM_COUNTER_LV(BB_SYSTEM_LV_cwire),
.SC_SM_COUNTER_TIME(BB_SYSTEM_load_cwire),
.SC_SM_RESET_InHigh(BB_SYSTEM_RESET_InHigh_cwire)
);
SC_SMP_u0 (
//máquina de estados del jugador
.SC_SMP_OutBUS(BB_SYSTEM_SMP_cwire),
.SC_SMP_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_SMP_BB_SYSTEM_REG_6_cwire()/////////////////////
);*/
		//COUNTERS##############
SC_RegCOUNTER_Time_u0 (
//contador de tiempo que define, en función del nivel, las señales de carga
	.SC_RegCOUNTER_data_OutBUS(BB_SYSTEM_load_cwire),
	.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK50),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_InBUS_InHigh(BB_SYSTEM_LV_cwire)
	
);

SC_RegCOUNTER_LV_u0 (
//contador de niveles pasados hasta el momento
	.SC_RegGENERAL_data_OutBUS(BB_SYSTEM_LV_cwire),
	.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLCOK_50),
	.SC_RegGENERAL_RESET_InHIgh(BB_SYSTEM_RESET_InHIgh),
	.SC_RegGENERAL_load_InLow(BB_SYSTEM_COUNTER_LV_cwire)
	);

		//MUX##############
SC_MUX_u0 (
//multiplexor 1
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_RANDOM_cwire)
);
SC_MUX_u1 (
//multiplexor 2
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_1_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYTEM_REG_cwire)
);
SC_MUX_u2 (
//multiplexor 3
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_2_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_1_cwire)
);
SC_MUX_u3 (
//multiplexor 4
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_3_cwire),
.CC_MUX41_select_Inbus(BB_SYTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_2_cwire)
);
SC_MUX_u4 (
//multiplexor 5
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_4_cwire),
.CC_MUX41_select_Inbus(BB_SYTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_3_cwire)
);
SC_MUX_u5 (
//multiplexor 6
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_5_cwire),
.CC_MUX41_select_Inbus(BB_SYTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_4_cwire)
);
SC_MUX_u6 (
//multiplexor 7
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_6_cwire),
.CC_MUX41_select_Inbus(BB_SYTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_5_cwire)
);
SC_MUX_u7 (
//multiplexor 8
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_7_cwire),
.CC_MUX41_select_Inbus(BB_SYTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_6_cwire)
);
		//REGISTERS##############
SC_Reg_u0 (
//Registro 1
.CC_REG_z_OutBus(BB_SYSTEM_REG_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_cwire)
);
SC_Reg_u1 (
//Registro 2
.CC_REG_z_OutBus(BB_SYSTEM_REG_1_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_1_cwire)
);
SC_Reg_u2 (
//Registro 3
.CC_REG_z_OutBus(BB_SYSTEM_REG_2_cwire),
.CC_REG_data_InBUS(BB_SYTEM_MUX_2_cwire)
);
SC_Reg_u3 (
//Registro 4
.CC_REG_z_OutBus(BB_SYSTEM_REG_3_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_3_cwire)
);
SC_Reg_u4 (
//Registro 5
.CC_REG_z_OutBus(BB_SYSTEM_REG_4_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_4_cwire)
);
SC_Reg_u5 (
//Registro 6
.CC_REG_z_OutBus(BB_SYSTEM_REG_5_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_5_cwire)
);
SC_Reg_u6 (
//Registro 7
.CC_REG_z_OutBus(BB_SYSTEM_REG_6_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_7_cwire)
);
SC_Reg_u7 (
//Registro 8
.CC_REG_z_OutBus(BB_SYSTEM_REG_7_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_RegSHIFTER_cwire)
);
		//SHIFTER##############
SC_RegSHIFTER_u0 (
//Registro de desplazamiento
.SC_RegSHIFTER_OutBUS(BB_SYSTEM_RegSHIFTER),
.SC_RegSHIFTER_dataInBUS_InHigh(BB_SYSTEM_REG_7_cwire),
.sC_RegSHIFTER_data_load(BB_SYSTEM_SMP_cwire)
);
		//RANDOM##############
SC_RegRANDOM_u0 (
//Generador de números aleatorios
.SC_RegSHIFTER_data_OutBUS(BB_SYSTEM_RANDOM_cwire),
.SC_RegSHIFTER_contador(BB_SYSTEM_CLOCK_50), // conectado a la señal de reloj. También se puede conectar al contador, sin embargo, se espera que genere datos sin detenerse (?).
.SC_RegSHIFTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh)
);
		//COMPARATOR##############
CC_COMPARATOR_u0(
//Comparador para la prueba de choque
.CC_COMPARATOR_data_OutBUS(BB_SYSTEM_COMPARATOR_cwire),
.SC_COPARATOR_data_InBUS_InHigh(BB_SYSTEM_REG_6_cwire),
.SC_COMPARATOR_data_InBUS_InHigh_2(BB_SYSTEM_RegSHIFTER_cwire)
);


								//############################
								//##########PLAYER 2##########
								//############################
									
		//STATE MACHINES
		
/*
SC_SM_u1 (
//máquina de estados de registros
.SC_SM_OutBUS(BB_SYSTEM_SM_2_cwire),
.SC_SM_COUNTER_LV(BB_SYSTEM_LV_2_cwire),
.SC_SM_COUNTER_TIME(BB_SYSTEM_load_2_cwire),
.SC_SM_RESET_InHigh(BB_SYSTEM_RESET_InHigh)
);
SC_SMP_u1 (
//máquina de estados del jugador
.SC_SMP_OutBUS(BB_SYSTEM_SMP_2_cwire),
.SC_SMP_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_SMP_BB_SYSTEM_REG_13_cwire/////////////////////
);*/
		//COUNTERS##############
SC_RegCOUNTER_Time_u1 (
//contador de tiempo que define, en función del nivel, las señales de carga
	.SC_RegCOUNTER_data_OutBUS(BB_SYSTEM_load_2_cwire),
	.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK50),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_InBUS_InHigh(BB_SYSTEM_LV_2_cwire)
	
);

SC_RegCOUNTER_LV_u1 (
//contador de niveles pasados hasta el momento
	.SC_RegGENERAL_LV_data_OutBUS(BB_SYSTEM_LV_2_cwire),
	.SC_RegGENERAL_LV_CLOCK_50(BB_SYSTEM_CLCOK_50),
	.SC_RegGENERAL_LV_RESET_InHigh(BB_SYSTEM_RESET_InHIgh_cwire),
	.SC_RegGENERAL_LV_InBUS_InHigh(BB_SYSTEM_COUNTER_LV_2_cwire)
	);

		//MUX##############
SC_MUX_u8 (
//multiplexor 1
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_8_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_RANDOM_Out_cwire)
);
SC_MUX_u9 (
//multiplexor 2
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_9_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_MUX_8_cwire)
);
SC_MUX_u10 (
//multiplexor 3
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_10_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_9_cwire)
);
SC_MUX_u11 (
//multiplexor 4
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_11_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_10_cwire)
);
SC_MUX_u12 (
//multiplexor 5
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_12_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_11_cwire)
);
SC_MUX_u13 (
//multiplexor 6
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_13_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_12_cwire)
);
SC_MUX_u14 (
//multiplexor 7
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_14_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_13_cwire)
);
SC_MUX_u15 (
//multiplexor 8
.CC_MUX41_z_OutBus(BB_SYSTEM_MUX_15_cwire),
.CC_MUX41_select_InBus(BB_SYSTEM_SM_cwire),
.CC_MUX41_data_InBus(BB_SYSTEM_REG_14_cwire)
);
		//REGISTERS##############
SC_Reg_u8 (
//Registro 1
.CC_REG_z_OutBus(BB_SYSTEM_REG_8_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_8_cwire)
);
SC_Reg_u9 (
//Registro 2
.CC_REG_z_OutBus(BB_SYSTEM_REG_9_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_9_cwire)
);
SC_Reg_u10 (
//Registro 3
.CC_REG_z_OutBus(BB_SYSTEM_REG_10_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_10_cwire)
);
SC_Reg_u11 (
//Registro 4
.CC_REG_z_OutBus(BB_SYSTEM_REG_10_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_10_cwire)
);
SC_Reg_u12 (
//Registro 5
.CC_REG_z_OutBus(BB_SYSTEM_REG_11_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_11_cwire)
);
SC_Reg_u13 (
//Registro 6
.CC_REG_z_OutBus(BB_SYSTEM_REG_12_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_13_cwire)
);
SC_Reg_u14 (
//Registro 7
.CC_REG_z_OutBus(BB_SYSTEM_REG_13_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_MUX_13_cwire)
);
SC_Reg_u15 (
//Registro 8
.CC_REG_z_OutBus(BB_SYSTEM_REG_14_cwire),
.CC_REG_data_InBUS(BB_SYSTEM_RegSHIFTER_cwire)
);
		//SHIFTER##############
SC_RegSHIFTER_u1 (
//Registro de desplazamiento
.SC_RegSHIFTER_OutBUS(BB_SYSTEM_RegSHIFTER_2_cwire),
.SC_RegSHIFTER_InBUS(BB_SYSTEM_REG_14_cwire)
);
		//RANDOM##############
SC_RegRANDOM_u1 (
//Generador de números aleatorios
.SC_RegSHIFTER_data_OutBUS(BB_SYSTEM_RANDOM_2_cwire),
.SC_RegSHIFTER_contador(BB_SYSTEM_CLOCK_50), // conectado a la señal de reloj. También se puede conectar al contador, sin embargo, se espera que genere datos sin detenerse (?).
.SC_RegSHIFTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh2)
);
		//COMPARATOR##############
CC_COMPARATOR_u1(
//Comparador para la prueba de choque
.CC_COMPARATOR_data_OutBUS(BB_SYSTEM_COMPARATOR_2_cwire),
.SC_COPARATOR_data_InBUS_InHigh(BB_SYSTEM_REG_13_cwire),
.SC_COMPARATOR_data_InBUS_InHigh_2(BB_SYSTEM_RegSHIFTER_2_cwire)
);
//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = DATA_FIXED_INITREGPOINT_0;
assign regGAME_data1_wire = DATA_FIXED_INITREGPOINT_1;
assign regGAME_data2_wire = DATA_FIXED_INITREGPOINT_2;
assign regGAME_data3_wire = DATA_FIXED_INITREGPOINT_3;
assign regGAME_data4_wire = DATA_FIXED_INITREGPOINT_4;
assign regGAME_data5_wire = DATA_FIXED_INITREGPOINT_5;
assign regGAME_data6_wire = DATA_FIXED_INITREGPOINT_6;
assign regGAME_data7_wire = DATA_FIXED_INITREGPOINT_7;

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};
									 
matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 ); 
 
//######################################################################
//#	TO TEST
//######################################################################

assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_leftButton_Out = BB_SYSTEM_leftButton_InLow_cwire;
assign BB_SYSTEM_rightButton_Out = BB_SYSTEM_rightButton_InLow_cwire;
//TO TEST
assign BB_SYSTEM_TEST0 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST1 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST2 = BB_SYSTEM_startButton_InLow_cwire;



endmodule
