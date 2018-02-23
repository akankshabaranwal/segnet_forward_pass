`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2018 12:28:20
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(
input clk,
output reg done_conv
    );

//Input bram variables    
reg Input_addr_en;
reg Input_addr_reset;
reg Input_update_enable;
wire [15:0] Input_read_data;
reg [15:0] Input_write_data;

reg Input_BRAMA_en;
reg Input_BRAMB_en;
reg [1:0] Input_BRAM_we;

//wire [17:0] Input_write_addr;
//wire [17:0] Input_read_addr;
reg [17:0] Input_write_addr_reg;
reg [17:0] Input_read_addr_reg;

reg [17:0] Input_curr_row;
reg [17:0] Input_curr_col;
reg [17:0] Input_max_row;
reg [17:0] Input_max_col;

//Output bram variables
reg Output_addr_en;
reg Output_addr_reset;
reg Output_update_enable;
wire [15:0] Output_read_data;
reg [15:0] Output_write_data;

reg Output_BRAMA_en;
reg Output_BRAMB_en;
reg [1:0] Output_BRAM_we;

//wire [17:0] Output_write_addr;
//wire [17:0] Output_read_addr;
reg [17:0] Output_write_addr_reg;
reg [17:0] Output_read_addr_reg;

reg [17:0] Output_curr_row;
reg [17:0] Output_curr_col;
reg [17:0] Output_max_row;
reg [17:0] Output_max_col;

reg [17:0] curr_state;

wire [15:0] lbram1_read_data;
reg lbram1A_en;
reg [1:0] lbram1_we;
wire [15:0] lbram2_read_data;
reg lbram2A_en;
reg [1:0] lbram2_we;
wire [15:0] lbram3_read_data;
reg lbram3A_en;
reg [1:0] lbram3_we;
reg [15:0] lbram1_write_data;
reg lbram1B_en;
reg [15:0] lbram2_write_data;
reg lbram2B_en;
reg [15:0] lbram3_write_data;
reg lbram3B_en;

reg [15:0] wbuffer [0:2][0:2];

reg [8:0] lbram1_read_addr;
reg [8:0] lbram2_read_addr;
reg [8:0] lbram3_read_addr;

reg [8:0] lbram1_write_addr;
reg [8:0] lbram2_write_addr;
reg [8:0] lbram3_write_addr;

reg [17:0] start_conv_addr;

reg filter_update;

reg [8:0] fbram1_write_addr;
reg [15:0] fbram1_write_data;
reg fbramA1_en;
reg [1:0] fbram1_we;
reg [8:0] fbram1_read_addr;
wire [15:0] fbram1_read_data;
reg fbramB1_en;

reg [8:0] fbram2_write_addr;
reg [15:0] fbram2_write_data;
reg fbramA2_en;
reg [1:0] fbram2_we;
reg [8:0] fbram2_read_addr;
wire [15:0] fbram2_read_data;
reg fbramB2_en;

reg [8:0] fbram3_write_addr;
reg [15:0] fbram3_write_data;
reg fbramA3_en;
reg [1:0] fbram3_we;
reg [8:0] fbram3_read_addr;
wire [15:0] fbram3_read_data;
reg fbramB3_en;

reg [8:0] fbram4_write_addr;
reg [15:0] fbram4_write_data;
reg fbramA4_en;
reg [1:0] fbram4_we;
reg [8:0] fbram4_read_addr;
wire [15:0] fbram4_read_data;
reg fbramB4_en;

reg [8:0] fbram5_write_addr;
reg [15:0] fbram5_write_data;
reg fbramA5_en;
reg [1:0] fbram5_we;
reg [8:0] fbram5_read_addr;
wire [15:0] fbram5_read_data;
reg fbramB5_en;

reg [8:0] fbram6_write_addr;
reg [15:0] fbram6_write_data;
reg fbramA6_en;
reg [1:0] fbram6_we;
reg [8:0] fbram6_read_addr;
wire [15:0] fbram6_read_data;
reg fbramB6_en;

reg [8:0] fbram7_write_addr;
reg [15:0] fbram7_write_data;
reg fbramA7_en;
reg [1:0] fbram7_we;
reg [8:0] fbram7_read_addr;
wire [15:0] fbram7_read_data;
reg fbramB7_en;

reg [8:0] fbram8_write_addr;
reg [15:0] fbram8_write_data;
reg fbramA8_en;
reg [1:0] fbram8_we;
reg [8:0] fbram8_read_addr;
wire [15:0] fbram8_read_data;
reg fbramB8_en;

reg [8:0] fbram9_write_addr;
reg [15:0] fbram9_write_data;
reg fbramA9_en;
reg [1:0] fbram9_we;
reg [8:0] fbram9_read_addr;
wire [15:0] fbram9_read_data;
reg fbramB9_en;
reg filter_update_en;

reg [15:0] filter [0:2][0:2];
reg enable_conv;

//read 1 filter from ddr to filter_bram

//read value from BRAM to LUT

//write in BRAM using portA and read from BRAM using PORTB
wire [15:0] mul1_res;
reg mul1_ready;
wire mul1_valid;
reg [15:0] mulA1;
reg [15:0] mulB1;
wire mulA1_ready;
reg mulA1_valid;
wire mulB1_ready;
reg mulB1_valid;

wire [15:0] mul2_res;
reg mul2_ready;
wire mul2_valid;
reg [15:0] mulA2;
reg [15:0] mulB2;
wire mulA2_ready;
reg mulA2_valid;
wire mulB2_ready;
reg mulB2_valid;

wire [15:0] mul3_res;
reg mul3_ready;
wire mul3_valid;
reg [15:0] mulA3;
reg [15:0] mulB3;
wire mulA3_ready;
reg mulA3_valid;
wire mulB3_ready;
reg mulB3_valid;

wire [15:0] mul4_res;
reg mul4_ready;
wire mul4_valid;
reg [15:0] mulA4;
reg [15:0] mulB4;
wire mulA4_ready;
reg mulA4_valid;
wire mulB4_ready;
reg mulB4_valid;

wire [15:0] mul5_res;
reg mul5_ready;
wire mul5_valid;
reg [15:0] mulA5;
reg [15:0] mulB5;
wire mulA5_ready;
reg mulA5_valid;
wire mulB5_ready;
reg mulB5_valid;

wire [15:0] mul6_res;
reg mul6_ready;
wire mul6_valid;
reg [15:0] mulA6;
reg [15:0] mulB6;
wire mulA6_ready;
reg mulA6_valid;
wire mulB6_ready;
reg mulB6_valid;

wire [15:0] mul7_res;
reg mul7_ready;
wire mul7_valid;
reg [15:0] mulA7;
reg [15:0] mulB7;
wire mulA7_ready;
reg mulA7_valid;
wire mulB7_ready;
reg mulB7_valid;

wire [15:0] mul8_res;
reg mul8_ready;
wire mul8_valid;
reg [15:0] mulA8;
reg [15:0] mulB8;
wire mulA8_ready;
reg mulA8_valid;
wire mulB8_ready;
reg mulB8_valid;

wire [15:0] mul9_res;
reg mul9_ready;
wire mul9_valid;
reg [15:0] mulA9;
reg [15:0] mulB9;
wire mulA9_ready;
reg mulA9_valid;
wire mulB9_ready;
reg mulB9_valid;

wire [15:0] add1_res;
reg add1_ready;
wire add1_valid;
reg [15:0] addA1;
reg [15:0] addB1;
wire addA1_ready;
reg addA1_valid;
wire addB1_ready;
reg addB1_valid;

wire [15:0] add2_res;
reg add2_ready;
wire add2_valid;
reg [15:0] addA2;
reg [15:0] addB2;
wire addA2_ready;
reg addA2_valid;
wire addB2_ready;
reg addB2_valid;

wire [15:0] add3_res;
reg add3_ready;
wire add3_valid;
reg [15:0] addA3;
reg [15:0] addB3;
wire addA3_ready;
reg addA3_valid;
wire addB3_ready;
reg addB3_valid;

wire [15:0] add4_res;
reg add4_ready;
wire add4_valid;
reg [15:0] addA4;
reg [15:0] addB4;
wire addA4_ready;
reg addA4_valid;
wire addB4_ready;
reg addB4_valid;

wire [15:0] add5_res;
reg add5_ready;
wire add5_valid;
reg [15:0] addA5;
reg [15:0] addB5;
wire addA5_ready;
reg addA5_valid;
wire addB5_ready;
reg addB5_valid;

wire [15:0] add6_res;
reg add6_ready;
wire add6_valid;
reg [15:0] addA6;
reg [15:0] addB6;
wire addA6_ready;
reg addA6_valid;
wire addB6_ready;
reg addB6_valid;

wire [15:0] add7_res;
reg add7_ready;
wire add7_valid;
reg [15:0] addA7;
reg [15:0] addB7;
wire addA7_ready;
reg addA7_valid;
wire addB7_ready;
reg addB7_valid;

wire [15:0] add8_res;
reg add8_ready;
wire add8_valid;
reg [15:0] addA8;
reg [15:0] addB8;
wire addA8_ready;
reg addA8_valid;
wire addB8_ready;
reg addB8_valid;


wire [15:0] add9_res;
reg add9_ready;
wire add9_valid;
reg [15:0] addA9;
reg [15:0] addB9;
wire addA9_ready;
reg addA9_valid;
wire addB9_ready;
reg addB9_valid;


wire [15:0] add10_res;
reg add10_ready;
wire add10_valid;
reg [15:0] addA10;
reg [15:0] addB10;
wire addA10_ready;
reg addA10_valid;
wire addB10_ready;
reg addB10_valid;


wire [15:0] add11_res;
reg add11_ready;
wire add11_valid;
reg [15:0] addA11;
reg [15:0] addB11;
wire addA11_ready;
reg addA11_valid;
wire addB11_ready;
reg addB11_valid;


wire [15:0] add12_res;
reg add12_ready;
wire add12_valid;
reg [15:0] addA12;
reg [15:0] addB12;
wire addA12_ready;
reg addA12_valid;
wire addB12_ready;
reg addB12_valid;




reg adder_l1_en;
reg adder_l2_en;
reg adder_l3_en;
reg adder_l4_en;

reg write_output;


float_multiply multiply_1(
    .M_AXIS_RESULT_tdata(mul1_res),
    .M_AXIS_RESULT_tready(mul1_ready),
    .M_AXIS_RESULT_tvalid(mul1_valid),
    .S_AXIS_A_tdata(mulA1),
    .S_AXIS_A_tready(mulA1_ready),
    .S_AXIS_A_tvalid(mulA1_valid),
    .S_AXIS_B_tdata(mulB1),
    .S_AXIS_B_tready(mulB1_ready),
    .S_AXIS_B_tvalid(mulB1_valid),
    .aclk(clk));

float_multiply multiply_2(
    .M_AXIS_RESULT_tdata(mul2_res),
    .M_AXIS_RESULT_tready(mul2_ready),
    .M_AXIS_RESULT_tvalid(mul2_valid),
    .S_AXIS_A_tdata(mulA2),
    .S_AXIS_A_tready(mulA2_ready),
    .S_AXIS_A_tvalid(mulA2_valid),
    .S_AXIS_B_tdata(mulB2),
    .S_AXIS_B_tready(mulB2_ready),
    .S_AXIS_B_tvalid(mulB2_valid),
    .aclk(clk));

float_multiply multiply_3(
    .M_AXIS_RESULT_tdata(mul3_res),
    .M_AXIS_RESULT_tready(mul3_ready),
    .M_AXIS_RESULT_tvalid(mul3_valid),
    .S_AXIS_A_tdata(mulA3),
    .S_AXIS_A_tready(mulA3_ready),
    .S_AXIS_A_tvalid(mulA3_valid),
    .S_AXIS_B_tdata(mulB3),
    .S_AXIS_B_tready(mulB3_ready),
    .S_AXIS_B_tvalid(mulB3_valid),
    .aclk(clk));

float_multiply multiply_4(
    .M_AXIS_RESULT_tdata(mul4_res),
    .M_AXIS_RESULT_tready(mul4_ready),
    .M_AXIS_RESULT_tvalid(mul4_valid),
    .S_AXIS_A_tdata(mulA4),
    .S_AXIS_A_tready(mulA4_ready),
    .S_AXIS_A_tvalid(mulA4_valid),
    .S_AXIS_B_tdata(mulB4),
    .S_AXIS_B_tready(mulB4_ready),
    .S_AXIS_B_tvalid(mulB4_valid),
    .aclk(clk));

float_multiply multiply_5(
    .M_AXIS_RESULT_tdata(mul5_res),
    .M_AXIS_RESULT_tready(mul5_ready),
    .M_AXIS_RESULT_tvalid(mul5_valid),
    .S_AXIS_A_tdata(mulA5),
    .S_AXIS_A_tready(mulA5_ready),
    .S_AXIS_A_tvalid(mulA5_valid),
    .S_AXIS_B_tdata(mulB5),
    .S_AXIS_B_tready(mulB5_ready),
    .S_AXIS_B_tvalid(mulB5_valid),
    .aclk(clk));

float_multiply multiply_6(
    .M_AXIS_RESULT_tdata(mul6_res),
    .M_AXIS_RESULT_tready(mul6_ready),
    .M_AXIS_RESULT_tvalid(mul6_valid),
    .S_AXIS_A_tdata(mulA6),
    .S_AXIS_A_tready(mulA6_ready),
    .S_AXIS_A_tvalid(mulA6_valid),
    .S_AXIS_B_tdata(mulB6),
    .S_AXIS_B_tready(mulB6_ready),
    .S_AXIS_B_tvalid(mulB6_valid),
    .aclk(clk));

float_multiply multiply_7(
    .M_AXIS_RESULT_tdata(mul7_res),
    .M_AXIS_RESULT_tready(mul7_ready),
    .M_AXIS_RESULT_tvalid(mul7_valid),
    .S_AXIS_A_tdata(mulA7),
    .S_AXIS_A_tready(mulA7_ready),
    .S_AXIS_A_tvalid(mulA7_valid),
    .S_AXIS_B_tdata(mulB7),
    .S_AXIS_B_tready(mulB7_ready),
    .S_AXIS_B_tvalid(mulB7_valid),
    .aclk(clk));

float_multiply multiply_8(
    .M_AXIS_RESULT_tdata(mul8_res),
    .M_AXIS_RESULT_tready(mul8_ready),
    .M_AXIS_RESULT_tvalid(mul8_valid),
    .S_AXIS_A_tdata(mulA8),
    .S_AXIS_A_tready(mulA8_ready),
    .S_AXIS_A_tvalid(mulA8_valid),
    .S_AXIS_B_tdata(mulB8),
    .S_AXIS_B_tready(mulB8_ready),
    .S_AXIS_B_tvalid(mulB8_valid),
    .aclk(clk));
    
float_multiply multiply_9(
        .M_AXIS_RESULT_tdata(mul9_res),
        .M_AXIS_RESULT_tready(mul9_ready),
        .M_AXIS_RESULT_tvalid(mul9_valid),
        .S_AXIS_A_tdata(mulA9),
        .S_AXIS_A_tready(mulA9_ready),
        .S_AXIS_A_tvalid(mulA9_valid),
        .S_AXIS_B_tdata(mulB9),
        .S_AXIS_B_tready(mulB9_ready),
        .S_AXIS_B_tvalid(mulB9_valid),
        .aclk(clk));

float_adder add_1(
    .M_AXIS_RESULT_tdata(add1_res),
    .M_AXIS_RESULT_tready(add1_ready),
    .M_AXIS_RESULT_tvalid(add1_valid),
    .S_AXIS_A_tdata(addA1),
    .S_AXIS_A_tready(addA1_ready),
    .S_AXIS_A_tvalid(addA1_valid),
    .S_AXIS_B_tdata(addB1),
    .S_AXIS_B_tready(addB1_ready),
    .S_AXIS_B_tvalid(addB1_valid),
    .aclk(clk));    

float_adder add_2(
    .M_AXIS_RESULT_tdata(add2_res),
    .M_AXIS_RESULT_tready(add2_ready),
    .M_AXIS_RESULT_tvalid(add2_valid),
    .S_AXIS_A_tdata(addA2),
    .S_AXIS_A_tready(addA2_ready),
    .S_AXIS_A_tvalid(addA2_valid),
    .S_AXIS_B_tdata(addB2),
    .S_AXIS_B_tready(addB2_ready),
    .S_AXIS_B_tvalid(addB2_valid),
    .aclk(clk));    


float_adder add_3(
    .M_AXIS_RESULT_tdata(add3_res),
    .M_AXIS_RESULT_tready(add3_ready),
    .M_AXIS_RESULT_tvalid(add3_valid),
    .S_AXIS_A_tdata(addA3),
    .S_AXIS_A_tready(addA3_ready),
    .S_AXIS_A_tvalid(addA3_valid),
    .S_AXIS_B_tdata(addB3),
    .S_AXIS_B_tready(addB3_ready),
    .S_AXIS_B_tvalid(addB3_valid),
    .aclk(clk));    

float_adder add_4(
    .M_AXIS_RESULT_tdata(add4_res),
    .M_AXIS_RESULT_tready(add4_ready),
    .M_AXIS_RESULT_tvalid(add4_valid),
    .S_AXIS_A_tdata(addA4),
    .S_AXIS_A_tready(addA4_ready),
    .S_AXIS_A_tvalid(addA4_valid),
    .S_AXIS_B_tdata(addB4),
    .S_AXIS_B_tready(addB4_ready),
    .S_AXIS_B_tvalid(addB4_valid),
    .aclk(clk));
    
float_adder add_5(
        .M_AXIS_RESULT_tdata(add5_res),
        .M_AXIS_RESULT_tready(add5_ready),
        .M_AXIS_RESULT_tvalid(add5_valid),
        .S_AXIS_A_tdata(addA5),
        .S_AXIS_A_tready(addA5_ready),
        .S_AXIS_A_tvalid(addA5_valid),
        .S_AXIS_B_tdata(addB5),
        .S_AXIS_B_tready(addB5_ready),
        .S_AXIS_B_tvalid(addB5_valid),
        .aclk(clk));

float_adder add_6(
    .M_AXIS_RESULT_tdata(add6_res),
    .M_AXIS_RESULT_tready(add6_ready),
    .M_AXIS_RESULT_tvalid(add6_valid),
    .S_AXIS_A_tdata(addA6),
    .S_AXIS_A_tready(addA6_ready),
    .S_AXIS_A_tvalid(addA6_valid),
    .S_AXIS_B_tdata(addB6),
    .S_AXIS_B_tready(addB6_ready),
    .S_AXIS_B_tvalid(addB6_valid),
    .aclk(clk));

float_adder add_7(
    .M_AXIS_RESULT_tdata(add7_res),
    .M_AXIS_RESULT_tready(add7_ready),
    .M_AXIS_RESULT_tvalid(add7_valid),
    .S_AXIS_A_tdata(addA7),
    .S_AXIS_A_tready(addA7_ready),
    .S_AXIS_A_tvalid(addA7_valid),
    .S_AXIS_B_tdata(addB7),
    .S_AXIS_B_tready(addB7_ready),
    .S_AXIS_B_tvalid(addB7_valid),
    .aclk(clk));
    
float_adder add_8(
        .M_AXIS_RESULT_tdata(add8_res),
        .M_AXIS_RESULT_tready(add8_ready),
        .M_AXIS_RESULT_tvalid(add8_valid),
        .S_AXIS_A_tdata(addA8),
        .S_AXIS_A_tready(addA8_ready),
        .S_AXIS_A_tvalid(addA8_valid),
        .S_AXIS_B_tdata(addB8),
        .S_AXIS_B_tready(addB8_ready),
        .S_AXIS_B_tvalid(addB8_valid),
        .aclk(clk));

float_adder add_9(
        .M_AXIS_RESULT_tdata(add9_res),
        .M_AXIS_RESULT_tready(add9_ready),
        .M_AXIS_RESULT_tvalid(add9_valid),
        .S_AXIS_A_tdata(addA9),
        .S_AXIS_A_tready(addA9_ready),
        .S_AXIS_A_tvalid(addA9_valid),
        .S_AXIS_B_tdata(addB9),
        .S_AXIS_B_tready(addB9_ready),
        .S_AXIS_B_tvalid(addB9_valid),
        .aclk(clk));

float_adder add_10(
        .M_AXIS_RESULT_tdata(add10_res),
        .M_AXIS_RESULT_tready(add10_ready),
        .M_AXIS_RESULT_tvalid(add10_valid),
        .S_AXIS_A_tdata(addA10),
        .S_AXIS_A_tready(addA10_ready),
        .S_AXIS_A_tvalid(addA10_valid),
        .S_AXIS_B_tdata(addB10),
        .S_AXIS_B_tready(addB10_ready),
        .S_AXIS_B_tvalid(addB10_valid),
        .aclk(clk));

float_adder add_11(
        .M_AXIS_RESULT_tdata(add11_res),
        .M_AXIS_RESULT_tready(add11_ready),
        .M_AXIS_RESULT_tvalid(add11_valid),
        .S_AXIS_A_tdata(addA11),
        .S_AXIS_A_tready(addA11_ready),
        .S_AXIS_A_tvalid(addA11_valid),
        .S_AXIS_B_tdata(addB11),
        .S_AXIS_B_tready(addB11_ready),
        .S_AXIS_B_tvalid(addB11_valid),
        .aclk(clk));

float_adder add_12(
        .M_AXIS_RESULT_tdata(add12_res),
        .M_AXIS_RESULT_tready(add12_ready),
        .M_AXIS_RESULT_tvalid(add12_valid),
        .S_AXIS_A_tdata(addA12),
        .S_AXIS_A_tready(addA12_ready),
        .S_AXIS_A_tvalid(addA12_valid),
        .S_AXIS_B_tdata(addB12),
        .S_AXIS_B_tready(addB12_ready),
        .S_AXIS_B_tvalid(addB12_valid),
        .aclk(clk));
                       
 //filter BRAM module
 filter_bram filter_bram(
    .BRAM_PORTA_1_addr(fbram1_write_addr),
    .BRAM_PORTA_1_clk(clk),
    .BRAM_PORTA_1_din(fbram1_write_data),
    .BRAM_PORTA_1_en(fbramA1_en),
    .BRAM_PORTA_1_we(fbram1_we),
    .BRAM_PORTB_1_addr(fbram1_read_addr),
    .BRAM_PORTB_1_clk(clk),
    .BRAM_PORTB_1_dout(fbram1_read_data),
    .BRAM_PORTB_1_en(fbramB1_en),
    
    .BRAM_PORTA_2_addr(fbram2_write_addr),
    .BRAM_PORTA_2_clk(clk),
    .BRAM_PORTA_2_din(fbram2_write_data),
    .BRAM_PORTA_2_en(fbramA2_en),
    .BRAM_PORTA_2_we(fbram2_we),
    .BRAM_PORTB_2_addr(fbram2_read_addr),
    .BRAM_PORTB_2_clk(clk),
    .BRAM_PORTB_2_dout(fbram2_read_data),
    .BRAM_PORTB_2_en(fbramB2_en),
    
    .BRAM_PORTA_3_addr(fbram3_write_addr),
    .BRAM_PORTA_3_clk(clk),
    .BRAM_PORTA_3_din(fbram3_write_data),
    .BRAM_PORTA_3_en(fbramA3_en),
    .BRAM_PORTA_3_we(fbram3_we),
    .BRAM_PORTB_3_addr(fbram3_read_addr),
    .BRAM_PORTB_3_clk(clk),
    .BRAM_PORTB_3_dout(fbram3_read_data),
    .BRAM_PORTB_3_en(fbramB3_en),
    
    .BRAM_PORTA_4_addr(fbram4_write_addr),
    .BRAM_PORTA_4_clk(clk),
    .BRAM_PORTA_4_din(fbram4_write_data),
    .BRAM_PORTA_4_en(fbramA4_en),
    .BRAM_PORTA_4_we(fbram4_we),
    .BRAM_PORTB_4_addr(fbram4_read_addr),
    .BRAM_PORTB_4_clk(clk),
    .BRAM_PORTB_4_dout(fbram4_read_data),
    .BRAM_PORTB_4_en(fbramB4_en),
    
    .BRAM_PORTA_5_addr(fbram5_write_addr),
    .BRAM_PORTA_5_clk(clk),
    .BRAM_PORTA_5_din(fbram5_write_data),
    .BRAM_PORTA_5_en(fbramA5_en),
    .BRAM_PORTA_5_we(fbram5_we),
    .BRAM_PORTB_5_addr(fbram5_read_addr),
    .BRAM_PORTB_5_clk(clk),
    .BRAM_PORTB_5_dout(fbram5_read_data),
    .BRAM_PORTB_5_en(fbramB5_en),
    
    .BRAM_PORTA_6_addr(fbram6_write_addr),
    .BRAM_PORTA_6_clk(clk),
    .BRAM_PORTA_6_din(fbram6_write_data),
    .BRAM_PORTA_6_en(fbramA6_en),
    .BRAM_PORTA_6_we(fbram6_we),
    .BRAM_PORTB_6_addr(fbram6_read_addr),
    .BRAM_PORTB_6_clk(clk),
    .BRAM_PORTB_6_dout(fbram6_read_data),
    .BRAM_PORTB_6_en(fbramB6_en),
    
    .BRAM_PORTA_7_addr(fbram7_write_addr),
    .BRAM_PORTA_7_clk(clk),
    .BRAM_PORTA_7_din(fbram7_write_data),
    .BRAM_PORTA_7_en(fbramA7_en),
    .BRAM_PORTA_7_we(fbram7_we),
    .BRAM_PORTB_7_addr(fbram7_read_addr),
    .BRAM_PORTB_7_clk(clk),
    .BRAM_PORTB_7_dout(fbram7_read_data),
    .BRAM_PORTB_7_en(fbramB7_en),
    
    .BRAM_PORTA_8_addr(fbram8_write_addr),
    .BRAM_PORTA_8_clk(clk),
    .BRAM_PORTA_8_din(fbram8_write_data),
    .BRAM_PORTA_8_en(fbramA8_en),
    .BRAM_PORTA_8_we(fbram8_we),
    .BRAM_PORTB_8_addr(fbram8_read_addr),
    .BRAM_PORTB_8_clk(clk),
    .BRAM_PORTB_8_dout(fbram8_read_data),
    .BRAM_PORTB_8_en(fbramB8_en),
    
    .BRAM_PORTA_addr(fbram9_write_addr),
    .BRAM_PORTA_clk(clk),
    .BRAM_PORTA_din(fbram9_write_data),
    .BRAM_PORTA_en(fbramA9_en),
    .BRAM_PORTA_we(fbram9_we),
    .BRAM_PORTB_addr(fbram9_read_addr),
    .BRAM_PORTB_clk(clk),
    .BRAM_PORTB_dout(fbram9_read_data),
    .BRAM_PORTB_en(fbramB9_en)
 );

 input_bram input_bram(
    .BRAM_PORTA_addr(Input_write_addr_reg),
    .BRAM_PORTA_clk(clk),
    .BRAM_PORTA_en(Input_BRAMA_en),        
    .BRAM_PORTA_we(Input_BRAM_we),
    .BRAM_PORTB_addr(Input_read_addr_reg),
    .BRAM_PORTB_clk(clk),
    .BRAM_PORTA_din(Input_write_data),
    .BRAM_PORTB_dout(Input_read_data),
    .BRAM_PORTB_en(Input_BRAMB_en));
        
 output_bram output_bram(
    .BRAM_PORTA_addr(Output_write_addr_reg),
    .BRAM_PORTA_clk(clk),
    .BRAM_PORTA_en(Output_BRAMA_en),        
    .BRAM_PORTA_we(Output_BRAM_we),
    .BRAM_PORTB_addr(Output_read_addr_reg),
    .BRAM_PORTB_clk(clk),
    .BRAM_PORTA_din(Output_write_data),
    .BRAM_PORTB_dout(Output_read_data),
    .BRAM_PORTB_en(Output_BRAMB_en));
               
line_bram line_bram(
    .BRAM_PORTA1_addr(lbram1_write_addr),
    .BRAM_PORTA1_clk(clk),
    .BRAM_PORTA1_din(lbram1_write_data),
    .BRAM_PORTA1_en(lbram1A_en),
    .BRAM_PORTA1_we(lbram1_we),
    .BRAM_PORTA2_addr(lbram2_write_addr),
    .BRAM_PORTA2_clk(clk),
    .BRAM_PORTA2_din(lbram2_write_data),
    .BRAM_PORTA2_en(lbram2A_en),
    .BRAM_PORTA2_we(lbram2_we),        
    .BRAM_PORTA_addr(lbram3_write_addr),
    .BRAM_PORTA_clk(clk),
    .BRAM_PORTA_din(lbram3_write_data),
    .BRAM_PORTA_en(lbram3A_en),
    .BRAM_PORTA_we(lbram3_we),
    .BRAM_PORTB1_addr(lbram1_read_addr),
    .BRAM_PORTB1_clk(clk),
    .BRAM_PORTB1_dout(lbram1_read_data),
    .BRAM_PORTB1_en(lbram1B_en),
    .BRAM_PORTB2_addr(lbram2_read_addr),
    .BRAM_PORTB2_clk(clk),
    .BRAM_PORTB2_dout(lbram2_read_data),
    .BRAM_PORTB2_en(lbram2B_en),        
    .BRAM_PORTB_addr(lbram3_read_addr),
    .BRAM_PORTB_clk(clk),
    .BRAM_PORTB_dout(lbram3_read_data),
    .BRAM_PORTB_en(lbram3B_en)
);

initial 
    begin        
        curr_state<=18'b0;
       
        //regular input/output variable initialisation        
        Input_curr_row<=18'b0;
        Input_curr_col<=18'b0;
        Input_max_row<=18'd5;
        Input_max_col<=18'd5;
        
        Output_curr_row<=18'b0;
        Output_curr_col<=18'b0;
        Output_max_row<=18'd5;
        Output_max_col<=18'd5;
        
        Input_addr_en<=1'b0;
        Input_addr_reset<=1'b1;
        Input_update_enable<=1'b0;
        
        Output_addr_en<=1'b0;
        Output_addr_reset<=1'b1;
        Output_update_enable<=1'b0;
        
        start_conv_addr<=18'd18;
        
        //input BRAM variable initialisation
        Input_write_addr_reg<=18'b0;
        Input_BRAMA_en<=1'b0;
        Input_BRAMB_en<=1'b1;
        Input_BRAM_we<=2'd0;
        Input_read_addr_reg<=18'd0;
        
        //output BRAM variable initialisation
        Output_write_addr_reg<=18'b0;
        Output_BRAMA_en<=1'b0;
        Output_BRAMB_en<=1'b1;
        Output_BRAM_we<=2'd0;
        Output_read_addr_reg<=18'd0;
        
        //lbuffer initialisation
        lbram1_read_addr<=9'd0;
        lbram2_read_addr<=9'd0;
        lbram3_read_addr<=9'd0;
        lbram1_write_addr<=9'd0;
        lbram2_write_addr<=9'd0;
        lbram3_write_addr<=9'd0;
        lbram1A_en<=1'b1;
        lbram1B_en<=1'b1;
        lbram1_we<=2'd0;
        lbram2A_en<=1'b1;
        lbram2B_en<=1'b1;
        lbram2_we<=2'd0;
        lbram3A_en<=1'b1;
        lbram3B_en<=1'b1;
        lbram3_we<=2'd0;   
        
        //filter BRAM initialisation        
        fbram1_write_addr<=9'b0;        
        fbramA1_en<=1'b1;
        fbram1_we<=2'd0;
        fbram1_read_addr<=9'd0;
        fbramB1_en<=1'b1;
        
        fbram2_write_addr<=9'b0;        
        fbramA2_en<=1'b1;
        fbram2_we<=2'd0;
        fbram2_read_addr<=9'd0;
        fbramB2_en<=1'b1;
        
        fbram3_write_addr<=9'b0;        
        fbramA3_en<=1'b1;
        fbram3_we<=2'd0;
        fbram3_read_addr<=9'd0;
        fbramB3_en<=1'b1;
        
        fbram4_write_addr<=9'b0;        
        fbramA4_en<=1'b1;
        fbram4_we<=2'd0;
        fbram4_read_addr<=9'd0;
        fbramB4_en<=1'b1;
        
        fbram5_write_addr<=9'b0;        
        fbramA5_en<=1'b1;
        fbram5_we<=2'd0;
        fbram5_read_addr<=9'd0;
        fbramB5_en<=1'b1;
        
        fbram6_write_addr<=9'b0;        
        fbramA6_en<=1'b1;
        fbram6_we<=2'd0;
        fbram6_read_addr<=9'd0;
        fbramB6_en<=1'b1;
        
        fbram7_write_addr<=9'b0;        
        fbramA7_en<=1'b1;
        fbram7_we<=2'd0;
        fbram7_read_addr<=9'd0;
        fbramB7_en<=1'b1;
        
        fbram8_write_addr<=9'b0;        
        fbramA8_en<=1'b1;
        fbram8_we<=2'd0;
        fbram8_read_addr<=9'd0;
        fbramB8_en<=1'b1;
        
        fbram9_write_addr<=9'b0;        
        fbramA9_en<=1'b1;
        fbram9_we<=2'd0;
        fbram9_read_addr<=9'd0;
        fbramB9_en<=1'b1;
        
        filter_update_en<=1'b0;
        
        //initialise multipliers        
        mul1_ready<=1'b0;                
        mulA1_valid<=1'b0;        
        mulB1_valid<=1'b0;
        
        mul2_ready<=1'b0;                
        mulA2_valid<=1'b0;        
        mulB2_valid<=1'b0;
        
        mul3_ready<=1'b0;                
        mulA3_valid<=1'b0;        
        mulB3_valid<=1'b0;
        
        mul4_ready<=1'b0;                
        mulA4_valid<=1'b0;        
        mulB4_valid<=1'b0;
        
        mul5_ready<=1'b0;                
        mulA5_valid<=1'b0;        
        mulB5_valid<=1'b0;
        
        mul6_ready<=1'b0;                
        mulA6_valid<=1'b0;        
        mulB6_valid<=1'b0;
        
        mul7_ready<=1'b0;                
        mulA7_valid<=1'b0;        
        mulB7_valid<=1'b0;
        
        mul8_ready<=1'b0;                
        mulA8_valid<=1'b0;        
        mulB8_valid<=1'b0;
        
        mul9_ready<=1'b0;                
        mulA9_valid<=1'b0;        
        mulB9_valid<=1'b0;
                
        add1_ready<=1'b0;                
        addA1_valid<=1'b0;        
        addB1_valid<=1'b0;
        
        add2_ready<=1'b0;                
        addA2_valid<=1'b0;        
        addB2_valid<=1'b0;
        
        add3_ready<=1'b0;                
        addA3_valid<=1'b0;        
        addB3_valid<=1'b0;
        
        add4_ready<=1'b0;                
        addA4_valid<=1'b0;        
        addB4_valid<=1'b0;
        
        add5_ready<=1'b0;                
        addA5_valid<=1'b0;        
        addB5_valid<=1'b0;
        
        add6_ready<=1'b0;                
        addA6_valid<=1'b0;        
        addB6_valid<=1'b0;
        
        add7_ready<=1'b0;                
        addA7_valid<=1'b0;        
        addB7_valid<=1'b0;
        
        add8_ready<=1'b0;                
        addA8_valid<=1'b0;        
        addB8_valid<=1'b0;

        add9_ready<=1'b0;                
        addA9_valid<=1'b0;        
        addB9_valid<=1'b0;
        
        add10_ready<=1'b0;                
        addA10_valid<=1'b0;        
        addB10_valid<=1'b0;
        
        add11_ready<=1'b0;                
        addA11_valid<=1'b0;        
        addB11_valid<=1'b0;
        
        add12_ready<=1'b0;                
        addA12_valid<=1'b0;        
        addB12_valid<=1'b0;        
        
        //enable convolution variables
        enable_conv<=1'b0;        
        adder_l1_en<=1'b0;
        adder_l2_en<=1'b0;
        adder_l3_en<=1'b0;
        adder_l4_en<=1'b0;       
        write_output<=1'b0;              
    end

reg [5:0] conv_state;

//enable multiplication
always@(posedge clk && enable_conv)
begin
        //multiply 9 values
        mulA1_valid<=1'b1;
        mulB1_valid<=1'b1;        
        mulA2_valid<=1'b1;
        mulB2_valid<=1'b1;        
        mulA3_valid<=1'b1;
        mulB3_valid<=1'b1;        
        mulA4_valid<=1'b1;
        mulB4_valid<=1'b1;        
        mulA5_valid<=1'b1;
        mulB5_valid<=1'b1;        
        mulA6_valid<=1'b1;
        mulB6_valid<=1'b1;        
        mulA7_valid<=1'b1;
        mulB7_valid<=1'b1;        
        mulA8_valid<=1'b1;
        mulB8_valid<=1'b1;        
        mulA9_valid<=1'b1;
        mulB9_valid<=1'b1;
        
        if(mul1_valid&&mul2_valid&&mul3_valid&&mul4_valid&&mul5_valid&&mul6_valid&&mul7_valid&&mul8_valid&&mul9_valid)
            begin
                adder_l1_en<=1'b1;
                add1_ready<=1'b1;
                add2_ready<=1'b1;
                add3_ready<=1'b1;
                add4_ready<=1'b1;        
                add9_ready<=1'b1;
                
                addA1<=mul1_res;
                addB1<=mul2_res;
                
                addA2<=mul3_res;
                addB2<=mul4_res;
                
                addA3<=mul5_res;
                addB3<=mul6_res;
                
                addA4<=mul7_res;
                addB4<=mul8_res;
                
                addA9<=mul9_res;
                addB9<=16'd0;
            end
end

always@(posedge clk && adder_l1_en)
    begin
        addA1_valid<=1'b1;
        addB1_valid<=1'b1;
        addA2_valid<=1'b1;
        addB2_valid<=1'b1;
        addA3_valid<=1'b1;
        addB3_valid<=1'b1;
        addA4_valid<=1'b1;
        addB4_valid<=1'b1;
        addA9_valid<=1'b1;
        addB9_valid<=1'b1;
        
        if(add1_valid&&add2_valid&&add3_valid&&add4_valid&&add9_valid)
            begin
                adder_l2_en<=1'b1;
                add5_ready<=1'b1;
                add6_ready<=1'b1;
                add10_ready<=1'b1;
                
                addA5<=add1_res;
                addB5<=add2_res;
                addA6<=add3_res;
                addB6<=add4_res;
                addA10<=add9_res;
                addB10<=16'd0;
                
            end
    end

always@(posedge clk && adder_l2_en)
    begin
        addA5_valid<=1'b1;
        addB5_valid<=1'b1;
        addA6_valid<=1'b1;
        addB6_valid<=1'b1;
        addA10_valid<=1'b1;
        addB10_valid<=1'b1;
        
        if(add5_valid&&add6_valid&&add10_valid)
            begin
                adder_l3_en<=1'b1;
                add7_ready<=1'b1;
                add11_ready<=1'b1;
                
                addA7<=add5_res;
                addB7<=add6_res;
                addA11<=add10_res;
                addB11<=16'd0;
            end
    end
    
always@(posedge clk && adder_l3_en)
    begin
        addA7_valid<=1'b1;
        addB7_valid<=1'b1;
        addA11_valid<=1'b1;
        addB11_valid<=1'b1;
        Output_BRAM_we<=2'd3;
        if(add7_valid&&add11_valid)
            begin
                adder_l4_en<=1'b1;
                add8_ready<=1'b1;           
                
                addA8<=add7_res;
                addB8<=add11_res;
            end
          
    end
    
always@(posedge clk && adder_l4_en)
    begin
        addA8_valid<=1'b1;
        addB8_valid<=1'b1;
        
        if(add8_valid)
            begin                       
                 Output_curr_col=(Output_curr_col==(Output_max_col-18'd1))?18'd0:(Output_curr_col+18'd1);
                 Output_curr_row=(Output_curr_col==18'd0)?(Output_curr_row+18'd1):Output_curr_row;
                 Output_write_addr_reg<=(Output_max_row*Output_curr_row)+Output_curr_col; 
                 
                 Output_write_data<=add8_res;
                 Input_update_enable<=1'b1;
            end        
end


always@(posedge clk && filter_update_en)
    begin
        //update terminating condition
        fbram1_read_addr<=fbram1_read_addr+9'd1;
        fbram2_read_addr<=fbram2_read_addr+9'd1;
        fbram3_read_addr<=fbram3_read_addr+9'd1;
        fbram4_read_addr<=fbram4_read_addr+9'd1;
        fbram5_read_addr<=fbram5_read_addr+9'd1;
        fbram6_read_addr<=fbram6_read_addr+9'd1;
        fbram7_read_addr<=fbram7_read_addr+9'd1;
        fbram8_read_addr<=fbram8_read_addr+9'd1;
        fbram9_read_addr<=fbram9_read_addr+9'd1;
        
        filter[0][0]<=fbram1_read_data;
        filter[0][1]<=fbram2_read_data;
        filter[0][2]<=fbram3_read_data;
        filter[1][0]<=fbram4_read_data;
        filter[1][1]<=fbram5_read_data;
        filter[1][2]<=fbram6_read_data;
        filter[2][0]<=fbram7_read_data;
        filter[2][1]<=fbram8_read_data;
        filter[2][2]<=fbram9_read_data;        
        //filter_update_en<=1'b0;
        
    end

//prepare window
always@(posedge clk && Input_update_enable)
    begin
        //update input address        
        Input_curr_col=(Input_curr_col==(Input_max_col-18'd1))?18'd0:(Input_curr_col+18'd1);
        Input_curr_row=(Input_curr_col==18'd0)?(Input_curr_row+18'd1):Input_curr_row;
        Input_read_addr_reg<=(Input_max_row*Input_curr_row)+Input_curr_col; 
        
        lbram3_we<=2'd3;
        lbram2_we<=2'd3;
        lbram1_we<=2'd3;       
        
        lbram1_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd2)%Input_max_col;
        lbram2_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd2)%Input_max_col;
        lbram3_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd2)%Input_max_col;
        lbram1_read_addr<=Input_curr_col[8:0];
        lbram2_read_addr<=Input_curr_col[8:0];
        lbram3_read_addr<=Input_curr_col[8:0];
        
        lbram1_write_data<=lbram2_read_data;
        lbram2_write_data<=lbram3_read_data;
        lbram3_write_data<=Input_read_data;
        
        //shift and update window buffer
        wbuffer[0][0]<=wbuffer[0][1];
        wbuffer[1][0]<=wbuffer[1][1];
        wbuffer[2][0]<=wbuffer[2][1];
        wbuffer[0][1]<=wbuffer[0][2];
        wbuffer[1][1]<=wbuffer[1][2];
        wbuffer[2][1]<=wbuffer[2][2];             
        wbuffer[0][2]<=lbram1_read_data;
        wbuffer[1][2]<=lbram2_read_data;
        wbuffer[2][2]<=lbram3_read_data;
        
        if(Input_read_addr_reg>start_conv_addr)
            begin
           //  Input_update_enable<=1'b0;
               enable_conv<=1'b1;
           //   curr_state<=18'd3;
              mulA1<=filter[0][0];
              mulB1<=wbuffer[0][0];
              
              mulA2<=filter[0][1];
              mulB2<=wbuffer[0][1];
              
              mulA3<=filter[0][2];
              mulB3<=wbuffer[0][2];
              
              mulA4<=filter[1][0];
              mulB4<=wbuffer[1][0];
              
              mulA5<=filter[1][1];
              mulB5<=wbuffer[1][1];
              
              mulA6<=filter[1][2];
              mulB6<=wbuffer[1][2];
              
              mulA7<=filter[2][0];
              mulB7<=wbuffer[2][0];
              
              mulA8<=filter[2][1];
              mulB8<=wbuffer[2][1];
              
              mulA9<=filter[2][2];
              mulB9<=wbuffer[2][2];
               
              mul1_ready<=1'b1;
              mul2_ready<=1'b1;
              mul3_ready<=1'b1;
              mul4_ready<=1'b1;
              mul5_ready<=1'b1;
              mul6_ready<=1'b1;
              mul7_ready<=1'b1;
              mul8_ready<=1'b1;
              mul9_ready<=1'b1;           
              //Input_update_enable<=1'b0;
            end           
   end
     
 //write protect lbram      
always@(posedge clk &!Input_update_enable)
   begin
        lbram1_we<=2'd0;
        lbram2_we<=2'd0;
        lbram3_we<=2'd0;  
   end


always@(posedge clk)
    begin
        case(curr_state)
        18'd0:
        begin    
          Input_addr_reset<=1'b0;
          Input_addr_en<=1'b1;
          curr_state<=18'd1;
          lbram3_we<=2'd0;
          lbram2_we<=2'd0;
          lbram1_we<=2'd0;
          filter_update_en<=1'b1;
        end
        18'd1:
        begin    
           curr_state<=18'd2; 
           Input_update_enable<=1'b1;          
           filter_update_en<=1'b0; 
        end
        18'd2:
         begin                   
            curr_state<=18'd2;
            filter_update_en<=1'b0; 
         end
        18'd3:
            begin
            enable_conv<=1;
            filter_update_en<=1'b0; 
            end
        18'd4:
            begin
            enable_conv<=0;
            end           
        endcase
    end
    
endmodule