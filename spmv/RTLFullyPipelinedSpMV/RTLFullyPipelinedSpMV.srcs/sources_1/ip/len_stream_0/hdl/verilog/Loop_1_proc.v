// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Loop_1_proc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_read,
        rowptr_stream_TDATA,
        rowptr_stream_TVALID,
        rowptr_stream_TREADY,
        rowptr_stream_TKEEP,
        rowptr_stream_TLAST,
        output_stream_V_TDATA,
        output_stream_V_TVALID,
        output_stream_V_TREADY
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state5 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] p_read;
input  [31:0] rowptr_stream_TDATA;
input   rowptr_stream_TVALID;
output   rowptr_stream_TREADY;
input  [3:0] rowptr_stream_TKEEP;
input   rowptr_stream_TLAST;
output  [31:0] output_stream_V_TDATA;
output   output_stream_V_TVALID;
input   output_stream_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] rowptr_stream_V_data_0_data_out;
wire    rowptr_stream_V_data_0_vld_in;
wire    rowptr_stream_V_data_0_vld_out;
wire    rowptr_stream_V_data_0_ack_in;
reg    rowptr_stream_V_data_0_ack_out;
reg   [31:0] rowptr_stream_V_data_0_payload_A;
reg   [31:0] rowptr_stream_V_data_0_payload_B;
reg    rowptr_stream_V_data_0_sel_rd;
reg    rowptr_stream_V_data_0_sel_wr;
wire    rowptr_stream_V_data_0_sel;
wire    rowptr_stream_V_data_0_load_A;
wire    rowptr_stream_V_data_0_load_B;
reg   [1:0] rowptr_stream_V_data_0_state;
wire    rowptr_stream_V_data_0_state_cmp_full;
wire    rowptr_stream_V_last_0_vld_in;
reg    rowptr_stream_V_last_0_ack_out;
reg   [1:0] rowptr_stream_V_last_0_state;
reg   [31:0] output_stream_V_1_data_out;
reg    output_stream_V_1_vld_in;
wire    output_stream_V_1_vld_out;
wire    output_stream_V_1_ack_in;
wire    output_stream_V_1_ack_out;
reg   [31:0] output_stream_V_1_payload_A;
reg   [31:0] output_stream_V_1_payload_B;
reg    output_stream_V_1_sel_rd;
reg    output_stream_V_1_sel_wr;
wire    output_stream_V_1_sel;
wire    output_stream_V_1_load_A;
wire    output_stream_V_1_load_B;
reg   [1:0] output_stream_V_1_state;
wire    output_stream_V_1_state_cmp_full;
reg    rowptr_stream_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg    output_stream_V_TDATA_blk_n;
reg   [0:0] tmp_1_i_reg_132;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] ap_reg_pp0_iter1_tmp_1_i_reg_132;
reg   [31:0] i_i_reg_65;
reg    ap_block_state1;
wire   [0:0] exitcond_i_fu_76_p2;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
wire    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_11001;
wire   [31:0] i_fu_81_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] tmp_1_i_fu_87_p2;
wire   [31:0] tmp_fu_105_p2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg   [31:0] end_val_tmp_data_fu_38;
reg    ap_block_pp0_stage0_01001;
wire    ap_CS_fsm_state5;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 rowptr_stream_V_data_0_sel_rd = 1'b0;
#0 rowptr_stream_V_data_0_sel_wr = 1'b0;
#0 rowptr_stream_V_data_0_state = 2'd0;
#0 rowptr_stream_V_last_0_state = 2'd0;
#0 output_stream_V_1_sel_rd = 1'b0;
#0 output_stream_V_1_sel_wr = 1'b0;
#0 output_stream_V_1_state = 2'd0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((output_stream_V_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        output_stream_V_1_sel_rd <= 1'b0;
    end else begin
        if (((output_stream_V_1_ack_out == 1'b1) & (output_stream_V_1_vld_out == 1'b1))) begin
            output_stream_V_1_sel_rd <= ~output_stream_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        output_stream_V_1_sel_wr <= 1'b0;
    end else begin
        if (((output_stream_V_1_ack_in == 1'b1) & (output_stream_V_1_vld_in == 1'b1))) begin
            output_stream_V_1_sel_wr <= ~output_stream_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        output_stream_V_1_state <= 2'd0;
    end else begin
        if ((((output_stream_V_1_state == 2'd2) & (output_stream_V_1_vld_in == 1'b0)) | ((output_stream_V_1_state == 2'd3) & (output_stream_V_1_vld_in == 1'b0) & (output_stream_V_1_ack_out == 1'b1)))) begin
            output_stream_V_1_state <= 2'd2;
        end else if ((((output_stream_V_1_state == 2'd1) & (output_stream_V_1_ack_out == 1'b0)) | ((output_stream_V_1_state == 2'd3) & (output_stream_V_1_ack_out == 1'b0) & (output_stream_V_1_vld_in == 1'b1)))) begin
            output_stream_V_1_state <= 2'd1;
        end else if (((~((output_stream_V_1_vld_in == 1'b0) & (output_stream_V_1_ack_out == 1'b1)) & ~((output_stream_V_1_ack_out == 1'b0) & (output_stream_V_1_vld_in == 1'b1)) & (output_stream_V_1_state == 2'd3)) | ((output_stream_V_1_state == 2'd1) & (output_stream_V_1_ack_out == 1'b1)) | ((output_stream_V_1_state == 2'd2) & (output_stream_V_1_vld_in == 1'b1)))) begin
            output_stream_V_1_state <= 2'd3;
        end else begin
            output_stream_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        rowptr_stream_V_data_0_sel_rd <= 1'b0;
    end else begin
        if (((rowptr_stream_V_data_0_ack_out == 1'b1) & (rowptr_stream_V_data_0_vld_out == 1'b1))) begin
            rowptr_stream_V_data_0_sel_rd <= ~rowptr_stream_V_data_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        rowptr_stream_V_data_0_sel_wr <= 1'b0;
    end else begin
        if (((rowptr_stream_V_data_0_ack_in == 1'b1) & (rowptr_stream_V_data_0_vld_in == 1'b1))) begin
            rowptr_stream_V_data_0_sel_wr <= ~rowptr_stream_V_data_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        rowptr_stream_V_data_0_state <= 2'd0;
    end else begin
        if ((((rowptr_stream_V_data_0_state == 2'd2) & (rowptr_stream_V_data_0_vld_in == 1'b0)) | ((rowptr_stream_V_data_0_state == 2'd3) & (rowptr_stream_V_data_0_vld_in == 1'b0) & (rowptr_stream_V_data_0_ack_out == 1'b1)))) begin
            rowptr_stream_V_data_0_state <= 2'd2;
        end else if ((((rowptr_stream_V_data_0_state == 2'd1) & (rowptr_stream_V_data_0_ack_out == 1'b0)) | ((rowptr_stream_V_data_0_state == 2'd3) & (rowptr_stream_V_data_0_ack_out == 1'b0) & (rowptr_stream_V_data_0_vld_in == 1'b1)))) begin
            rowptr_stream_V_data_0_state <= 2'd1;
        end else if (((~((rowptr_stream_V_data_0_vld_in == 1'b0) & (rowptr_stream_V_data_0_ack_out == 1'b1)) & ~((rowptr_stream_V_data_0_ack_out == 1'b0) & (rowptr_stream_V_data_0_vld_in == 1'b1)) & (rowptr_stream_V_data_0_state == 2'd3)) | ((rowptr_stream_V_data_0_state == 2'd1) & (rowptr_stream_V_data_0_ack_out == 1'b1)) | ((rowptr_stream_V_data_0_state == 2'd2) & (rowptr_stream_V_data_0_vld_in == 1'b1)))) begin
            rowptr_stream_V_data_0_state <= 2'd3;
        end else begin
            rowptr_stream_V_data_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        rowptr_stream_V_last_0_state <= 2'd0;
    end else begin
        if ((((rowptr_stream_V_last_0_state == 2'd2) & (rowptr_stream_V_last_0_vld_in == 1'b0)) | ((rowptr_stream_V_last_0_state == 2'd3) & (rowptr_stream_V_last_0_vld_in == 1'b0) & (rowptr_stream_V_last_0_ack_out == 1'b1)))) begin
            rowptr_stream_V_last_0_state <= 2'd2;
        end else if ((((rowptr_stream_V_last_0_state == 2'd1) & (rowptr_stream_V_last_0_ack_out == 1'b0)) | ((rowptr_stream_V_last_0_state == 2'd3) & (rowptr_stream_V_last_0_ack_out == 1'b0) & (rowptr_stream_V_last_0_vld_in == 1'b1)))) begin
            rowptr_stream_V_last_0_state <= 2'd1;
        end else if (((~((rowptr_stream_V_last_0_vld_in == 1'b0) & (rowptr_stream_V_last_0_ack_out == 1'b1)) & ~((rowptr_stream_V_last_0_ack_out == 1'b0) & (rowptr_stream_V_last_0_vld_in == 1'b1)) & (rowptr_stream_V_last_0_state == 2'd3)) | ((rowptr_stream_V_last_0_state == 2'd1) & (rowptr_stream_V_last_0_ack_out == 1'b1)) | ((rowptr_stream_V_last_0_state == 2'd2) & (rowptr_stream_V_last_0_vld_in == 1'b1)))) begin
            rowptr_stream_V_last_0_state <= 2'd3;
        end else begin
            rowptr_stream_V_last_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_fu_76_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_i_reg_65 <= i_fu_81_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_i_reg_65 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_reg_pp0_iter1_tmp_1_i_reg_132 <= tmp_1_i_reg_132;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        end_val_tmp_data_fu_38 <= rowptr_stream_V_data_0_data_out;
    end
end

always @ (posedge ap_clk) begin
    if ((output_stream_V_1_load_A == 1'b1)) begin
        output_stream_V_1_payload_A <= tmp_fu_105_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((output_stream_V_1_load_B == 1'b1)) begin
        output_stream_V_1_payload_B <= tmp_fu_105_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((rowptr_stream_V_data_0_load_A == 1'b1)) begin
        rowptr_stream_V_data_0_payload_A <= rowptr_stream_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((rowptr_stream_V_data_0_load_B == 1'b1)) begin
        rowptr_stream_V_data_0_payload_B <= rowptr_stream_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_fu_76_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_1_i_reg_132 <= tmp_1_i_fu_87_p2;
    end
end

always @ (*) begin
    if ((exitcond_i_fu_76_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((output_stream_V_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((output_stream_V_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((output_stream_V_1_sel == 1'b1)) begin
        output_stream_V_1_data_out = output_stream_V_1_payload_B;
    end else begin
        output_stream_V_1_data_out = output_stream_V_1_payload_A;
    end
end

always @ (*) begin
    if (((tmp_1_i_reg_132 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_stream_V_1_vld_in = 1'b1;
    end else begin
        output_stream_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_reg_pp0_iter1_tmp_1_i_reg_132 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((tmp_1_i_reg_132 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        output_stream_V_TDATA_blk_n = output_stream_V_1_state[1'd1];
    end else begin
        output_stream_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rowptr_stream_TDATA_blk_n = rowptr_stream_V_data_0_state[1'd0];
    end else begin
        rowptr_stream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rowptr_stream_V_data_0_ack_out = 1'b1;
    end else begin
        rowptr_stream_V_data_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((rowptr_stream_V_data_0_sel == 1'b1)) begin
        rowptr_stream_V_data_0_data_out = rowptr_stream_V_data_0_payload_B;
    end else begin
        rowptr_stream_V_data_0_data_out = rowptr_stream_V_data_0_payload_A;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rowptr_stream_V_last_0_ack_out = 1'b1;
    end else begin
        rowptr_stream_V_last_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((exitcond_i_fu_76_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((exitcond_i_fu_76_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((output_stream_V_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((rowptr_stream_V_data_0_vld_out == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((1'b1 == ap_block_state4_io) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((rowptr_stream_V_data_0_vld_out == 1'b0) | (1'b1 == ap_block_state3_io))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((1'b1 == ap_block_state4_io) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((rowptr_stream_V_data_0_vld_out == 1'b0) | (1'b1 == ap_block_state3_io))));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = ((tmp_1_i_reg_132 == 1'd0) & (output_stream_V_1_ack_in == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (rowptr_stream_V_data_0_vld_out == 1'b0);
end

always @ (*) begin
    ap_block_state4_io = ((ap_reg_pp0_iter1_tmp_1_i_reg_132 == 1'd0) & (output_stream_V_1_ack_in == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign exitcond_i_fu_76_p2 = ((i_i_reg_65 == p_read) ? 1'b1 : 1'b0);

assign i_fu_81_p2 = (i_i_reg_65 + 32'd1);

assign output_stream_V_1_ack_in = output_stream_V_1_state[1'd1];

assign output_stream_V_1_ack_out = output_stream_V_TREADY;

assign output_stream_V_1_load_A = (output_stream_V_1_state_cmp_full & ~output_stream_V_1_sel_wr);

assign output_stream_V_1_load_B = (output_stream_V_1_state_cmp_full & output_stream_V_1_sel_wr);

assign output_stream_V_1_sel = output_stream_V_1_sel_rd;

assign output_stream_V_1_state_cmp_full = ((output_stream_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign output_stream_V_1_vld_out = output_stream_V_1_state[1'd0];

assign output_stream_V_TDATA = output_stream_V_1_data_out;

assign output_stream_V_TVALID = output_stream_V_1_state[1'd0];

assign rowptr_stream_TREADY = rowptr_stream_V_last_0_state[1'd1];

assign rowptr_stream_V_data_0_ack_in = rowptr_stream_V_data_0_state[1'd1];

assign rowptr_stream_V_data_0_load_A = (rowptr_stream_V_data_0_state_cmp_full & ~rowptr_stream_V_data_0_sel_wr);

assign rowptr_stream_V_data_0_load_B = (rowptr_stream_V_data_0_state_cmp_full & rowptr_stream_V_data_0_sel_wr);

assign rowptr_stream_V_data_0_sel = rowptr_stream_V_data_0_sel_rd;

assign rowptr_stream_V_data_0_state_cmp_full = ((rowptr_stream_V_data_0_state != 2'd1) ? 1'b1 : 1'b0);

assign rowptr_stream_V_data_0_vld_in = rowptr_stream_TVALID;

assign rowptr_stream_V_data_0_vld_out = rowptr_stream_V_data_0_state[1'd0];

assign rowptr_stream_V_last_0_vld_in = rowptr_stream_TVALID;

assign tmp_1_i_fu_87_p2 = ((i_i_reg_65 == 32'd0) ? 1'b1 : 1'b0);

assign tmp_fu_105_p2 = (rowptr_stream_V_data_0_data_out - end_val_tmp_data_fu_38);

endmodule //Loop_1_proc
