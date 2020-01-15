// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Fri Jan 10 17:31:47 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/humidity_sensosor_interface/try_i2c/try_i2c.sim/sim_1/synth/func/xsim/tb_i2c_func_synth.v
// Design      : humidity_interface
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* main_clk = "10" *) 
(* NotValidForBitStream *)
module humidity_interface
   (clk,
    reset,
    enable,
    data_out,
    ld_data,
    enable_cnt,
    sclk,
    sdata);
  input clk;
  input reset;
  input enable;
  output [13:0]data_out;
  output ld_data;
  output enable_cnt;
  inout sclk;
  inout sdata;

  wire \FSM_onehot_curr_state[1]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[5]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[5]_i_2_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_10_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_11_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_12_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_13_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_14_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_15_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_16_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_17_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_18_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_19_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_20_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_21_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_22_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_23_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_2_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_3_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_4_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_5_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_6_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_7_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_8_n_0 ;
  wire \FSM_onehot_curr_state[6]_i_9_n_0 ;
  wire \FSM_onehot_curr_state_reg_n_0_[0] ;
  wire \FSM_onehot_curr_state_reg_n_0_[2] ;
  wire \FSM_onehot_curr_state_reg_n_0_[4] ;
  wire \FSM_onehot_curr_state_reg_n_0_[5] ;
  wire \FSM_onehot_curr_state_reg_n_0_[6] ;
  wire ack;
  wire ack_i_1_n_0;
  wire ack_i_2_n_0;
  wire ack_i_3_n_0;
  wire ack_i_4_n_0;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [10:0]counter;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[10]_i_1_n_0 ;
  wire \counter[10]_i_2_n_0 ;
  wire \counter[10]_i_3_n_0 ;
  wire \counter[10]_i_4_n_0 ;
  wire \counter[10]_i_5_n_0 ;
  wire \counter[10]_i_6_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[3]_i_1_n_0 ;
  wire \counter[4]_i_1_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[5]_i_2_n_0 ;
  wire \counter[6]_i_1_n_0 ;
  wire \counter[7]_i_1_n_0 ;
  wire \counter[7]_i_2_n_0 ;
  wire \counter[8]_i_1_n_0 ;
  wire \counter[9]_i_1_n_0 ;
  wire \counter[9]_i_2_n_0 ;
  wire \counter_cl[0]_i_2_n_0 ;
  wire \counter_cl[0]_i_3_n_0 ;
  wire \counter_cl[0]_i_4_n_0 ;
  wire \counter_cl[0]_i_5_n_0 ;
  wire \counter_cl[0]_i_6_n_0 ;
  wire \counter_cl[12]_i_2_n_0 ;
  wire \counter_cl[12]_i_3_n_0 ;
  wire \counter_cl[12]_i_4_n_0 ;
  wire \counter_cl[12]_i_5_n_0 ;
  wire \counter_cl[16]_i_2_n_0 ;
  wire \counter_cl[16]_i_3_n_0 ;
  wire \counter_cl[16]_i_4_n_0 ;
  wire \counter_cl[4]_i_2_n_0 ;
  wire \counter_cl[4]_i_3_n_0 ;
  wire \counter_cl[4]_i_4_n_0 ;
  wire \counter_cl[4]_i_5_n_0 ;
  wire \counter_cl[8]_i_2_n_0 ;
  wire \counter_cl[8]_i_3_n_0 ;
  wire \counter_cl[8]_i_4_n_0 ;
  wire \counter_cl[8]_i_5_n_0 ;
  wire [18:0]counter_cl_reg;
  wire \counter_cl_reg[0]_i_1_n_0 ;
  wire \counter_cl_reg[0]_i_1_n_1 ;
  wire \counter_cl_reg[0]_i_1_n_2 ;
  wire \counter_cl_reg[0]_i_1_n_3 ;
  wire \counter_cl_reg[0]_i_1_n_4 ;
  wire \counter_cl_reg[0]_i_1_n_5 ;
  wire \counter_cl_reg[0]_i_1_n_6 ;
  wire \counter_cl_reg[0]_i_1_n_7 ;
  wire \counter_cl_reg[12]_i_1_n_0 ;
  wire \counter_cl_reg[12]_i_1_n_1 ;
  wire \counter_cl_reg[12]_i_1_n_2 ;
  wire \counter_cl_reg[12]_i_1_n_3 ;
  wire \counter_cl_reg[12]_i_1_n_4 ;
  wire \counter_cl_reg[12]_i_1_n_5 ;
  wire \counter_cl_reg[12]_i_1_n_6 ;
  wire \counter_cl_reg[12]_i_1_n_7 ;
  wire \counter_cl_reg[16]_i_1_n_2 ;
  wire \counter_cl_reg[16]_i_1_n_3 ;
  wire \counter_cl_reg[16]_i_1_n_5 ;
  wire \counter_cl_reg[16]_i_1_n_6 ;
  wire \counter_cl_reg[16]_i_1_n_7 ;
  wire \counter_cl_reg[4]_i_1_n_0 ;
  wire \counter_cl_reg[4]_i_1_n_1 ;
  wire \counter_cl_reg[4]_i_1_n_2 ;
  wire \counter_cl_reg[4]_i_1_n_3 ;
  wire \counter_cl_reg[4]_i_1_n_4 ;
  wire \counter_cl_reg[4]_i_1_n_5 ;
  wire \counter_cl_reg[4]_i_1_n_6 ;
  wire \counter_cl_reg[4]_i_1_n_7 ;
  wire \counter_cl_reg[8]_i_1_n_0 ;
  wire \counter_cl_reg[8]_i_1_n_1 ;
  wire \counter_cl_reg[8]_i_1_n_2 ;
  wire \counter_cl_reg[8]_i_1_n_3 ;
  wire \counter_cl_reg[8]_i_1_n_4 ;
  wire \counter_cl_reg[8]_i_1_n_5 ;
  wire \counter_cl_reg[8]_i_1_n_6 ;
  wire \counter_cl_reg[8]_i_1_n_7 ;
  wire \counter_wait[0]_i_1_n_0 ;
  wire \counter_wait[0]_i_3_n_0 ;
  wire \counter_wait[0]_i_4_n_0 ;
  wire \counter_wait[0]_i_5_n_0 ;
  wire \counter_wait[0]_i_6_n_0 ;
  wire \counter_wait[12]_i_2_n_0 ;
  wire \counter_wait[12]_i_3_n_0 ;
  wire \counter_wait[12]_i_4_n_0 ;
  wire \counter_wait[12]_i_5_n_0 ;
  wire \counter_wait[16]_i_2_n_0 ;
  wire \counter_wait[4]_i_2_n_0 ;
  wire \counter_wait[4]_i_3_n_0 ;
  wire \counter_wait[4]_i_4_n_0 ;
  wire \counter_wait[4]_i_5_n_0 ;
  wire \counter_wait[8]_i_2_n_0 ;
  wire \counter_wait[8]_i_3_n_0 ;
  wire \counter_wait[8]_i_4_n_0 ;
  wire \counter_wait[8]_i_5_n_0 ;
  wire [16:0]counter_wait_reg;
  wire \counter_wait_reg[0]_i_2_n_0 ;
  wire \counter_wait_reg[0]_i_2_n_1 ;
  wire \counter_wait_reg[0]_i_2_n_2 ;
  wire \counter_wait_reg[0]_i_2_n_3 ;
  wire \counter_wait_reg[0]_i_2_n_4 ;
  wire \counter_wait_reg[0]_i_2_n_5 ;
  wire \counter_wait_reg[0]_i_2_n_6 ;
  wire \counter_wait_reg[0]_i_2_n_7 ;
  wire \counter_wait_reg[12]_i_1_n_0 ;
  wire \counter_wait_reg[12]_i_1_n_1 ;
  wire \counter_wait_reg[12]_i_1_n_2 ;
  wire \counter_wait_reg[12]_i_1_n_3 ;
  wire \counter_wait_reg[12]_i_1_n_4 ;
  wire \counter_wait_reg[12]_i_1_n_5 ;
  wire \counter_wait_reg[12]_i_1_n_6 ;
  wire \counter_wait_reg[12]_i_1_n_7 ;
  wire \counter_wait_reg[16]_i_1_n_7 ;
  wire \counter_wait_reg[4]_i_1_n_0 ;
  wire \counter_wait_reg[4]_i_1_n_1 ;
  wire \counter_wait_reg[4]_i_1_n_2 ;
  wire \counter_wait_reg[4]_i_1_n_3 ;
  wire \counter_wait_reg[4]_i_1_n_4 ;
  wire \counter_wait_reg[4]_i_1_n_5 ;
  wire \counter_wait_reg[4]_i_1_n_6 ;
  wire \counter_wait_reg[4]_i_1_n_7 ;
  wire \counter_wait_reg[8]_i_1_n_0 ;
  wire \counter_wait_reg[8]_i_1_n_1 ;
  wire \counter_wait_reg[8]_i_1_n_2 ;
  wire \counter_wait_reg[8]_i_1_n_3 ;
  wire \counter_wait_reg[8]_i_1_n_4 ;
  wire \counter_wait_reg[8]_i_1_n_5 ;
  wire \counter_wait_reg[8]_i_1_n_6 ;
  wire \counter_wait_reg[8]_i_1_n_7 ;
  wire [15:0]data;
  wire \data[15]_i_2_n_0 ;
  wire \data[15]_i_3_n_0 ;
  wire \data[15]_i_4_n_0 ;
  wire \data[15]_i_5_n_0 ;
  wire \data[15]_i_6_n_0 ;
  wire \data[15]_i_7_n_0 ;
  wire \data[15]_i_8_n_0 ;
  wire \data[15]_i_9_n_0 ;
  wire [13:0]data_out;
  wire [13:0]data_out_OBUF;
  wire enable;
  wire enable_IBUF;
  wire enable_cnt;
  wire enable_cnt_OBUF;
  wire enable_wait;
  wire ld_data;
  wire ld_data_OBUF;
  wire [16:1]plusOp;
  wire [16:0]prescaler_count;
  wire \prescaler_count[0]_i_1_n_0 ;
  wire \prescaler_count[10]_i_1_n_0 ;
  wire \prescaler_count[11]_i_1_n_0 ;
  wire \prescaler_count[12]_i_1_n_0 ;
  wire \prescaler_count[13]_i_1_n_0 ;
  wire \prescaler_count[14]_i_1_n_0 ;
  wire \prescaler_count[15]_i_1_n_0 ;
  wire \prescaler_count[16]_i_1_n_0 ;
  wire \prescaler_count[16]_i_2_n_0 ;
  wire \prescaler_count[16]_i_3_n_0 ;
  wire \prescaler_count[16]_i_5_n_0 ;
  wire \prescaler_count[16]_i_6_n_0 ;
  wire \prescaler_count[1]_i_1_n_0 ;
  wire \prescaler_count[2]_i_1_n_0 ;
  wire \prescaler_count[3]_i_1_n_0 ;
  wire \prescaler_count[4]_i_1_n_0 ;
  wire \prescaler_count[5]_i_1_n_0 ;
  wire \prescaler_count[6]_i_1_n_0 ;
  wire \prescaler_count[7]_i_1_n_0 ;
  wire \prescaler_count[8]_i_1_n_0 ;
  wire \prescaler_count[9]_i_1_n_0 ;
  wire \prescaler_count_reg[12]_i_2_n_0 ;
  wire \prescaler_count_reg[12]_i_2_n_1 ;
  wire \prescaler_count_reg[12]_i_2_n_2 ;
  wire \prescaler_count_reg[12]_i_2_n_3 ;
  wire \prescaler_count_reg[16]_i_4_n_1 ;
  wire \prescaler_count_reg[16]_i_4_n_2 ;
  wire \prescaler_count_reg[16]_i_4_n_3 ;
  wire \prescaler_count_reg[4]_i_2_n_0 ;
  wire \prescaler_count_reg[4]_i_2_n_1 ;
  wire \prescaler_count_reg[4]_i_2_n_2 ;
  wire \prescaler_count_reg[4]_i_2_n_3 ;
  wire \prescaler_count_reg[8]_i_2_n_0 ;
  wire \prescaler_count_reg[8]_i_2_n_1 ;
  wire \prescaler_count_reg[8]_i_2_n_2 ;
  wire \prescaler_count_reg[8]_i_2_n_3 ;
  wire reset;
  wire reset_IBUF;
  wire sclk;
  wire sclk_IBUF;
  wire sclk_IOBUF_inst_i_6_n_0;
  wire sclk_IOBUF_inst_i_7_n_0;
  wire sclk_IOBUF_inst_i_8_n_0;
  wire sclk_IOBUF_inst_i_9_n_0;
  wire sclk_OBUF;
  wire sclk_TRI;
  wire sclk_i0;
  wire sclk_i__0;
  wire sclk_reg0;
  wire sdata;
  wire sdata_IBUF;
  wire sdata_IOBUF_inst_i_10_n_0;
  wire sdata_IOBUF_inst_i_11_n_0;
  wire sdata_IOBUF_inst_i_12_n_0;
  wire sdata_IOBUF_inst_i_13_n_0;
  wire sdata_IOBUF_inst_i_14_n_0;
  wire sdata_IOBUF_inst_i_15_n_0;
  wire sdata_IOBUF_inst_i_16_n_0;
  wire sdata_IOBUF_inst_i_17_n_0;
  wire sdata_IOBUF_inst_i_18_n_0;
  wire sdata_IOBUF_inst_i_19_n_0;
  wire sdata_IOBUF_inst_i_20_n_0;
  wire sdata_IOBUF_inst_i_21_n_0;
  wire sdata_IOBUF_inst_i_22_n_0;
  wire sdata_IOBUF_inst_i_23_n_0;
  wire sdata_IOBUF_inst_i_24_n_0;
  wire sdata_IOBUF_inst_i_25_n_0;
  wire sdata_IOBUF_inst_i_26_n_0;
  wire sdata_IOBUF_inst_i_3_n_0;
  wire sdata_IOBUF_inst_i_4_n_0;
  wire sdata_IOBUF_inst_i_5_n_0;
  wire sdata_IOBUF_inst_i_6_n_0;
  wire sdata_IOBUF_inst_i_8_n_0;
  wire sdata_IOBUF_inst_i_9_n_0;
  wire sdata_OBUF;
  wire sdata_TRI;
  wire sdata_i0;
  wire shf_en;
  wire [3:2]\NLW_counter_cl_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_cl_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_counter_wait_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_counter_wait_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_prescaler_count_reg[16]_i_4_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_curr_state[1]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .O(\FSM_onehot_curr_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_curr_state[3]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state[6]_i_7_n_0 ),
        .O(\FSM_onehot_curr_state[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_curr_state[5]_i_1 
       (.I0(\FSM_onehot_curr_state[5]_i_2_n_0 ),
        .O(\FSM_onehot_curr_state[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAB)) 
    \FSM_onehot_curr_state[5]_i_2 
       (.I0(\FSM_onehot_curr_state[6]_i_7_n_0 ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .O(\FSM_onehot_curr_state[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFF8FFFFFFF8FFF8)) 
    \FSM_onehot_curr_state[6]_i_1 
       (.I0(enable_IBUF),
        .I1(enable_cnt_OBUF),
        .I2(\FSM_onehot_curr_state[6]_i_3_n_0 ),
        .I3(\FSM_onehot_curr_state[6]_i_4_n_0 ),
        .I4(\FSM_onehot_curr_state[6]_i_5_n_0 ),
        .I5(\FSM_onehot_curr_state[6]_i_6_n_0 ),
        .O(\FSM_onehot_curr_state[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    \FSM_onehot_curr_state[6]_i_10 
       (.I0(counter_wait_reg[9]),
        .I1(counter_wait_reg[10]),
        .I2(counter_wait_reg[12]),
        .I3(counter_wait_reg[11]),
        .I4(enable_wait),
        .I5(counter_wait_reg[13]),
        .O(\FSM_onehot_curr_state[6]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \FSM_onehot_curr_state[6]_i_11 
       (.I0(counter_cl_reg[12]),
        .I1(counter_cl_reg[13]),
        .I2(counter_cl_reg[7]),
        .I3(counter_cl_reg[6]),
        .I4(counter_cl_reg[4]),
        .I5(counter_cl_reg[3]),
        .O(\FSM_onehot_curr_state[6]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    \FSM_onehot_curr_state[6]_i_12 
       (.I0(\FSM_onehot_curr_state[6]_i_21_n_0 ),
        .I1(counter_cl_reg[11]),
        .I2(counter_cl_reg[0]),
        .I3(counter_cl_reg[18]),
        .I4(counter_cl_reg[2]),
        .I5(counter_cl_reg[1]),
        .O(\FSM_onehot_curr_state[6]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \FSM_onehot_curr_state[6]_i_13 
       (.I0(counter_cl_reg[13]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .I2(counter_cl_reg[14]),
        .I3(counter_cl_reg[5]),
        .I4(counter_cl_reg[16]),
        .I5(counter_cl_reg[17]),
        .O(\FSM_onehot_curr_state[6]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_onehot_curr_state[6]_i_14 
       (.I0(counter_cl_reg[18]),
        .I1(counter_cl_reg[17]),
        .I2(counter_cl_reg[16]),
        .I3(counter_cl_reg[15]),
        .I4(counter_cl_reg[13]),
        .I5(counter_cl_reg[14]),
        .O(\FSM_onehot_curr_state[6]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_onehot_curr_state[6]_i_15 
       (.I0(counter_cl_reg[5]),
        .I1(counter_cl_reg[6]),
        .I2(counter_cl_reg[3]),
        .I3(counter_cl_reg[4]),
        .O(\FSM_onehot_curr_state[6]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \FSM_onehot_curr_state[6]_i_16 
       (.I0(counter_cl_reg[8]),
        .I1(counter_cl_reg[9]),
        .I2(counter_cl_reg[7]),
        .O(\FSM_onehot_curr_state[6]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFFEA0000FFFFFFFF)) 
    \FSM_onehot_curr_state[6]_i_17 
       (.I0(counter_cl_reg[10]),
        .I1(counter_cl_reg[9]),
        .I2(counter_cl_reg[8]),
        .I3(\FSM_onehot_curr_state[6]_i_22_n_0 ),
        .I4(\FSM_onehot_curr_state[6]_i_23_n_0 ),
        .I5(\data[15]_i_7_n_0 ),
        .O(\FSM_onehot_curr_state[6]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_curr_state[6]_i_18 
       (.I0(counter_cl_reg[10]),
        .I1(counter_cl_reg[9]),
        .O(\FSM_onehot_curr_state[6]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hEA00AA00)) 
    \FSM_onehot_curr_state[6]_i_19 
       (.I0(counter_cl_reg[7]),
        .I1(counter_cl_reg[5]),
        .I2(counter_cl_reg[6]),
        .I3(counter_cl_reg[8]),
        .I4(counter_cl_reg[4]),
        .O(\FSM_onehot_curr_state[6]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_curr_state[6]_i_2 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_curr_state[6]_i_7_n_0 ),
        .O(\FSM_onehot_curr_state[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hAA80)) 
    \FSM_onehot_curr_state[6]_i_20 
       (.I0(counter_cl_reg[10]),
        .I1(counter_cl_reg[3]),
        .I2(counter_cl_reg[2]),
        .I3(counter_cl_reg[7]),
        .O(\FSM_onehot_curr_state[6]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_curr_state[6]_i_21 
       (.I0(counter_cl_reg[10]),
        .I1(counter_cl_reg[9]),
        .O(\FSM_onehot_curr_state[6]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888888000)) 
    \FSM_onehot_curr_state[6]_i_22 
       (.I0(counter_cl_reg[7]),
        .I1(counter_cl_reg[9]),
        .I2(counter_cl_reg[4]),
        .I3(counter_cl_reg[3]),
        .I4(counter_cl_reg[6]),
        .I5(counter_cl_reg[5]),
        .O(\FSM_onehot_curr_state[6]_i_22_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_onehot_curr_state[6]_i_23 
       (.I0(counter_cl_reg[11]),
        .I1(counter_cl_reg[12]),
        .I2(counter_cl_reg[13]),
        .O(\FSM_onehot_curr_state[6]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \FSM_onehot_curr_state[6]_i_3 
       (.I0(\FSM_onehot_curr_state[6]_i_8_n_0 ),
        .I1(\FSM_onehot_curr_state[6]_i_9_n_0 ),
        .I2(counter_wait_reg[7]),
        .I3(counter_wait_reg[3]),
        .I4(counter_wait_reg[8]),
        .I5(\FSM_onehot_curr_state[6]_i_10_n_0 ),
        .O(\FSM_onehot_curr_state[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAABAAAAAA)) 
    \FSM_onehot_curr_state[6]_i_4 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .I1(\FSM_onehot_curr_state[6]_i_11_n_0 ),
        .I2(\FSM_onehot_curr_state[6]_i_12_n_0 ),
        .I3(counter_cl_reg[8]),
        .I4(counter_cl_reg[15]),
        .I5(\FSM_onehot_curr_state[6]_i_13_n_0 ),
        .O(\FSM_onehot_curr_state[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000A8AAAAAAAA)) 
    \FSM_onehot_curr_state[6]_i_5 
       (.I0(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I1(\FSM_onehot_curr_state[6]_i_15_n_0 ),
        .I2(\FSM_onehot_curr_state[6]_i_16_n_0 ),
        .I3(counter_cl_reg[10]),
        .I4(counter_cl_reg[11]),
        .I5(counter_cl_reg[12]),
        .O(\FSM_onehot_curr_state[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h88F888F8FAFA00F0)) 
    \FSM_onehot_curr_state[6]_i_6 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_curr_state[6]_i_17_n_0 ),
        .I2(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I3(\data[15]_i_2_n_0 ),
        .I4(ack),
        .I5(\FSM_onehot_curr_state[6]_i_7_n_0 ),
        .O(\FSM_onehot_curr_state[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBB3BBB3BBB3)) 
    \FSM_onehot_curr_state[6]_i_7 
       (.I0(counter_cl_reg[12]),
        .I1(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I2(counter_cl_reg[11]),
        .I3(\FSM_onehot_curr_state[6]_i_18_n_0 ),
        .I4(\FSM_onehot_curr_state[6]_i_19_n_0 ),
        .I5(\FSM_onehot_curr_state[6]_i_20_n_0 ),
        .O(\FSM_onehot_curr_state[6]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00000004)) 
    \FSM_onehot_curr_state[6]_i_8 
       (.I0(counter_wait_reg[0]),
        .I1(counter_wait_reg[5]),
        .I2(counter_wait_reg[4]),
        .I3(counter_wait_reg[2]),
        .I4(counter_wait_reg[6]),
        .O(\FSM_onehot_curr_state[6]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \FSM_onehot_curr_state[6]_i_9 
       (.I0(counter_wait_reg[15]),
        .I1(counter_wait_reg[16]),
        .I2(counter_wait_reg[14]),
        .I3(counter_wait_reg[1]),
        .O(\FSM_onehot_curr_state[6]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "power_up:0000001,idle:0000010,measure_request:0000100,data_fetch:0010000,wait_measure:0001000,update_duty_cycle_pwm:1000000,hang:0100000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_curr_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_curr_state[6]_i_1_n_0 ),
        .D(1'b0),
        .PRE(reset_IBUF),
        .Q(\FSM_onehot_curr_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "power_up:0000001,idle:0000010,measure_request:0000100,data_fetch:0010000,wait_measure:0001000,update_duty_cycle_pwm:1000000,hang:0100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_curr_state[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_curr_state[1]_i_1_n_0 ),
        .Q(enable_cnt_OBUF));
  (* FSM_ENCODED_STATES = "power_up:0000001,idle:0000010,measure_request:0000100,data_fetch:0010000,wait_measure:0001000,update_duty_cycle_pwm:1000000,hang:0100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_curr_state[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(enable_cnt_OBUF),
        .Q(\FSM_onehot_curr_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "power_up:0000001,idle:0000010,measure_request:0000100,data_fetch:0010000,wait_measure:0001000,update_duty_cycle_pwm:1000000,hang:0100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_curr_state[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_curr_state[3]_i_1_n_0 ),
        .Q(enable_wait));
  (* FSM_ENCODED_STATES = "power_up:0000001,idle:0000010,measure_request:0000100,data_fetch:0010000,wait_measure:0001000,update_duty_cycle_pwm:1000000,hang:0100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_curr_state[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(enable_wait),
        .Q(\FSM_onehot_curr_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "power_up:0000001,idle:0000010,measure_request:0000100,data_fetch:0010000,wait_measure:0001000,update_duty_cycle_pwm:1000000,hang:0100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_curr_state[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_curr_state[5]_i_1_n_0 ),
        .Q(\FSM_onehot_curr_state_reg_n_0_[5] ));
  (* FSM_ENCODED_STATES = "power_up:0000001,idle:0000010,measure_request:0000100,data_fetch:0010000,wait_measure:0001000,update_duty_cycle_pwm:1000000,hang:0100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_curr_state[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_curr_state[6]_i_2_n_0 ),
        .Q(\FSM_onehot_curr_state_reg_n_0_[6] ));
  LUT6 #(
    .INIT(64'hF0FFF0FFF0FFF0EE)) 
    ack_i_1
       (.I0(sdata_IBUF),
        .I1(ack_i_2_n_0),
        .I2(ack),
        .I3(reset_IBUF),
        .I4(\FSM_onehot_curr_state[6]_i_5_n_0 ),
        .I5(\FSM_onehot_curr_state[5]_i_2_n_0 ),
        .O(ack_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000E00)) 
    ack_i_2
       (.I0(ack_i_3_n_0),
        .I1(ack_i_4_n_0),
        .I2(counter_cl_reg[12]),
        .I3(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I4(counter_cl_reg[11]),
        .I5(counter_cl_reg[10]),
        .O(ack_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h1FFF)) 
    ack_i_3
       (.I0(counter_cl_reg[3]),
        .I1(counter_cl_reg[4]),
        .I2(counter_cl_reg[7]),
        .I3(counter_cl_reg[9]),
        .O(ack_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    ack_i_4
       (.I0(counter_cl_reg[5]),
        .I1(counter_cl_reg[6]),
        .I2(counter_cl_reg[8]),
        .O(ack_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_reg
       (.C(sclk_IBUF),
        .CE(1'b1),
        .D(ack_i_1_n_0),
        .Q(ack),
        .R(1'b0));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[0]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[0]),
        .O(\counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAA20000000)) 
    \counter[10]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(\counter[10]_i_3_n_0 ),
        .I2(counter[7]),
        .I3(counter[8]),
        .I4(counter[9]),
        .I5(counter[10]),
        .O(\counter[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000001F11)) 
    \counter[10]_i_2 
       (.I0(\counter[10]_i_4_n_0 ),
        .I1(\FSM_onehot_curr_state[6]_i_7_n_0 ),
        .I2(\FSM_onehot_curr_state[6]_i_17_n_0 ),
        .I3(\counter[10]_i_5_n_0 ),
        .I4(ack_i_2_n_0),
        .I5(\counter[10]_i_6_n_0 ),
        .O(\counter[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF7FFFFFFFFFFFFF)) 
    \counter[10]_i_3 
       (.I0(counter[4]),
        .I1(counter[5]),
        .I2(counter[2]),
        .I3(\counter[5]_i_2_n_0 ),
        .I4(counter[3]),
        .I5(counter[6]),
        .O(\counter[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \counter[10]_i_4 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .O(\counter[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAA008000AAAAAAAA)) 
    \counter[10]_i_5 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_curr_state[6]_i_19_n_0 ),
        .I2(\FSM_onehot_curr_state[6]_i_18_n_0 ),
        .I3(counter_cl_reg[12]),
        .I4(counter_cl_reg[11]),
        .I5(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .O(\counter[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFEEEEEEE00000000)) 
    \counter[10]_i_6 
       (.I0(counter[9]),
        .I1(counter[10]),
        .I2(counter[8]),
        .I3(sclk_IOBUF_inst_i_7_n_0),
        .I4(sclk_IOBUF_inst_i_6_n_0),
        .I5(sclk_IBUF),
        .O(\counter[10]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \counter[1]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[0]),
        .I2(counter[1]),
        .O(\counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \counter[2]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[0]),
        .I2(counter[1]),
        .I3(counter[2]),
        .O(\counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \counter[3]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[1]),
        .I2(counter[0]),
        .I3(counter[2]),
        .I4(counter[3]),
        .O(\counter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \counter[4]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[2]),
        .I2(counter[0]),
        .I3(counter[1]),
        .I4(counter[3]),
        .I5(counter[4]),
        .O(\counter[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAA08000000)) 
    \counter[5]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[3]),
        .I2(\counter[5]_i_2_n_0 ),
        .I3(counter[2]),
        .I4(counter[4]),
        .I5(counter[5]),
        .O(\counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \counter[5]_i_2 
       (.I0(counter[0]),
        .I1(counter[1]),
        .O(\counter[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8AAA2000)) 
    \counter[6]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(\counter[7]_i_2_n_0 ),
        .I2(counter[5]),
        .I3(counter[4]),
        .I4(counter[6]),
        .O(\counter[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA2AAAAA00800000)) 
    \counter[7]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[4]),
        .I2(counter[5]),
        .I3(\counter[7]_i_2_n_0 ),
        .I4(counter[6]),
        .I5(counter[7]),
        .O(\counter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \counter[7]_i_2 
       (.I0(counter[2]),
        .I1(counter[0]),
        .I2(counter[1]),
        .I3(counter[3]),
        .O(\counter[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA2AA0800)) 
    \counter[8]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[6]),
        .I2(\counter[9]_i_2_n_0 ),
        .I3(counter[7]),
        .I4(counter[8]),
        .O(\counter[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA2AAAAA00800000)) 
    \counter[9]_i_1 
       (.I0(\counter[10]_i_2_n_0 ),
        .I1(counter[8]),
        .I2(counter[7]),
        .I3(\counter[9]_i_2_n_0 ),
        .I4(counter[6]),
        .I5(counter[9]),
        .O(\counter[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \counter[9]_i_2 
       (.I0(counter[3]),
        .I1(counter[1]),
        .I2(counter[0]),
        .I3(counter[2]),
        .I4(counter[5]),
        .I5(counter[4]),
        .O(\counter[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \counter_cl[0]_i_2 
       (.I0(enable_wait),
        .I1(enable_cnt_OBUF),
        .O(\counter_cl[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[0]_i_3 
       (.I0(counter_cl_reg[3]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[0]_i_4 
       (.I0(counter_cl_reg[2]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[0]_i_5 
       (.I0(counter_cl_reg[1]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter_cl[0]_i_6 
       (.I0(counter_cl_reg[0]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[12]_i_2 
       (.I0(counter_cl_reg[15]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[12]_i_3 
       (.I0(counter_cl_reg[14]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[12]_i_4 
       (.I0(counter_cl_reg[13]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \counter_cl[12]_i_5 
       (.I0(enable_cnt_OBUF),
        .I1(enable_wait),
        .I2(counter_cl_reg[12]),
        .O(\counter_cl[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[16]_i_2 
       (.I0(counter_cl_reg[18]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[16]_i_3 
       (.I0(counter_cl_reg[17]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[16]_i_4 
       (.I0(counter_cl_reg[16]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \counter_cl[4]_i_2 
       (.I0(enable_cnt_OBUF),
        .I1(enable_wait),
        .I2(counter_cl_reg[7]),
        .O(\counter_cl[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[4]_i_3 
       (.I0(counter_cl_reg[6]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[4]_i_4 
       (.I0(counter_cl_reg[5]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[4]_i_5 
       (.I0(counter_cl_reg[4]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \counter_cl[8]_i_2 
       (.I0(enable_cnt_OBUF),
        .I1(enable_wait),
        .I2(counter_cl_reg[11]),
        .O(\counter_cl[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \counter_cl[8]_i_3 
       (.I0(enable_cnt_OBUF),
        .I1(enable_wait),
        .I2(counter_cl_reg[10]),
        .O(\counter_cl[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \counter_cl[8]_i_4 
       (.I0(counter_cl_reg[9]),
        .I1(enable_cnt_OBUF),
        .I2(enable_wait),
        .O(\counter_cl[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \counter_cl[8]_i_5 
       (.I0(enable_cnt_OBUF),
        .I1(enable_wait),
        .I2(counter_cl_reg[8]),
        .O(\counter_cl[8]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[0]_i_1_n_7 ),
        .Q(counter_cl_reg[0]));
  CARRY4 \counter_cl_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_cl_reg[0]_i_1_n_0 ,\counter_cl_reg[0]_i_1_n_1 ,\counter_cl_reg[0]_i_1_n_2 ,\counter_cl_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\counter_cl[0]_i_2_n_0 }),
        .O({\counter_cl_reg[0]_i_1_n_4 ,\counter_cl_reg[0]_i_1_n_5 ,\counter_cl_reg[0]_i_1_n_6 ,\counter_cl_reg[0]_i_1_n_7 }),
        .S({\counter_cl[0]_i_3_n_0 ,\counter_cl[0]_i_4_n_0 ,\counter_cl[0]_i_5_n_0 ,\counter_cl[0]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[8]_i_1_n_5 ),
        .Q(counter_cl_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[8]_i_1_n_4 ),
        .Q(counter_cl_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[12]_i_1_n_7 ),
        .Q(counter_cl_reg[12]));
  CARRY4 \counter_cl_reg[12]_i_1 
       (.CI(\counter_cl_reg[8]_i_1_n_0 ),
        .CO({\counter_cl_reg[12]_i_1_n_0 ,\counter_cl_reg[12]_i_1_n_1 ,\counter_cl_reg[12]_i_1_n_2 ,\counter_cl_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_cl_reg[12]_i_1_n_4 ,\counter_cl_reg[12]_i_1_n_5 ,\counter_cl_reg[12]_i_1_n_6 ,\counter_cl_reg[12]_i_1_n_7 }),
        .S({\counter_cl[12]_i_2_n_0 ,\counter_cl[12]_i_3_n_0 ,\counter_cl[12]_i_4_n_0 ,\counter_cl[12]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[12]_i_1_n_6 ),
        .Q(counter_cl_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[12]_i_1_n_5 ),
        .Q(counter_cl_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[12]_i_1_n_4 ),
        .Q(counter_cl_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[16]_i_1_n_7 ),
        .Q(counter_cl_reg[16]));
  CARRY4 \counter_cl_reg[16]_i_1 
       (.CI(\counter_cl_reg[12]_i_1_n_0 ),
        .CO({\NLW_counter_cl_reg[16]_i_1_CO_UNCONNECTED [3:2],\counter_cl_reg[16]_i_1_n_2 ,\counter_cl_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_cl_reg[16]_i_1_O_UNCONNECTED [3],\counter_cl_reg[16]_i_1_n_5 ,\counter_cl_reg[16]_i_1_n_6 ,\counter_cl_reg[16]_i_1_n_7 }),
        .S({1'b0,\counter_cl[16]_i_2_n_0 ,\counter_cl[16]_i_3_n_0 ,\counter_cl[16]_i_4_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[16]_i_1_n_6 ),
        .Q(counter_cl_reg[17]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[16]_i_1_n_5 ),
        .Q(counter_cl_reg[18]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[0]_i_1_n_6 ),
        .Q(counter_cl_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[0]_i_1_n_5 ),
        .Q(counter_cl_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[0]_i_1_n_4 ),
        .Q(counter_cl_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[4]_i_1_n_7 ),
        .Q(counter_cl_reg[4]));
  CARRY4 \counter_cl_reg[4]_i_1 
       (.CI(\counter_cl_reg[0]_i_1_n_0 ),
        .CO({\counter_cl_reg[4]_i_1_n_0 ,\counter_cl_reg[4]_i_1_n_1 ,\counter_cl_reg[4]_i_1_n_2 ,\counter_cl_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_cl_reg[4]_i_1_n_4 ,\counter_cl_reg[4]_i_1_n_5 ,\counter_cl_reg[4]_i_1_n_6 ,\counter_cl_reg[4]_i_1_n_7 }),
        .S({\counter_cl[4]_i_2_n_0 ,\counter_cl[4]_i_3_n_0 ,\counter_cl[4]_i_4_n_0 ,\counter_cl[4]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[4]_i_1_n_6 ),
        .Q(counter_cl_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[4]_i_1_n_5 ),
        .Q(counter_cl_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[4]_i_1_n_4 ),
        .Q(counter_cl_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[8]_i_1_n_7 ),
        .Q(counter_cl_reg[8]));
  CARRY4 \counter_cl_reg[8]_i_1 
       (.CI(\counter_cl_reg[4]_i_1_n_0 ),
        .CO({\counter_cl_reg[8]_i_1_n_0 ,\counter_cl_reg[8]_i_1_n_1 ,\counter_cl_reg[8]_i_1_n_2 ,\counter_cl_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_cl_reg[8]_i_1_n_4 ,\counter_cl_reg[8]_i_1_n_5 ,\counter_cl_reg[8]_i_1_n_6 ,\counter_cl_reg[8]_i_1_n_7 }),
        .S({\counter_cl[8]_i_2_n_0 ,\counter_cl[8]_i_3_n_0 ,\counter_cl[8]_i_4_n_0 ,\counter_cl[8]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_cl_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter_cl_reg[8]_i_1_n_6 ),
        .Q(counter_cl_reg[9]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[0]_i_1_n_0 ),
        .Q(counter[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[10]_i_1_n_0 ),
        .Q(counter[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[1]_i_1_n_0 ),
        .Q(counter[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[2]_i_1_n_0 ),
        .Q(counter[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[3]_i_1_n_0 ),
        .Q(counter[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[4]_i_1_n_0 ),
        .Q(counter[4]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[5]_i_1_n_0 ),
        .Q(counter[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[6]_i_1_n_0 ),
        .Q(counter[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[7]_i_1_n_0 ),
        .Q(counter[7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[8]_i_1_n_0 ),
        .Q(counter[8]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[9]_i_1_n_0 ),
        .Q(counter[9]));
  LUT5 #(
    .INIT(32'hFD555555)) 
    \counter_wait[0]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .O(\counter_wait[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[0]_i_3 
       (.I0(enable_wait),
        .I1(counter_wait_reg[3]),
        .O(\counter_wait[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[0]_i_4 
       (.I0(enable_wait),
        .I1(counter_wait_reg[2]),
        .O(\counter_wait[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[0]_i_5 
       (.I0(enable_wait),
        .I1(counter_wait_reg[1]),
        .O(\counter_wait[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \counter_wait[0]_i_6 
       (.I0(counter_wait_reg[0]),
        .I1(enable_wait),
        .O(\counter_wait[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[12]_i_2 
       (.I0(enable_wait),
        .I1(counter_wait_reg[15]),
        .O(\counter_wait[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[12]_i_3 
       (.I0(enable_wait),
        .I1(counter_wait_reg[14]),
        .O(\counter_wait[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[12]_i_4 
       (.I0(enable_wait),
        .I1(counter_wait_reg[13]),
        .O(\counter_wait[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[12]_i_5 
       (.I0(enable_wait),
        .I1(counter_wait_reg[12]),
        .O(\counter_wait[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[16]_i_2 
       (.I0(enable_wait),
        .I1(counter_wait_reg[16]),
        .O(\counter_wait[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[4]_i_2 
       (.I0(enable_wait),
        .I1(counter_wait_reg[7]),
        .O(\counter_wait[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[4]_i_3 
       (.I0(enable_wait),
        .I1(counter_wait_reg[6]),
        .O(\counter_wait[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[4]_i_4 
       (.I0(enable_wait),
        .I1(counter_wait_reg[5]),
        .O(\counter_wait[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[4]_i_5 
       (.I0(enable_wait),
        .I1(counter_wait_reg[4]),
        .O(\counter_wait[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[8]_i_2 
       (.I0(enable_wait),
        .I1(counter_wait_reg[11]),
        .O(\counter_wait[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[8]_i_3 
       (.I0(enable_wait),
        .I1(counter_wait_reg[10]),
        .O(\counter_wait[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[8]_i_4 
       (.I0(enable_wait),
        .I1(counter_wait_reg[9]),
        .O(\counter_wait[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_wait[8]_i_5 
       (.I0(enable_wait),
        .I1(counter_wait_reg[8]),
        .O(\counter_wait[8]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[0]_i_2_n_7 ),
        .Q(counter_wait_reg[0]));
  CARRY4 \counter_wait_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_wait_reg[0]_i_2_n_0 ,\counter_wait_reg[0]_i_2_n_1 ,\counter_wait_reg[0]_i_2_n_2 ,\counter_wait_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,enable_wait}),
        .O({\counter_wait_reg[0]_i_2_n_4 ,\counter_wait_reg[0]_i_2_n_5 ,\counter_wait_reg[0]_i_2_n_6 ,\counter_wait_reg[0]_i_2_n_7 }),
        .S({\counter_wait[0]_i_3_n_0 ,\counter_wait[0]_i_4_n_0 ,\counter_wait[0]_i_5_n_0 ,\counter_wait[0]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[8]_i_1_n_5 ),
        .Q(counter_wait_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[8]_i_1_n_4 ),
        .Q(counter_wait_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[12]_i_1_n_7 ),
        .Q(counter_wait_reg[12]));
  CARRY4 \counter_wait_reg[12]_i_1 
       (.CI(\counter_wait_reg[8]_i_1_n_0 ),
        .CO({\counter_wait_reg[12]_i_1_n_0 ,\counter_wait_reg[12]_i_1_n_1 ,\counter_wait_reg[12]_i_1_n_2 ,\counter_wait_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[12]_i_1_n_4 ,\counter_wait_reg[12]_i_1_n_5 ,\counter_wait_reg[12]_i_1_n_6 ,\counter_wait_reg[12]_i_1_n_7 }),
        .S({\counter_wait[12]_i_2_n_0 ,\counter_wait[12]_i_3_n_0 ,\counter_wait[12]_i_4_n_0 ,\counter_wait[12]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[12]_i_1_n_6 ),
        .Q(counter_wait_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[12]_i_1_n_5 ),
        .Q(counter_wait_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[12]_i_1_n_4 ),
        .Q(counter_wait_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[16]_i_1_n_7 ),
        .Q(counter_wait_reg[16]));
  CARRY4 \counter_wait_reg[16]_i_1 
       (.CI(\counter_wait_reg[12]_i_1_n_0 ),
        .CO(\NLW_counter_wait_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_wait_reg[16]_i_1_O_UNCONNECTED [3:1],\counter_wait_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,\counter_wait[16]_i_2_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[0]_i_2_n_6 ),
        .Q(counter_wait_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[0]_i_2_n_5 ),
        .Q(counter_wait_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[0]_i_2_n_4 ),
        .Q(counter_wait_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[4]_i_1_n_7 ),
        .Q(counter_wait_reg[4]));
  CARRY4 \counter_wait_reg[4]_i_1 
       (.CI(\counter_wait_reg[0]_i_2_n_0 ),
        .CO({\counter_wait_reg[4]_i_1_n_0 ,\counter_wait_reg[4]_i_1_n_1 ,\counter_wait_reg[4]_i_1_n_2 ,\counter_wait_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[4]_i_1_n_4 ,\counter_wait_reg[4]_i_1_n_5 ,\counter_wait_reg[4]_i_1_n_6 ,\counter_wait_reg[4]_i_1_n_7 }),
        .S({\counter_wait[4]_i_2_n_0 ,\counter_wait[4]_i_3_n_0 ,\counter_wait[4]_i_4_n_0 ,\counter_wait[4]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[4]_i_1_n_6 ),
        .Q(counter_wait_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[4]_i_1_n_5 ),
        .Q(counter_wait_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[4]_i_1_n_4 ),
        .Q(counter_wait_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[8]_i_1_n_7 ),
        .Q(counter_wait_reg[8]));
  CARRY4 \counter_wait_reg[8]_i_1 
       (.CI(\counter_wait_reg[4]_i_1_n_0 ),
        .CO({\counter_wait_reg[8]_i_1_n_0 ,\counter_wait_reg[8]_i_1_n_1 ,\counter_wait_reg[8]_i_1_n_2 ,\counter_wait_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_wait_reg[8]_i_1_n_4 ,\counter_wait_reg[8]_i_1_n_5 ,\counter_wait_reg[8]_i_1_n_6 ,\counter_wait_reg[8]_i_1_n_7 }),
        .S({\counter_wait[8]_i_2_n_0 ,\counter_wait[8]_i_3_n_0 ,\counter_wait[8]_i_4_n_0 ,\counter_wait[8]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_wait_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter_wait[0]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(\counter_wait_reg[8]_i_1_n_6 ),
        .Q(counter_wait_reg[9]));
  LUT3 #(
    .INIT(8'h04)) 
    \data[15]_i_1 
       (.I0(\data[15]_i_2_n_0 ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(\data[15]_i_3_n_0 ),
        .O(shf_en));
  LUT6 #(
    .INIT(64'h0A2A2A2A2A2A2A2A)) 
    \data[15]_i_2 
       (.I0(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I1(counter_cl_reg[11]),
        .I2(counter_cl_reg[12]),
        .I3(counter_cl_reg[9]),
        .I4(counter_cl_reg[10]),
        .I5(\FSM_onehot_curr_state[6]_i_19_n_0 ),
        .O(\data[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF4500FFFFFFFF)) 
    \data[15]_i_3 
       (.I0(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I1(\data[15]_i_4_n_0 ),
        .I2(\data[15]_i_5_n_0 ),
        .I3(sdata_IOBUF_inst_i_4_n_0),
        .I4(\data[15]_i_6_n_0 ),
        .I5(\data[15]_i_7_n_0 ),
        .O(\data[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8080808080808000)) 
    \data[15]_i_4 
       (.I0(counter_cl_reg[9]),
        .I1(counter_cl_reg[8]),
        .I2(counter_cl_reg[10]),
        .I3(counter_cl_reg[5]),
        .I4(counter_cl_reg[4]),
        .I5(\data[15]_i_8_n_0 ),
        .O(\data[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \data[15]_i_5 
       (.I0(\data[15]_i_7_n_0 ),
        .I1(counter_cl_reg[11]),
        .I2(counter_cl_reg[12]),
        .O(\data[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h8080808080808000)) 
    \data[15]_i_6 
       (.I0(counter_cl_reg[13]),
        .I1(counter_cl_reg[12]),
        .I2(counter_cl_reg[11]),
        .I3(\data[15]_i_9_n_0 ),
        .I4(counter_cl_reg[8]),
        .I5(\FSM_onehot_curr_state[6]_i_21_n_0 ),
        .O(\data[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \data[15]_i_7 
       (.I0(counter_cl_reg[14]),
        .I1(counter_cl_reg[18]),
        .I2(counter_cl_reg[17]),
        .I3(counter_cl_reg[16]),
        .I4(counter_cl_reg[15]),
        .O(\data[15]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \data[15]_i_8 
       (.I0(counter_cl_reg[7]),
        .I1(counter_cl_reg[6]),
        .O(\data[15]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8A888)) 
    \data[15]_i_9 
       (.I0(counter_cl_reg[7]),
        .I1(counter_cl_reg[6]),
        .I2(counter_cl_reg[5]),
        .I3(counter_cl_reg[4]),
        .I4(counter_cl_reg[3]),
        .I5(counter_cl_reg[2]),
        .O(\data[15]_i_9_n_0 ));
  OBUF \data_out_OBUF[0]_inst 
       (.I(data_out_OBUF[0]),
        .O(data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[0]_inst_i_1 
       (.I0(data[0]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[0]));
  OBUF \data_out_OBUF[10]_inst 
       (.I(data_out_OBUF[10]),
        .O(data_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[10]_inst_i_1 
       (.I0(data[10]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[10]));
  OBUF \data_out_OBUF[11]_inst 
       (.I(data_out_OBUF[11]),
        .O(data_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[11]_inst_i_1 
       (.I0(data[11]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[11]));
  OBUF \data_out_OBUF[12]_inst 
       (.I(data_out_OBUF[12]),
        .O(data_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[12]_inst_i_1 
       (.I0(data[12]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[12]));
  OBUF \data_out_OBUF[13]_inst 
       (.I(data_out_OBUF[13]),
        .O(data_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[13]_inst_i_1 
       (.I0(data[13]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[13]));
  OBUF \data_out_OBUF[1]_inst 
       (.I(data_out_OBUF[1]),
        .O(data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[1]_inst_i_1 
       (.I0(data[1]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[1]));
  OBUF \data_out_OBUF[2]_inst 
       (.I(data_out_OBUF[2]),
        .O(data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[2]_inst_i_1 
       (.I0(data[2]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[2]));
  OBUF \data_out_OBUF[3]_inst 
       (.I(data_out_OBUF[3]),
        .O(data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[3]_inst_i_1 
       (.I0(data[3]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[3]));
  OBUF \data_out_OBUF[4]_inst 
       (.I(data_out_OBUF[4]),
        .O(data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[4]_inst_i_1 
       (.I0(data[4]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[4]));
  OBUF \data_out_OBUF[5]_inst 
       (.I(data_out_OBUF[5]),
        .O(data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[5]_inst_i_1 
       (.I0(data[5]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[5]));
  OBUF \data_out_OBUF[6]_inst 
       (.I(data_out_OBUF[6]),
        .O(data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[6]_inst_i_1 
       (.I0(data[6]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[6]));
  OBUF \data_out_OBUF[7]_inst 
       (.I(data_out_OBUF[7]),
        .O(data_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[7]_inst_i_1 
       (.I0(data[7]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[7]));
  OBUF \data_out_OBUF[8]_inst 
       (.I(data_out_OBUF[8]),
        .O(data_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[8]_inst_i_1 
       (.I0(data[8]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[8]));
  OBUF \data_out_OBUF[9]_inst 
       (.I(data_out_OBUF[9]),
        .O(data_out[9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \data_out_OBUF[9]_inst_i_1 
       (.I0(data[9]),
        .I1(data[14]),
        .I2(data[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .O(data_out_OBUF[9]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(sdata_IBUF),
        .Q(data[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[10] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[9]),
        .Q(data[10]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[11] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[10]),
        .Q(data[11]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[12] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[11]),
        .Q(data[12]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[13] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[12]),
        .Q(data[13]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[14] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[13]),
        .Q(data[14]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[15] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[14]),
        .Q(data[15]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[0]),
        .Q(data[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[1]),
        .Q(data[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[2]),
        .Q(data[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[3]),
        .Q(data[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[4]),
        .Q(data[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[5]),
        .Q(data[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[6]),
        .Q(data[7]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[8] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[7]),
        .Q(data[8]));
  FDCE #(
    .INIT(1'b0)) 
    \data_reg[9] 
       (.C(sclk_IBUF),
        .CE(shf_en),
        .CLR(reset_IBUF),
        .D(data[8]),
        .Q(data[9]));
  IBUF enable_IBUF_inst
       (.I(enable),
        .O(enable_IBUF));
  OBUF enable_cnt_OBUF_inst
       (.I(enable_cnt_OBUF),
        .O(enable_cnt));
  OBUF ld_data_OBUF_inst
       (.I(ld_data_OBUF),
        .O(ld_data));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h02)) 
    ld_data_OBUF_inst_i_1
       (.I0(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .I1(data[15]),
        .I2(data[14]),
        .O(ld_data_OBUF));
  LUT6 #(
    .INIT(64'h0000000002AAAAAA)) 
    \prescaler_count[0]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(prescaler_count[0]),
        .O(\prescaler_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[10]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[10]),
        .O(\prescaler_count[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[11]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[11]),
        .O(\prescaler_count[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[12]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[12]),
        .O(\prescaler_count[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[13]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[13]),
        .O(\prescaler_count[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[14]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[14]),
        .O(\prescaler_count[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[15]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[15]),
        .O(\prescaler_count[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[16]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[16]),
        .O(\prescaler_count[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFA8AA)) 
    \prescaler_count[16]_i_2 
       (.I0(prescaler_count[7]),
        .I1(prescaler_count[6]),
        .I2(prescaler_count[5]),
        .I3(\prescaler_count[16]_i_5_n_0 ),
        .I4(prescaler_count[8]),
        .I5(\prescaler_count[16]_i_6_n_0 ),
        .O(\prescaler_count[16]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \prescaler_count[16]_i_3 
       (.I0(prescaler_count[11]),
        .I1(prescaler_count[12]),
        .I2(prescaler_count[13]),
        .I3(prescaler_count[14]),
        .O(\prescaler_count[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \prescaler_count[16]_i_5 
       (.I0(prescaler_count[3]),
        .I1(prescaler_count[0]),
        .I2(prescaler_count[4]),
        .I3(prescaler_count[1]),
        .I4(prescaler_count[2]),
        .O(\prescaler_count[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \prescaler_count[16]_i_6 
       (.I0(prescaler_count[10]),
        .I1(prescaler_count[9]),
        .O(\prescaler_count[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[1]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[1]),
        .O(\prescaler_count[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[2]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[2]),
        .O(\prescaler_count[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[3]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[3]),
        .O(\prescaler_count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[4]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[4]),
        .O(\prescaler_count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[5]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[5]),
        .O(\prescaler_count[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[6]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[6]),
        .O(\prescaler_count[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[7]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[7]),
        .O(\prescaler_count[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[8]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[8]),
        .O(\prescaler_count[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AAAAAA00000000)) 
    \prescaler_count[9]_i_1 
       (.I0(enable_wait),
        .I1(\prescaler_count[16]_i_2_n_0 ),
        .I2(\prescaler_count[16]_i_3_n_0 ),
        .I3(prescaler_count[16]),
        .I4(prescaler_count[15]),
        .I5(plusOp[9]),
        .O(\prescaler_count[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[0]_i_1_n_0 ),
        .Q(prescaler_count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[10]_i_1_n_0 ),
        .Q(prescaler_count[10]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[11]_i_1_n_0 ),
        .Q(prescaler_count[11]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[12]_i_1_n_0 ),
        .Q(prescaler_count[12]));
  CARRY4 \prescaler_count_reg[12]_i_2 
       (.CI(\prescaler_count_reg[8]_i_2_n_0 ),
        .CO({\prescaler_count_reg[12]_i_2_n_0 ,\prescaler_count_reg[12]_i_2_n_1 ,\prescaler_count_reg[12]_i_2_n_2 ,\prescaler_count_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[12:9]),
        .S(prescaler_count[12:9]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[13]_i_1_n_0 ),
        .Q(prescaler_count[13]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[14]_i_1_n_0 ),
        .Q(prescaler_count[14]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[15]_i_1_n_0 ),
        .Q(prescaler_count[15]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[16]_i_1_n_0 ),
        .Q(prescaler_count[16]));
  CARRY4 \prescaler_count_reg[16]_i_4 
       (.CI(\prescaler_count_reg[12]_i_2_n_0 ),
        .CO({\NLW_prescaler_count_reg[16]_i_4_CO_UNCONNECTED [3],\prescaler_count_reg[16]_i_4_n_1 ,\prescaler_count_reg[16]_i_4_n_2 ,\prescaler_count_reg[16]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[16:13]),
        .S(prescaler_count[16:13]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[1]_i_1_n_0 ),
        .Q(prescaler_count[1]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[2]_i_1_n_0 ),
        .Q(prescaler_count[2]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[3]_i_1_n_0 ),
        .Q(prescaler_count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[4]_i_1_n_0 ),
        .Q(prescaler_count[4]));
  CARRY4 \prescaler_count_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\prescaler_count_reg[4]_i_2_n_0 ,\prescaler_count_reg[4]_i_2_n_1 ,\prescaler_count_reg[4]_i_2_n_2 ,\prescaler_count_reg[4]_i_2_n_3 }),
        .CYINIT(prescaler_count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[4:1]),
        .S(prescaler_count[4:1]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[5]_i_1_n_0 ),
        .Q(prescaler_count[5]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[6]_i_1_n_0 ),
        .Q(prescaler_count[6]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[7]_i_1_n_0 ),
        .Q(prescaler_count[7]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[8]_i_1_n_0 ),
        .Q(prescaler_count[8]));
  CARRY4 \prescaler_count_reg[8]_i_2 
       (.CI(\prescaler_count_reg[4]_i_2_n_0 ),
        .CO({\prescaler_count_reg[8]_i_2_n_0 ,\prescaler_count_reg[8]_i_2_n_1 ,\prescaler_count_reg[8]_i_2_n_2 ,\prescaler_count_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[8:5]),
        .S(prescaler_count[8:5]));
  FDCE #(
    .INIT(1'b0)) 
    \prescaler_count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\prescaler_count[9]_i_1_n_0 ),
        .Q(prescaler_count[9]));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  IOBUF sclk_IOBUF_inst
       (.I(sclk_OBUF),
        .IO(sclk),
        .O(sclk_IBUF),
        .T(sclk_TRI));
  LUT2 #(
    .INIT(4'h8)) 
    sclk_IOBUF_inst_i_1
       (.I0(sclk_i__0),
        .I1(sclk_i0),
        .O(sclk_OBUF));
  LUT1 #(
    .INIT(2'h1)) 
    sclk_IOBUF_inst_i_2
       (.I0(sclk_reg0),
        .O(sclk_TRI));
  LUT6 #(
    .INIT(64'h0004000C0007000C)) 
    sclk_IOBUF_inst_i_3
       (.I0(sclk_IOBUF_inst_i_6_n_0),
        .I1(counter[8]),
        .I2(counter[9]),
        .I3(counter[10]),
        .I4(sclk_IOBUF_inst_i_7_n_0),
        .I5(sclk_IOBUF_inst_i_8_n_0),
        .O(sclk_i__0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    sclk_IOBUF_inst_i_4
       (.I0(sclk_IBUF),
        .I1(sclk_IOBUF_inst_i_9_n_0),
        .O(sclk_i0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sclk_IOBUF_inst_i_5
       (.I0(sclk_IBUF),
        .I1(sclk_IOBUF_inst_i_9_n_0),
        .O(sclk_reg0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFEAA)) 
    sclk_IOBUF_inst_i_6
       (.I0(counter[3]),
        .I1(counter[0]),
        .I2(counter[1]),
        .I3(counter[2]),
        .O(sclk_IOBUF_inst_i_6_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    sclk_IOBUF_inst_i_7
       (.I0(counter[5]),
        .I1(counter[4]),
        .I2(counter[7]),
        .I3(counter[6]),
        .O(sclk_IOBUF_inst_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h15FF)) 
    sclk_IOBUF_inst_i_8
       (.I0(counter[2]),
        .I1(counter[0]),
        .I2(counter[1]),
        .I3(counter[3]),
        .O(sclk_IOBUF_inst_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFEFAAAAFFEFAFAF)) 
    sclk_IOBUF_inst_i_9
       (.I0(ack_i_2_n_0),
        .I1(\data[15]_i_2_n_0 ),
        .I2(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I3(\FSM_onehot_curr_state[6]_i_17_n_0 ),
        .I4(\FSM_onehot_curr_state[6]_i_7_n_0 ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .O(sclk_IOBUF_inst_i_9_n_0));
  IOBUF sdata_IOBUF_inst
       (.I(sdata_OBUF),
        .IO(sdata),
        .O(sdata_IBUF),
        .T(sdata_TRI));
  LUT6 #(
    .INIT(64'h00800080AAAAA0A0)) 
    sdata_IOBUF_inst_i_1
       (.I0(sdata_IOBUF_inst_i_3_n_0),
        .I1(sdata_IOBUF_inst_i_4_n_0),
        .I2(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I3(sdata_IOBUF_inst_i_5_n_0),
        .I4(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I5(sdata_IOBUF_inst_i_6_n_0),
        .O(sdata_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h01FF)) 
    sdata_IOBUF_inst_i_10
       (.I0(counter_cl_reg[10]),
        .I1(counter_cl_reg[9]),
        .I2(counter_cl_reg[8]),
        .I3(counter_cl_reg[13]),
        .O(sdata_IOBUF_inst_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    sdata_IOBUF_inst_i_11
       (.I0(counter_cl_reg[5]),
        .I1(counter_cl_reg[4]),
        .I2(counter_cl_reg[3]),
        .I3(counter_cl_reg[2]),
        .O(sdata_IOBUF_inst_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    sdata_IOBUF_inst_i_12
       (.I0(counter_cl_reg[9]),
        .I1(counter_cl_reg[10]),
        .I2(counter_cl_reg[6]),
        .I3(counter_cl_reg[7]),
        .O(sdata_IOBUF_inst_i_12_n_0));
  LUT6 #(
    .INIT(64'h8080800088888888)) 
    sdata_IOBUF_inst_i_13
       (.I0(counter_cl_reg[7]),
        .I1(counter_cl_reg[8]),
        .I2(counter_cl_reg[4]),
        .I3(counter_cl_reg[2]),
        .I4(counter_cl_reg[3]),
        .I5(sdata_IOBUF_inst_i_21_n_0),
        .O(sdata_IOBUF_inst_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hA8000000)) 
    sdata_IOBUF_inst_i_14
       (.I0(sdata_IOBUF_inst_i_20_n_0),
        .I1(counter_cl_reg[5]),
        .I2(counter_cl_reg[4]),
        .I3(counter_cl_reg[10]),
        .I4(counter_cl_reg[9]),
        .O(sdata_IOBUF_inst_i_14_n_0));
  LUT6 #(
    .INIT(64'h0000000055555557)) 
    sdata_IOBUF_inst_i_15
       (.I0(sdata_IOBUF_inst_i_20_n_0),
        .I1(counter_cl_reg[5]),
        .I2(counter_cl_reg[4]),
        .I3(counter_cl_reg[3]),
        .I4(counter_cl_reg[2]),
        .I5(\FSM_onehot_curr_state[6]_i_21_n_0 ),
        .O(sdata_IOBUF_inst_i_15_n_0));
  LUT6 #(
    .INIT(64'h4445454545454545)) 
    sdata_IOBUF_inst_i_16
       (.I0(counter_cl_reg[10]),
        .I1(\FSM_onehot_curr_state[6]_i_16_n_0 ),
        .I2(counter_cl_reg[6]),
        .I3(counter_cl_reg[4]),
        .I4(counter_cl_reg[3]),
        .I5(counter_cl_reg[5]),
        .O(sdata_IOBUF_inst_i_16_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAA8888888)) 
    sdata_IOBUF_inst_i_17
       (.I0(ack_i_2_n_0),
        .I1(\FSM_onehot_curr_state[6]_i_21_n_0 ),
        .I2(counter_cl_reg[5]),
        .I3(sdata_IOBUF_inst_i_22_n_0),
        .I4(sdata_IOBUF_inst_i_20_n_0),
        .I5(sdata_IOBUF_inst_i_23_n_0),
        .O(sdata_IOBUF_inst_i_17_n_0));
  LUT6 #(
    .INIT(64'hF0FFF0F0FFFFF0F4)) 
    sdata_IOBUF_inst_i_18
       (.I0(sdata_IOBUF_inst_i_24_n_0),
        .I1(\data[15]_i_7_n_0 ),
        .I2(\FSM_onehot_curr_state[6]_i_17_n_0 ),
        .I3(counter_cl_reg[11]),
        .I4(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I5(counter_cl_reg[12]),
        .O(sdata_IOBUF_inst_i_18_n_0));
  LUT6 #(
    .INIT(64'hABFFAAAAAAAAAAAA)) 
    sdata_IOBUF_inst_i_19
       (.I0(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I1(sdata_IOBUF_inst_i_23_n_0),
        .I2(sdata_IOBUF_inst_i_25_n_0),
        .I3(ack_i_2_n_0),
        .I4(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I5(\FSM_onehot_curr_state[6]_i_5_n_0 ),
        .O(sdata_IOBUF_inst_i_19_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    sdata_IOBUF_inst_i_2
       (.I0(sdata_i0),
        .O(sdata_TRI));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    sdata_IOBUF_inst_i_20
       (.I0(counter_cl_reg[8]),
        .I1(counter_cl_reg[6]),
        .I2(counter_cl_reg[7]),
        .O(sdata_IOBUF_inst_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h1)) 
    sdata_IOBUF_inst_i_21
       (.I0(counter_cl_reg[6]),
        .I1(counter_cl_reg[5]),
        .O(sdata_IOBUF_inst_i_21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    sdata_IOBUF_inst_i_22
       (.I0(counter_cl_reg[4]),
        .I1(counter_cl_reg[2]),
        .I2(counter_cl_reg[3]),
        .O(sdata_IOBUF_inst_i_22_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    sdata_IOBUF_inst_i_23
       (.I0(counter_cl_reg[12]),
        .I1(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I2(counter_cl_reg[11]),
        .O(sdata_IOBUF_inst_i_23_n_0));
  LUT6 #(
    .INIT(64'hEAEAEAAAEAAAEAAA)) 
    sdata_IOBUF_inst_i_24
       (.I0(counter_cl_reg[10]),
        .I1(counter_cl_reg[8]),
        .I2(counter_cl_reg[9]),
        .I3(\data[15]_i_8_n_0 ),
        .I4(sdata_IOBUF_inst_i_26_n_0),
        .I5(counter_cl_reg[5]),
        .O(sdata_IOBUF_inst_i_24_n_0));
  LUT6 #(
    .INIT(64'hEEEAAAAAAAAAAAAA)) 
    sdata_IOBUF_inst_i_25
       (.I0(\FSM_onehot_curr_state[6]_i_21_n_0 ),
        .I1(counter_cl_reg[5]),
        .I2(counter_cl_reg[3]),
        .I3(counter_cl_reg[2]),
        .I4(counter_cl_reg[4]),
        .I5(sdata_IOBUF_inst_i_20_n_0),
        .O(sdata_IOBUF_inst_i_25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sdata_IOBUF_inst_i_26
       (.I0(counter_cl_reg[4]),
        .I1(counter_cl_reg[3]),
        .O(sdata_IOBUF_inst_i_26_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF8FFFF)) 
    sdata_IOBUF_inst_i_3
       (.I0(counter_cl_reg[9]),
        .I1(counter_cl_reg[10]),
        .I2(sdata_IOBUF_inst_i_8_n_0),
        .I3(counter_cl_reg[12]),
        .I4(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I5(counter_cl_reg[11]),
        .O(sdata_IOBUF_inst_i_3_n_0));
  LUT6 #(
    .INIT(64'h8088888880888088)) 
    sdata_IOBUF_inst_i_4
       (.I0(sdata_IOBUF_inst_i_9_n_0),
        .I1(\data[15]_i_7_n_0 ),
        .I2(sdata_IOBUF_inst_i_10_n_0),
        .I3(counter_cl_reg[11]),
        .I4(sdata_IOBUF_inst_i_11_n_0),
        .I5(sdata_IOBUF_inst_i_12_n_0),
        .O(sdata_IOBUF_inst_i_4_n_0));
  LUT6 #(
    .INIT(64'h00000002AAAAAAAA)) 
    sdata_IOBUF_inst_i_5
       (.I0(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I1(counter_cl_reg[10]),
        .I2(counter_cl_reg[9]),
        .I3(counter_cl_reg[11]),
        .I4(sdata_IOBUF_inst_i_13_n_0),
        .I5(counter_cl_reg[12]),
        .O(sdata_IOBUF_inst_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFCAFAFFFF)) 
    sdata_IOBUF_inst_i_6
       (.I0(sdata_IOBUF_inst_i_14_n_0),
        .I1(sdata_IOBUF_inst_i_15_n_0),
        .I2(counter_cl_reg[11]),
        .I3(sdata_IOBUF_inst_i_16_n_0),
        .I4(\FSM_onehot_curr_state[6]_i_14_n_0 ),
        .I5(counter_cl_reg[12]),
        .O(sdata_IOBUF_inst_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF40444040)) 
    sdata_IOBUF_inst_i_7
       (.I0(sdata_IOBUF_inst_i_17_n_0),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_curr_state[6]_i_5_n_0 ),
        .I3(sdata_IOBUF_inst_i_18_n_0),
        .I4(\data[15]_i_3_n_0 ),
        .I5(sdata_IOBUF_inst_i_19_n_0),
        .O(sdata_i0));
  LUT6 #(
    .INIT(64'hFF80000000000000)) 
    sdata_IOBUF_inst_i_8
       (.I0(counter_cl_reg[2]),
        .I1(counter_cl_reg[3]),
        .I2(counter_cl_reg[4]),
        .I3(counter_cl_reg[5]),
        .I4(sdata_IOBUF_inst_i_20_n_0),
        .I5(counter_cl_reg[10]),
        .O(sdata_IOBUF_inst_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h7)) 
    sdata_IOBUF_inst_i_9
       (.I0(counter_cl_reg[13]),
        .I1(counter_cl_reg[12]),
        .O(sdata_IOBUF_inst_i_9_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
