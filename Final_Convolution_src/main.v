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
input reset,
output reg done_conv,
output reg [15:0] Output_finalSum_write_data1
    );

//Input bram variables    
reg Input_addr_en;
reg Input_addr_reset;
reg Input_update_enable;
reg Input_update_enable2;
wire [47:0] Input_read_data;
reg [47:0] Input_write_data;

reg Input_BRAMA_en;
reg Input_BRAMB_en;
reg [5:0] Input_BRAM_we;

reg [17:0] Input_write_addr_reg;
reg [17:0] Input_read_addr_reg;
reg [17:0] Input_inter_read_addr_reg;

reg [17:0] Input_curr_row;
reg [17:0] Input_curr_col;
reg [17:0] Input_inter_curr_row;
reg [17:0] Input_inter_curr_col;
reg [17:0] Input_max_row;
reg [17:0] Input_max_col;

reg Output_inter_addr_en;
reg Output_inter_addr_reset;
reg Output_inter_update_enable;
wire [15:0] Output_inter_read_data;
wire [15:0] Output_inter_write_data;
wire [15:0] Output_finalSum_write_data;
reg Output_inter_BRAMA_en;
reg Output_inter_BRAMB_en;
////////////////////////////Testing ///////////////////////
wire [1:0] Output_inter_BRAM_we;
wire [1:0] Output_finalSum_BRAM_we;
reg [1:0] Output_inter_BRAM_we_reg;



wire [47:0] Output_read_data;
wire [47:0] Output_write_data;
wire [47:0] Output_final_write_data;
wire [5:0] Output_BRAM_we;
wire [5:0] Output_BRAM_we_temp;
wire [5:0] Output_BRAM_we_temp_temp;
wire [5:0] Output_final_BRAM_we;
wire [5:0] Output_final_BRAM_we_temp;
wire [5:0] Output_final_BRAM_we_temp_temp;

reg [17:0] curr_state;

wire [47:0] lbram1_read_data;
reg lbram1A_en;
reg [5:0] lbram1_we;
wire [47:0] lbram2_read_data;
reg lbram2A_en;
reg [5:0] lbram2_we;
wire [47:0] lbram3_read_data;
reg lbram3A_en;
reg [5:0] lbram3_we;
reg [47:0] lbram1_write_data;
reg lbram1B_en;
reg [47:0] lbram2_write_data;
reg lbram2B_en;
reg [47:0] lbram3_write_data;
reg lbram3B_en;

reg [47:0] wbuffer [0:2][0:2];
//reg [287:0] wbuffer_full;
reg [143:0] wbuffer_full1;
reg [143:0] wbuffer_full2;
reg [143:0] wbuffer_full3;

reg [8:0] lbram1_read_addr;
reg [8:0] lbram2_read_addr;
reg [8:0] lbram3_read_addr;

reg [8:0] lbram1_write_addr;
reg [8:0] lbram2_write_addr;
reg [8:0] lbram3_write_addr;


wire [47:0] lbram1_inter_read_data;
reg lbram1A_inter_en;
reg [5:0] lbram1_inter_we;
wire [47:0] lbram2_inter_read_data;
reg lbram2A_inter_en;
reg [5:0] lbram2_inter_we;
wire [47:0] lbram3_inter_read_data;
reg lbram3A_inter_en;
reg [5:0] lbram3_inter_we;
reg [47:0] lbram1_inter_write_data;
reg lbram1B_inter_en;
reg [47:0] lbram2_inter_write_data;
reg lbram2B_inter_en;
reg [47:0] lbram3_inter_write_data;
reg lbram3B_inter_en;

reg [47:0] wbuffer_inter [0:2][0:2];
reg [143:0] wbuffer_inter_full1;
reg [143:0] wbuffer_inter_full2;
reg [143:0] wbuffer_inter_full3;

reg [8:0] lbram1_inter_read_addr;
reg [8:0] lbram2_inter_read_addr;
reg [8:0] lbram3_inter_read_addr;
reg [8:0] lbram1_inter_write_addr;
reg [8:0] lbram2_inter_write_addr;
reg [8:0] lbram3_inter_write_addr;

reg [17:0] start_conv_addr;
reg [17:0] start_inter_conv_addr;

reg filter_update;

reg [8:0] fbram1_write_addr;
reg [47:0] fbram1_write_data;
reg fbramA1_en;
reg [5:0] fbram1_we;
reg [8:0] fbram1_read_addr;
wire [47:0] fbram1_read_data;
reg fbramB1_en;

reg [8:0] fbram2_write_addr;
reg [47:0] fbram2_write_data;
reg fbramA2_en;
reg [5:0] fbram2_we;
reg [8:0] fbram2_read_addr;
wire [47:0] fbram2_read_data;
reg fbramB2_en;

reg [8:0] fbram3_write_addr;
reg [47:0] fbram3_write_data;
reg fbramA3_en;
reg [5:0] fbram3_we;
reg [8:0] fbram3_read_addr;
wire [47:0] fbram3_read_data;
reg fbramB3_en;

reg [8:0] fbram4_write_addr;
reg [47:0] fbram4_write_data;
reg fbramA4_en;
reg [5:0] fbram4_we;
reg [8:0] fbram4_read_addr;
wire [47:0] fbram4_read_data;
reg fbramB4_en;

reg [8:0] fbram5_write_addr;
reg [47:0] fbram5_write_data;
reg fbramA5_en;
reg [5:0] fbram5_we;
reg [8:0] fbram5_read_addr;
wire [47:0] fbram5_read_data;
reg fbramB5_en;

reg [8:0] fbram6_write_addr;
reg [47:0] fbram6_write_data;
reg fbramA6_en;
reg [5:0] fbram6_we;
reg [8:0] fbram6_read_addr;
wire [47:0] fbram6_read_data;
reg fbramB6_en;

reg [8:0] fbram7_write_addr;
reg [47:0] fbram7_write_data;
reg fbramA7_en;
reg [5:0] fbram7_we;
reg [8:0] fbram7_read_addr;
wire [47:0] fbram7_read_data;
reg fbramB7_en;

reg [8:0] fbram8_write_addr;
reg [47:0] fbram8_write_data;
reg fbramA8_en;
reg [5:0] fbram8_we;
reg [8:0] fbram8_read_addr;
wire [47:0] fbram8_read_data;
reg fbramB8_en;

reg [8:0] fbram9_write_addr;
reg [47:0] fbram9_write_data;
reg fbramA9_en;
reg [5:0] fbram9_we;
reg [8:0] fbram9_read_addr;
wire [47:0] fbram9_read_data;
reg fbramB9_en;

reg filter_update_en;

reg [8:0] fbram1_inter_write_addr;
reg [47:0] fbram1_inter_write_data;
reg fbramA1_inter_en;
reg [5:0] fbram1_inter_we;
reg [8:0] fbram1_inter_read_addr;
wire [47:0] fbram1_inter_read_data;
reg fbramB1_inter_en;

reg [8:0] fbram2_inter_write_addr;
reg [47:0] fbram2_inter_write_data;
reg fbramA2_inter_en;
reg [5:0] fbram2_inter_we;
reg [8:0] fbram2_inter_read_addr;
wire [47:0] fbram2_inter_read_data;
reg fbramB2_inter_en;

reg [8:0] fbram3_inter_write_addr;
reg [47:0] fbram3_inter_write_data;
reg fbramA3_inter_en;
reg [5:0] fbram3_inter_we;
reg [8:0] fbram3_inter_read_addr;
wire [47:0] fbram3_inter_read_data;
reg fbramB3_inter_en;

reg [8:0] fbram4_inter_write_addr;
reg [47:0] fbram4_inter_write_data;
reg fbramA4_inter_en;
reg [5:0] fbram4_inter_we;
reg [8:0] fbram4_inter_read_addr;
wire [47:0] fbram4_inter_read_data;
reg fbramB4_inter_en;

reg [8:0] fbram5_inter_write_addr;
reg [47:0] fbram5_inter_write_data;
reg fbramA5_inter_en;
reg [5:0] fbram5_inter_we;
reg [8:0] fbram5_inter_read_addr;
wire [47:0] fbram5_inter_read_data;
reg fbramB5_inter_en;

reg [8:0] fbram6_inter_write_addr;
reg [47:0] fbram6_inter_write_data;
reg fbramA6_inter_en;
reg [5:0] fbram6_inter_we;
reg [8:0] fbram6_inter_read_addr;
wire [47:0] fbram6_inter_read_data;
reg fbramB6_inter_en;

reg [8:0] fbram7_inter_write_addr;
reg [47:0] fbram7_inter_write_data;
reg fbramA7_inter_en;
reg [5:0] fbram7_inter_we;
reg [8:0] fbram7_inter_read_addr;
wire [47:0] fbram7_inter_read_data;
reg fbramB7_inter_en;

reg [8:0] fbram8_inter_write_addr;
reg [47:0] fbram8_inter_write_data;
reg fbramA8_inter_en;
reg [5:0] fbram8_inter_we;
reg [8:0] fbram8_inter_read_addr;
wire [47:0] fbram8_inter_read_data;
reg fbramB8_inter_en;

reg [8:0] fbram9_inter_write_addr;
reg [47:0] fbram9_inter_write_data;
reg fbramA9_inter_en;
reg [5:0] fbram9_inter_we;
reg [8:0] fbram9_inter_read_addr;
wire [47:0] fbram9_inter_read_data;
reg fbramB9_inter_en;

reg filter_inter_update_en;

reg [47:0] filter [0:2][0:2];
reg [143:0] filter_full1;
reg [143:0] filter_full2;
reg [143:0] filter_full3;
reg [47:0] filter_inter [0:2][0:2];
reg [143:0] filter_inter_full1;
reg [143:0] filter_inter_full2;
reg [143:0] filter_inter_full3;

reg enable_conv;
reg enable_conv2;
reg enable_inter_conv;
reg enable_final_conv;
reg write_output;
reg [1:0] filter_counter;
reg [1:0]Nooffilters;
reg [1:0]InterOutput_counter;
reg flagwbuffer;
reg flagwbuffer2;
reg [47:0] InterInput; 
reg flag_InterInput;
reg [17:0]MaxSizeOfInput;
reg pad_enable;


reg filter_update_temp;
reg Input_update_enable_flag;

//read 1 filter from ddr to filter_bram
 //filter BRAM module
 filter_BRAM_48 filter_bram(
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

filter_inter_BRAM_48 filter_inter_bram(
    .BRAM_PORTA_1_addr(fbram1_inter_write_addr),
    .BRAM_PORTA_1_clk(clk),
    .BRAM_PORTA_1_din(fbram1_inter_write_data),
    .BRAM_PORTA_1_en(fbramA1_inter_en),
    .BRAM_PORTA_1_we(fbram1_inter_we),
    .BRAM_PORTB_1_addr(fbram1_inter_read_addr),
    .BRAM_PORTB_1_clk(clk),
    .BRAM_PORTB_1_dout(fbram1_inter_read_data),
    .BRAM_PORTB_1_en(fbramB1_inter_en),
    
    .BRAM_PORTA_2_addr(fbram2_inter_write_addr),
    .BRAM_PORTA_2_clk(clk),
    .BRAM_PORTA_2_din(fbram2_inter_write_data),
    .BRAM_PORTA_2_en(fbramA2_inter_en),
    .BRAM_PORTA_2_we(fbram2_inter_we),
    .BRAM_PORTB_2_addr(fbram2_inter_read_addr),
    .BRAM_PORTB_2_clk(clk),
    .BRAM_PORTB_2_dout(fbram2_inter_read_data),
    .BRAM_PORTB_2_en(fbramB2_inter_en),
    
    .BRAM_PORTA_3_addr(fbram3_inter_write_addr),
    .BRAM_PORTA_3_clk(clk),
    .BRAM_PORTA_3_din(fbram3_inter_write_data),
    .BRAM_PORTA_3_en(fbramA3_inter_en),
    .BRAM_PORTA_3_we(fbram3_inter_we),
    .BRAM_PORTB_3_addr(fbram3_inter_read_addr),
    .BRAM_PORTB_3_clk(clk),
    .BRAM_PORTB_3_dout(fbram3_inter_read_data),
    .BRAM_PORTB_3_en(fbramB3_inter_en),
    
    .BRAM_PORTA_4_addr(fbram4_inter_write_addr),
    .BRAM_PORTA_4_clk(clk),
    .BRAM_PORTA_4_din(fbram4_inter_write_data),
    .BRAM_PORTA_4_en(fbramA4_inter_en),
    .BRAM_PORTA_4_we(fbram4_inter_we),
    .BRAM_PORTB_4_addr(fbram4_inter_read_addr),
    .BRAM_PORTB_4_clk(clk),
    .BRAM_PORTB_4_dout(fbram4_inter_read_data),
    .BRAM_PORTB_4_en(fbramB4_inter_en),
    
    .BRAM_PORTA_5_addr(fbram5_inter_write_addr),
    .BRAM_PORTA_5_clk(clk),
    .BRAM_PORTA_5_din(fbram5_inter_write_data),
    .BRAM_PORTA_5_en(fbramA5_inter_en),
    .BRAM_PORTA_5_we(fbram5_inter_we),
    .BRAM_PORTB_5_addr(fbram5_inter_read_addr),
    .BRAM_PORTB_5_clk(clk),
    .BRAM_PORTB_5_dout(fbram5_inter_read_data),
    .BRAM_PORTB_5_en(fbramB5_inter_en),
    
    .BRAM_PORTA_6_addr(fbram6_inter_write_addr),
    .BRAM_PORTA_6_clk(clk),
    .BRAM_PORTA_6_din(fbram6_inter_write_data),
    .BRAM_PORTA_6_en(fbramA6_inter_en),
    .BRAM_PORTA_6_we(fbram6_inter_we),
    .BRAM_PORTB_6_addr(fbram6_inter_read_addr),
    .BRAM_PORTB_6_clk(clk),
    .BRAM_PORTB_6_dout(fbram6_inter_read_data),
    .BRAM_PORTB_6_en(fbramB6_inter_en),
    
    .BRAM_PORTA_7_addr(fbram7_inter_write_addr),
    .BRAM_PORTA_7_clk(clk),
    .BRAM_PORTA_7_din(fbram7_inter_write_data),
    .BRAM_PORTA_7_en(fbramA7_inter_en),
    .BRAM_PORTA_7_we(fbram7_inter_we),
    .BRAM_PORTB_7_addr(fbram7_inter_read_addr),
    .BRAM_PORTB_7_clk(clk),
    .BRAM_PORTB_7_dout(fbram7_inter_read_data),
    .BRAM_PORTB_7_en(fbramB7_inter_en),
    
    .BRAM_PORTA_8_addr(fbram8_inter_write_addr),
    .BRAM_PORTA_8_clk(clk),
    .BRAM_PORTA_8_din(fbram8_inter_write_data),
    .BRAM_PORTA_8_en(fbramA8_inter_en),
    .BRAM_PORTA_8_we(fbram8_inter_we),
    .BRAM_PORTB_8_addr(fbram8_inter_read_addr),
    .BRAM_PORTB_8_clk(clk),
    .BRAM_PORTB_8_dout(fbram8_inter_read_data),
    .BRAM_PORTB_8_en(fbramB8_inter_en),
    
    .BRAM_PORTA_addr(fbram9_inter_write_addr),
    .BRAM_PORTA_clk(clk),
    .BRAM_PORTA_din(fbram9_inter_write_data),
    .BRAM_PORTA_en(fbramA9_inter_en),
    .BRAM_PORTA_we(fbram9_inter_we),
    .BRAM_PORTB_addr(fbram9_inter_read_addr),
    .BRAM_PORTB_clk(clk),
    .BRAM_PORTB_dout(fbram9_inter_read_data),
    .BRAM_PORTB_en(fbramB9_inter_en)
 );


 image_BRAM_48 input_bram(
    .BRAM_PORTA_addr(Input_write_addr_reg),
    .BRAM_PORTA_clk(clk),
    .BRAM_PORTA_en(Input_BRAMA_en),        
    .BRAM_PORTA_we(Input_BRAM_we),
    .BRAM_PORTB_addr(Input_read_addr_reg),
    .BRAM_PORTB_clk(clk),
    .BRAM_PORTA_din(Input_write_data),
    .BRAM_PORTB_dout(Input_read_data),
    .BRAM_PORTB_en(Input_BRAMB_en));
                       
line_BRAM_48 line_bram(
    .BRAM_PORTA_1_addr(lbram1_write_addr),
    .BRAM_PORTA_1_clk(clk),
    .BRAM_PORTA_1_din(lbram1_write_data),
    .BRAM_PORTA_1_en(lbram1A_en),
    .BRAM_PORTA_1_we(lbram1_we),
    .BRAM_PORTA_2_addr(lbram2_write_addr),
    .BRAM_PORTA_2_clk(clk),
    .BRAM_PORTA_2_din(lbram2_write_data),
    .BRAM_PORTA_2_en(lbram2A_en),
    .BRAM_PORTA_2_we(lbram2_we),        
    .BRAM_PORTA_addr(lbram3_write_addr),
    .BRAM_PORTA_clk(clk),
    .BRAM_PORTA_din(lbram3_write_data),
    .BRAM_PORTA_en(lbram3A_en),
    .BRAM_PORTA_we(lbram3_we),
    .BRAM_PORTB_1_addr(lbram1_read_addr),
    .BRAM_PORTB_1_clk(clk),
    .BRAM_PORTB_1_dout(lbram1_read_data),
    .BRAM_PORTB_1_en(lbram1B_en),
    .BRAM_PORTB_2_addr(lbram2_read_addr),
    .BRAM_PORTB_2_clk(clk),
    .BRAM_PORTB_2_dout(lbram2_read_data),
    .BRAM_PORTB_2_en(lbram2B_en),        
    .BRAM_PORTB_addr(lbram3_read_addr),
    .BRAM_PORTB_clk(clk),
    .BRAM_PORTB_dout(lbram3_read_data),
    .BRAM_PORTB_en(lbram3B_en)
);

line_BRAM_inter_48 line_inter_bram(
    .BRAM_PORTA_1_addr(lbram1_inter_write_addr),
    .BRAM_PORTA_1_clk(clk),
    .BRAM_PORTA_1_din(lbram1_inter_write_data),
    .BRAM_PORTA_1_en(lbram1A_inter_en),
    .BRAM_PORTA_1_we(lbram1_inter_we),
    .BRAM_PORTA_2_addr(lbram2_inter_write_addr),
    .BRAM_PORTA_2_clk(clk),
    .BRAM_PORTA_2_din(lbram2_inter_write_data),
    .BRAM_PORTA_2_en(lbram2A_inter_en),
    .BRAM_PORTA_2_we(lbram2_inter_we),        
    .BRAM_PORTA_addr(lbram3_inter_write_addr),
    .BRAM_PORTA_clk(clk),
    .BRAM_PORTA_din(lbram3_inter_write_data),
    .BRAM_PORTA_en(lbram3A_inter_en),
    .BRAM_PORTA_we(lbram3_inter_we),
    .BRAM_PORTB_1_addr(lbram1_inter_read_addr),
    .BRAM_PORTB_1_clk(clk),
    .BRAM_PORTB_1_dout(lbram1_inter_read_data),
    .BRAM_PORTB_1_en(lbram1B_inter_en),
    .BRAM_PORTB_2_addr(lbram2_inter_read_addr),
    .BRAM_PORTB_2_clk(clk),
    .BRAM_PORTB_2_dout(lbram2_inter_read_data),
    .BRAM_PORTB_2_en(lbram2B_inter_en),        
    .BRAM_PORTB_addr(lbram3_inter_read_addr),
    .BRAM_PORTB_clk(clk),
    .BRAM_PORTB_dout(lbram3_inter_read_data),
    .BRAM_PORTB_en(lbram3B_inter_en)
);

    
initial 
    begin        
        curr_state<=18'b0;
       
        //regular input/output variable initialisation        
        Input_curr_row<=18'b0;
        Input_curr_col<=18'b0;
        Input_inter_curr_row<=18'b0;
        Input_inter_curr_col<=18'd4;
        Input_max_row<=18'd5;
        Input_max_col<=18'd5;
        flagwbuffer <= 1'b0;
        flagwbuffer <= 1'b0;
        Output_inter_BRAM_we_reg <= 1'b0;
        filter_update_temp<=1'b0;
        Input_addr_en<=1'b0;
        Input_addr_reset<=1'b1;
        Input_update_enable<=1'b1;
        Input_update_enable2<=1'b0;
       Input_update_enable_flag<=1'b0;
        Output_inter_addr_en<=1'b0;
        Output_inter_addr_reset<=1'b1;
        Output_inter_update_enable<=1'b0;
        
        start_conv_addr<=18'd18;
        ///////////////////start_inter_conv = 3*maxcol - 1////////////////////////
        start_inter_conv_addr <= 18'd15;
        MaxSizeOfInput<= 18'd25;
        filter_counter <= 2'b11;
        Nooffilters <= 2'd3;
        InterOutput_counter <= 2'd0;
        InterInput <= 48'd0;
        
        //input BRAM variable initialisation
        Input_write_addr_reg<=18'b0;
        Input_BRAMA_en<=1'b0;
        Input_BRAMB_en<=1'b1;
        Input_BRAM_we<=6'd0;
        Input_read_addr_reg<=18'd0;
        Input_inter_read_addr_reg <= 18'd0;
        
        Output_inter_BRAMA_en<=1'b0;
        Output_inter_BRAMB_en<=1'b1;
        
        //lbuffer initialisation
        lbram1_read_addr<=9'd0;
        lbram2_read_addr<=9'd0;
        lbram3_read_addr<=9'd0;
        lbram1_write_addr<=9'd0;
        lbram2_write_addr<=9'd0;
        lbram3_write_addr<=9'd0;
        lbram1A_en<=1'b1;
        lbram1B_en<=1'b1;
        lbram1_we<=6'd0;
        lbram2A_en<=1'b1;
        lbram2B_en<=1'b1;
        lbram2_we<=6'd0;
        lbram3A_en<=1'b1;
        lbram3B_en<=1'b1;
        lbram3_we<=6'd0;
        
        //lbram1_inter_read_addr<=9'd0;
        //lbram2_inter_read_addr<=9'd0;
        //lbram3_inter_read_addr<=9'd0;
        //lbram1_inter_write_addr<=9'd4;
        //lbram2_inter_write_addr<=9'd4;
        //lbram3_inter_write_addr<=9'd4;
        
        ///////////////////////////////testing////////////////////////////
        lbram1_inter_read_addr<=9'd1;
        lbram2_inter_read_addr<=9'd1;
        lbram3_inter_read_addr<=9'd1;
        lbram1_inter_write_addr<=9'd0;
        lbram2_inter_write_addr<=9'd0;
        lbram3_inter_write_addr<=9'd0;
        /////////////////////////////////////////////////////////////////
        lbram1A_inter_en<=1'b1;
        lbram1B_inter_en<=1'b1;
        lbram1_inter_we<=6'd0;
        lbram2A_inter_en<=1'b1;
        lbram2B_inter_en<=1'b1;
        lbram2_inter_we<=6'd0;
        lbram3A_inter_en<=1'b1;
        lbram3B_inter_en<=1'b1;
        lbram3_inter_we<=6'd0;   
        
        //filter BRAM initialisation        
        fbram1_write_addr<=9'b0;        
        fbramA1_en<=1'b1;
        fbram1_we<=6'd0;
        fbram1_read_addr<=9'd0;
        fbramB1_en<=1'b1;
        
        fbram2_write_addr<=9'b0;        
        fbramA2_en<=1'b1;
        fbram2_we<=6'd0;
        fbram2_read_addr<=9'd0;
        fbramB2_en<=1'b1;
        
        fbram3_write_addr<=9'b0;        
        fbramA3_en<=1'b1;
        fbram3_we<=6'd0;
        fbram3_read_addr<=9'd0;
        fbramB3_en<=1'b1;
        
        fbram4_write_addr<=9'b0;        
        fbramA4_en<=1'b1;
        fbram4_we<=6'd0;
        fbram4_read_addr<=9'd0;
        fbramB4_en<=1'b1;
        
        fbram5_write_addr<=9'b0;        
        fbramA5_en<=1'b1;
        fbram5_we<=6'd0;
        fbram5_read_addr<=9'd0;
        fbramB5_en<=1'b1;
        
        fbram6_write_addr<=9'b0;        
        fbramA6_en<=1'b1;
        fbram6_we<=6'd0;
        fbram6_read_addr<=9'd0;
        fbramB6_en<=1'b1;
        
        fbram7_write_addr<=9'b0;        
        fbramA7_en<=1'b1;
        fbram7_we<=6'd0;
        fbram7_read_addr<=9'd0;
        fbramB7_en<=1'b1;
        
        fbram8_write_addr<=9'b0;        
        fbramA8_en<=1'b1;
        fbram8_we<=6'd0;
        fbram8_read_addr<=9'd0;
        fbramB8_en<=1'b1;
        
        fbram9_write_addr<=9'b0;        
        fbramA9_en<=1'b1;
        fbram9_we<=6'd0;
        fbram9_read_addr<=9'd0;
        fbramB9_en<=1'b1;
        
        fbram1_inter_write_addr<=9'b0;        
        fbramA1_inter_en<=1'b1;
        fbram1_inter_we<=6'd0;
        fbram1_inter_read_addr<=9'd0;
        fbramB1_inter_en<=1'b1;
        
        fbram2_inter_write_addr<=9'b0;        
        fbramA2_inter_en<=1'b1;
        fbram2_inter_we<=6'd0;
        fbram2_inter_read_addr<=9'd0;
        fbramB2_inter_en<=1'b1;
        
        fbram3_inter_write_addr<=9'b0;        
        fbramA3_inter_en<=1'b1;
        fbram3_inter_we<=6'd0;
        fbram3_inter_read_addr<=9'd0;
        fbramB3_inter_en<=1'b1;
        
        fbram4_inter_write_addr<=9'b0;        
        fbramA4_inter_en<=1'b1;
        fbram4_inter_we<=6'd0;
        fbram4_inter_read_addr<=9'd0;
        fbramB4_inter_en<=1'b1;
        
        fbram5_inter_write_addr<=9'b0;        
        fbramA5_inter_en<=1'b1;
        fbram5_inter_we<=6'd0;
        fbram5_inter_read_addr<=9'd0;
        fbramB5_inter_en<=1'b1;
        
        fbram6_inter_write_addr<=9'b0;        
        fbramA6_inter_en<=1'b1;
        fbram6_inter_we<=6'd0;
        fbram6_inter_read_addr<=9'd0;
        fbramB6_inter_en<=1'b1;
        
        fbram7_inter_write_addr<=9'b0;        
        fbramA7_inter_en<=1'b1;
        fbram7_inter_we<=6'd0;
        fbram7_inter_read_addr<=9'd0;
        fbramB7_inter_en<=1'b1;
        
        fbram8_inter_write_addr<=9'b0;        
        fbramA8_inter_en<=1'b1;
        fbram8_inter_we<=6'd0;
        fbram8_inter_read_addr<=9'd0;
        fbramB8_inter_en<=1'b1;
        
        fbram9_inter_write_addr<=9'b0;        
        fbramA9_inter_en<=1'b1;
        fbram9_inter_we<=6'd0;
        fbram9_inter_read_addr<=9'd0;
        fbramB9_inter_en<=1'b1;
        
        filter_update_en<=1'b0;
        filter_inter_update_en <=1'b0;
        enable_conv<=1'b0;
        enable_conv2<=1'b0;
        enable_inter_conv <= 1'b0;
        enable_final_conv <= 1'b0;
        write_output<=1'b0;
        pad_enable <= 1'b0;
  
    end


always@(*) begin
    filter_full1[15:0]    <= filter[0][0][15:0];
    filter_full1[31:16]   <= filter[0][1][15:0];
    filter_full1[47:32]   <= filter[0][2][15:0];
    filter_full1[63:48]   <= filter[1][0][15:0];
    filter_full1[79:64]   <= filter[1][1][15:0];
    filter_full1[95:80]   <= filter[1][2][15:0];
    filter_full1[111:96]  <= filter[2][0][15:0];
    filter_full1[127:112] <= filter[2][1][15:0];
    filter_full1[143:128] <= filter[2][2][15:0];
end

always@(*) begin
    filter_full2[15:0]    <= filter[0][0][31:16];
    filter_full2[31:16]   <= filter[0][1][31:16];
    filter_full2[47:32]   <= filter[0][2][31:16];
    filter_full2[63:48]   <= filter[1][0][31:16];
    filter_full2[79:64]   <= filter[1][1][31:16];
    filter_full2[95:80]   <= filter[1][2][31:16];
    filter_full2[111:96]  <= filter[2][0][31:16];
    filter_full2[127:112] <= filter[2][1][31:16];
    filter_full2[143:128] <= filter[2][2][31:16];
end

always@(*) begin
    filter_full3[15:0]    <= filter[0][0][47:32];
    filter_full3[31:16]   <= filter[0][1][47:32];
    filter_full3[47:32]   <= filter[0][2][47:32];
    filter_full3[63:48]   <= filter[1][0][47:32];
    filter_full3[79:64]   <= filter[1][1][47:32];
    filter_full3[95:80]   <= filter[1][2][47:32];
    filter_full3[111:96]  <= filter[2][0][47:32];
    filter_full3[127:112] <= filter[2][1][47:32];
    filter_full3[143:128] <= filter[2][2][47:32];
end

always@(*) begin
    filter_inter_full1[15:0]    <= filter_inter[0][0][15:0];
    filter_inter_full1[31:16]   <= filter_inter[0][1][15:0];
    filter_inter_full1[47:32]   <= filter_inter[0][2][15:0];
    filter_inter_full1[63:48]   <= filter_inter[1][0][15:0];
    filter_inter_full1[79:64]   <= filter_inter[1][1][15:0];
    filter_inter_full1[95:80]   <= filter_inter[1][2][15:0];
    filter_inter_full1[111:96]  <= filter_inter[2][0][15:0];
    filter_inter_full1[127:112] <= filter_inter[2][1][15:0];
    filter_inter_full1[143:128] <= filter_inter[2][2][15:0];
end

always@(*) begin
    filter_inter_full2[15:0]    <= filter_inter[0][0][31:16];
    filter_inter_full2[31:16]   <= filter_inter[0][1][31:16];
    filter_inter_full2[47:32]   <= filter_inter[0][2][31:16];
    filter_inter_full2[63:48]   <= filter_inter[1][0][31:16];
    filter_inter_full2[79:64]   <= filter_inter[1][1][31:16];
    filter_inter_full2[95:80]   <= filter_inter[1][2][31:16];
    filter_inter_full2[111:96]  <= filter_inter[2][0][31:16];
    filter_inter_full2[127:112] <= filter_inter[2][1][31:16];
    filter_inter_full2[143:128] <= filter_inter[2][2][31:16];
end

always@(*) begin
    filter_inter_full3[15:0]    <= filter_inter[0][0][47:32];
    filter_inter_full3[31:16]   <= filter_inter[0][1][47:32];
    filter_inter_full3[47:32]   <= filter_inter[0][2][47:32];
    filter_inter_full3[63:48]   <= filter_inter[1][0][47:32];
    filter_inter_full3[79:64]   <= filter_inter[1][1][47:32];
    filter_inter_full3[95:80]   <= filter_inter[1][2][47:32];
    filter_inter_full3[111:96]  <= filter_inter[2][0][47:32];
    filter_inter_full3[127:112] <= filter_inter[2][1][47:32];
    filter_inter_full3[143:128] <= filter_inter[2][2][47:32];
end

always@(*) begin
    wbuffer_full1[15:0]    <= wbuffer[0][0][15:0];
    wbuffer_full1[31:16]   <= wbuffer[0][1][15:0];
    wbuffer_full1[47:32]   <= wbuffer[0][2][15:0];
    wbuffer_full1[63:48]   <= wbuffer[1][0][15:0];
    wbuffer_full1[79:64]   <= wbuffer[1][1][15:0];
    wbuffer_full1[95:80]   <= wbuffer[1][2][15:0];
    wbuffer_full1[111:96]  <= wbuffer[2][0][15:0];
    wbuffer_full1[127:112] <= wbuffer[2][1][15:0];
    wbuffer_full1[143:128] <= wbuffer[2][2][15:0];
    
end

always@(*) begin
    wbuffer_full2[15:0]    <= wbuffer[0][0][31:16];
    wbuffer_full2[31:16]   <= wbuffer[0][1][31:16];
    wbuffer_full2[47:32]   <= wbuffer[0][2][31:16];
    wbuffer_full2[63:48]   <= wbuffer[1][0][31:16];
    wbuffer_full2[79:64]   <= wbuffer[1][1][31:16];
    wbuffer_full2[95:80]   <= wbuffer[1][2][31:16];
    wbuffer_full2[111:96]  <= wbuffer[2][0][31:16];
    wbuffer_full2[127:112] <= wbuffer[2][1][31:16];
    wbuffer_full2[143:128] <= wbuffer[2][2][31:16];
    
end

always@(*) begin
    wbuffer_full3[15:0]    <= wbuffer[0][0][47:32];
    wbuffer_full3[31:16]   <= wbuffer[0][1][47:32];
    wbuffer_full3[47:32]   <= wbuffer[0][2][47:32];
    wbuffer_full3[63:48]   <= wbuffer[1][0][47:32];
    wbuffer_full3[79:64]   <= wbuffer[1][1][47:32];
    wbuffer_full3[95:80]   <= wbuffer[1][2][47:32];
    wbuffer_full3[111:96]  <= wbuffer[2][0][47:32];
    wbuffer_full3[127:112] <= wbuffer[2][1][47:32];
    wbuffer_full3[143:128] <= wbuffer[2][2][47:32];
    
end

always@(*) begin
    wbuffer_inter_full1[15:0]    <= wbuffer_inter[0][0][15:0];
    wbuffer_inter_full1[31:16]   <= wbuffer_inter[0][1][15:0];
    wbuffer_inter_full1[47:32]   <= wbuffer_inter[0][2][15:0];
    wbuffer_inter_full1[63:48]   <= wbuffer_inter[1][0][15:0];
    wbuffer_inter_full1[79:64]   <= wbuffer_inter[1][1][15:0];
    wbuffer_inter_full1[95:80]   <= wbuffer_inter[1][2][15:0];
    wbuffer_inter_full1[111:96]  <= wbuffer_inter[2][0][15:0];
    wbuffer_inter_full1[127:112] <= wbuffer_inter[2][1][15:0];
    wbuffer_inter_full1[143:128] <= wbuffer_inter[2][2][15:0];
    
end

always@(*) begin
    wbuffer_inter_full2[15:0]    <= wbuffer_inter[0][0][31:16];
    wbuffer_inter_full2[31:16]   <= wbuffer_inter[0][1][31:16];
    wbuffer_inter_full2[47:32]   <= wbuffer_inter[0][2][31:16];
    wbuffer_inter_full2[63:48]   <= wbuffer_inter[1][0][31:16];
    wbuffer_inter_full2[79:64]   <= wbuffer_inter[1][1][31:16];
    wbuffer_inter_full2[95:80]   <= wbuffer_inter[1][2][31:16];
    wbuffer_inter_full2[111:96]  <= wbuffer_inter[2][0][31:16];
    wbuffer_inter_full2[127:112] <= wbuffer_inter[2][1][31:16];
    wbuffer_inter_full2[143:128] <= wbuffer_inter[2][2][31:16];
    
end

always@(*) begin
    wbuffer_inter_full3[15:0]    <= wbuffer_inter[0][0][47:32];
    wbuffer_inter_full3[31:16]   <= wbuffer_inter[0][1][47:32];
    wbuffer_inter_full3[47:32]   <= wbuffer_inter[0][2][47:32];
    wbuffer_inter_full3[63:48]   <= wbuffer_inter[1][0][47:32];
    wbuffer_inter_full3[79:64]   <= wbuffer_inter[1][1][47:32];
    wbuffer_inter_full3[95:80]   <= wbuffer_inter[1][2][47:32];
    wbuffer_inter_full3[111:96]  <= wbuffer_inter[2][0][47:32];
    wbuffer_inter_full3[127:112] <= wbuffer_inter[2][1][47:32];
    wbuffer_inter_full3[143:128] <= wbuffer_inter[2][2][47:32];
    
end

always@(*) begin
    enable_inter_conv = Output_BRAM_we[0];
    enable_final_conv = Output_final_BRAM_we[0];
    Output_inter_BRAM_we_reg <= Output_inter_BRAM_we; 
end

multiply_add ma1(
    .clk(clk),
    .Output_write_data(Output_write_data[15:0]),
    .Output_BRAM_we(Output_BRAM_we),
    .enable_conv(enable_conv),
    .filter_full(filter_full1),
    .wbuffer_full(wbuffer_full1)
    );
    
multiply_add ma2(
    .clk(clk),
    .Output_write_data(Output_write_data[31:16]),
    .Output_BRAM_we(Output_BRAM_we_temp),
    .enable_conv(enable_conv),
    .filter_full(filter_full2),
    .wbuffer_full(wbuffer_full2)
        );
        
multiply_add ma3(
    .clk(clk),
    .Output_write_data(Output_write_data[47:32]),
    .Output_BRAM_we(Output_BRAM_we_temp_temp),
    .enable_conv(enable_conv),
    .filter_full(filter_full3),
    .wbuffer_full(wbuffer_full3)
        );

add_only a1(
    .clk(clk),
    .Output_write_data(Output_inter_write_data),
    .Output_BRAM_we(Output_inter_BRAM_we),
    .enable_conv(enable_inter_conv),
    .conv_concat(Output_write_data)
        );                

multiply_add ma4(
    .clk(clk),
    .Output_write_data(Output_final_write_data[15:0]),
    .Output_BRAM_we(Output_final_BRAM_we),
    .enable_conv(enable_conv2),
    .filter_full(filter_inter_full1),
    .wbuffer_full(wbuffer_inter_full1)
    );
    
multiply_add ma5(
    .clk(clk),
    .Output_write_data(Output_final_write_data[31:16]),
    .Output_BRAM_we(Output_final_BRAM_we_temp),
    .enable_conv(enable_conv2),
    .filter_full(filter_inter_full2),
    .wbuffer_full(wbuffer_inter_full2)
        );
        
multiply_add ma6(
    .clk(clk),
    .Output_write_data(Output_final_write_data[47:32]),
    .Output_BRAM_we(Output_final_BRAM_we_temp_temp),
    .enable_conv(enable_conv2),
    .filter_full(filter_inter_full3),
    .wbuffer_full(wbuffer_inter_full3)
        );

add_only a2(
    .clk(clk),
    .Output_write_data(Output_finalSum_write_data),
    .Output_BRAM_we(Output_finalSum_BRAM_we),
    .enable_conv(enable_final_conv),
    .conv_concat(Output_final_write_data)
        );                



reg [5:0] conv_state;

always@(fbram1_read_data or fbram2_read_data or fbram3_read_data or fbram4_read_data or fbram5_read_data or fbram6_read_data or fbram7_read_data or fbram8_read_data or fbram9_read_data)begin
    filter[0][0]<=fbram1_read_data;
    filter[0][1]<=fbram2_read_data;
    filter[0][2]<=fbram3_read_data;
    filter[1][0]<=fbram4_read_data;
    filter[1][1]<=fbram5_read_data;
    filter[1][2]<=fbram6_read_data;
    filter[2][0]<=fbram7_read_data;
    filter[2][1]<=fbram8_read_data;
    filter[2][2]<=fbram9_read_data;
end

always@(fbram1_inter_read_data or fbram2_inter_read_data or fbram3_inter_read_data or fbram4_inter_read_data or fbram5_inter_read_data or fbram6_inter_read_data or fbram7_inter_read_data or fbram8_inter_read_data or fbram9_inter_read_data)begin
    filter_inter[0][0]<=fbram1_inter_read_data;
    filter_inter[0][1]<=fbram2_inter_read_data;
    filter_inter[0][2]<=fbram3_inter_read_data;
    filter_inter[1][0]<=fbram4_inter_read_data;
    filter_inter[1][1]<=fbram5_inter_read_data;
    filter_inter[1][2]<=fbram6_inter_read_data;
    filter_inter[2][0]<=fbram7_inter_read_data;
    filter_inter[2][1]<=fbram8_inter_read_data;
    filter_inter[2][2]<=fbram9_inter_read_data;
end



/*
always@(posedge clk && filter_update_en && !Input_update_enable)
    begin
        //update terminating condition
        
        enable_conv <= 1'b1;
        curr_state <= 18'd3;
        
        fbram1_read_addr<=(fbram1_read_addr==(Nooffilters-2'd1))?2'd0:(fbram1_read_addr+18'd1);
        fbram2_read_addr<=(fbram2_read_addr==(Nooffilters-2'd1))?2'd0:(fbram2_read_addr+18'd1);
        fbram3_read_addr<=(fbram3_read_addr==(Nooffilters-2'd1))?2'd0:(fbram3_read_addr+18'd1);
        fbram4_read_addr<=(fbram4_read_addr==(Nooffilters-2'd1))?2'd0:(fbram4_read_addr+18'd1);
        fbram5_read_addr<=(fbram5_read_addr==(Nooffilters-2'd1))?2'd0:(fbram5_read_addr+18'd1);
        fbram6_read_addr<=(fbram6_read_addr==(Nooffilters-2'd1))?2'd0:(fbram6_read_addr+18'd1);
        fbram7_read_addr<=(fbram7_read_addr==(Nooffilters-2'd1))?2'd0:(fbram7_read_addr+18'd1);
        fbram8_read_addr<=(fbram8_read_addr==(Nooffilters-2'd1))?2'd0:(fbram8_read_addr+18'd1);
        fbram9_read_addr<=(fbram9_read_addr==(Nooffilters-2'd1))?2'd0:(fbram9_read_addr+18'd1);
        
        //Input_update_enable2 <=(filter_counter >= Nooffilters-1) ? 1'b1: 1'b0;
        filter_counter <= (filter_counter >=Nooffilters-1 ) ? 2'd0:(filter_counter+2'd1);
        //Input_curr_col<= (filter_counter>= Nooffilters-1) ? (Input_curr_col+18'd1)%Input_max_col:(Input_curr_col);
       
       if(flagwbuffer == 1'b0) begin
                    lbram1_read_addr <= (lbram1_read_addr+Input_max_col-18'd1)%Input_max_col;
                    lbram2_read_addr <= (lbram2_read_addr+Input_max_col-18'd1)%Input_max_col;
                    lbram3_read_addr <= (lbram3_read_addr+Input_max_col-18'd1)%Input_max_col;
                    //lbram1_write_addr <= (lbram1_write_addr+Input_max_col-18'd1)%Input_max_col;
                    //lbram2_write_addr <= (lbram2_write_addr+Input_max_col-18'd1)%Input_max_col;
                    //lbram3_write_addr <= (lbram3_write_addr+Input_max_col-18'd1)%Input_max_col;
                    Input_curr_row <= (Input_curr_row+Input_max_col-18'd1)%Input_max_col;
                    Input_curr_col <= (Input_curr_col+Input_max_col-18'd1)%Input_max_col;
                    Input_read_addr_reg <= (Input_read_addr_reg-18'd1);
                    flagwbuffer <= 1'b1;
       end else begin
           if(filter_counter ==  Nooffilters-1 ) begin
               Input_curr_col<=(Input_curr_col==(Input_max_col-18'd1))?18'd0:(Input_curr_col+18'd1);
               Input_curr_row<=(Input_curr_col==(Input_max_col-18'd1))?(Input_curr_row+18'd1):Input_curr_row;
               
            
               Input_read_addr_reg<=(Input_max_row*Input_curr_row)+Input_curr_col; 
               
               lbram3_we<=6'b111111;
               lbram2_we<=6'b111111;
               lbram1_we<=6'b111111;       
               
               lbram1_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd1)%Input_max_col;
               lbram2_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd1)%Input_max_col;
               lbram3_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd1)%Input_max_col;
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
               
           end
      end
       
       //if(flagwbuffer == 1'b1 && flagwbuffer2 == 1'b0) begin
       //     Input_read_data
       //end
       ////////////////////testing Termination conditions////////////////////////
       if(Input_read_addr_reg == MaxSizeOfInput+18'd5) begin
            filter_update_en <= 1'b0;  
       end
        
    end*/
    
       
//prepare window

always@(posedge clk && !reset)
    begin
        //update input address
      if(Input_update_enable&&Input_update_enable_flag) begin
        Input_curr_col<=(Input_curr_col==(Input_max_col-18'd1))?18'd0:(Input_curr_col+18'd1);
        Input_curr_row<=(Input_curr_col==(Input_max_col-18'd1))?(Input_curr_row+18'd1):Input_curr_row;
   
        Input_read_addr_reg<=(Input_max_row*Input_curr_row)+Input_curr_col; 
        
        lbram3_we<=6'b111111;
        lbram2_we<=6'b111111;
        lbram1_we<=6'b111111;       
        
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
               
               
        if(Input_read_addr_reg >= start_conv_addr ) begin
          //  curr_state <= 18'd2;
          
          filter_update_temp<=1'b1;

            Input_update_enable <= 1'b0;
            
        end
      end else begin
        if(filter_update_en)begin
                enable_conv <= 1'b1;
          //      curr_state <= 18'd3;
                
                fbram1_read_addr<=(fbram1_read_addr==(Nooffilters-2'd1))?2'd0:(fbram1_read_addr+18'd1);
                fbram2_read_addr<=(fbram2_read_addr==(Nooffilters-2'd1))?2'd0:(fbram2_read_addr+18'd1);
                fbram3_read_addr<=(fbram3_read_addr==(Nooffilters-2'd1))?2'd0:(fbram3_read_addr+18'd1);
                fbram4_read_addr<=(fbram4_read_addr==(Nooffilters-2'd1))?2'd0:(fbram4_read_addr+18'd1);
                fbram5_read_addr<=(fbram5_read_addr==(Nooffilters-2'd1))?2'd0:(fbram5_read_addr+18'd1);
                fbram6_read_addr<=(fbram6_read_addr==(Nooffilters-2'd1))?2'd0:(fbram6_read_addr+18'd1);
                fbram7_read_addr<=(fbram7_read_addr==(Nooffilters-2'd1))?2'd0:(fbram7_read_addr+18'd1);
                fbram8_read_addr<=(fbram8_read_addr==(Nooffilters-2'd1))?2'd0:(fbram8_read_addr+18'd1);
                fbram9_read_addr<=(fbram9_read_addr==(Nooffilters-2'd1))?2'd0:(fbram9_read_addr+18'd1);
                
                //Input_update_enable2 <=(filter_counter >= Nooffilters-1) ? 1'b1: 1'b0;
                filter_counter <= (filter_counter >=Nooffilters-1 ) ? 2'd0:(filter_counter+2'd1);
                //Input_curr_col<= (filter_counter>= Nooffilters-1) ? (Input_curr_col+18'd1)%Input_max_col:(Input_curr_col);
               
                if(flagwbuffer == 1'b0) begin
                            lbram1_read_addr <= (lbram1_read_addr+Input_max_col-18'd1)%Input_max_col;
                            lbram2_read_addr <= (lbram2_read_addr+Input_max_col-18'd1)%Input_max_col;
                            lbram3_read_addr <= (lbram3_read_addr+Input_max_col-18'd1)%Input_max_col;
                            //lbram1_write_addr <= (lbram1_write_addr+Input_max_col-18'd1)%Input_max_col;
                            //lbram2_write_addr <= (lbram2_write_addr+Input_max_col-18'd1)%Input_max_col;
                            //lbram3_write_addr <= (lbram3_write_addr+Input_max_col-18'd1)%Input_max_col;
                            Input_curr_row <= (Input_curr_row+Input_max_col-18'd1)%Input_max_col;
                            Input_curr_col <= (Input_curr_col+Input_max_col-18'd1)%Input_max_col;
                            Input_read_addr_reg <= (Input_read_addr_reg-18'd1);
                            flagwbuffer <= 1'b1;
                end else begin
                   if(filter_counter ==  Nooffilters-1 ) begin
                       Input_curr_col<=(Input_curr_col==(Input_max_col-18'd1))?18'd0:(Input_curr_col+18'd1);
                       Input_curr_row<=(Input_curr_col==(Input_max_col-18'd1))?(Input_curr_row+18'd1):Input_curr_row;
                       
                    
                       Input_read_addr_reg<=(Input_max_row*Input_curr_row)+Input_curr_col; 
                       
                       lbram3_we<=6'b111111;
                       lbram2_we<=6'b111111;
                       lbram1_we<=6'b111111;       
                       
                       lbram1_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd1)%Input_max_col;
                       lbram2_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd1)%Input_max_col;
                       lbram3_write_addr<=(Input_curr_col[8:0]+Input_max_col-18'd1)%Input_max_col;
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
                       
                  end
               end
        end
      end  
   end
 
 always@(posedge clk && filter_inter_update_en && !reset) begin
    
     fbram1_inter_read_addr<=(fbram1_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram1_inter_read_addr+18'd1);
     fbram2_inter_read_addr<=(fbram2_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram2_inter_read_addr+18'd1);
     fbram3_inter_read_addr<=(fbram3_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram3_inter_read_addr+18'd1);
     fbram4_inter_read_addr<=(fbram4_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram4_inter_read_addr+18'd1);
     fbram5_inter_read_addr<=(fbram5_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram5_inter_read_addr+18'd1);
     fbram6_inter_read_addr<=(fbram6_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram6_inter_read_addr+18'd1);
     fbram7_inter_read_addr<=(fbram7_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram7_inter_read_addr+18'd1);
     fbram8_inter_read_addr<=(fbram8_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram8_inter_read_addr+18'd1);
     fbram9_inter_read_addr<=(fbram9_inter_read_addr==(Nooffilters-2'd1))?18'd0:(fbram9_inter_read_addr+18'd1);
     
     //if(Output_inter_BRAM_we_reg == 1'b0 && fbram1_inter_read_addr == (Nooffilters-2'd1)) begin
     //   filter_inter_update_en <= 1'b0;
     //end
 end
 
   
 always@(posedge clk && Output_inter_BRAM_we_reg && !reset) begin
    InterOutput_counter <= (InterOutput_counter >=Nooffilters) ? 2'd1:(InterOutput_counter+2'd1);
    InterInput[15:0]  <= (InterOutput_counter == 2'b01) ? Output_inter_write_data : InterInput[15:0];
    InterInput[31:16] <= (InterOutput_counter == 2'b10) ? Output_inter_write_data : InterInput[31:16];
    InterInput[47:32] <= (InterOutput_counter == 2'b11) ? Output_inter_write_data : InterInput[47:32];
    
    if(InterOutput_counter == 2'b01) begin
        flag_InterInput <= 1'b1;
    end
   
    if((Input_inter_read_addr_reg == start_inter_conv_addr-18'd1) && (InterOutput_counter == 2'b11) ) begin
        filter_inter_update_en <= 1'b1;
    end else begin
        if(Input_inter_read_addr_reg >= MaxSizeOfInput + 18'd2 ) begin
            filter_inter_update_en <= 1'b0;
            done_conv<=1;
        end
    end
    
    if(filter_inter_update_en ==1'b1) begin
            enable_conv2 <= 1'b1;
    end
    
    if((lbram1_inter_write_addr == 9'd0) && (Input_inter_curr_row < Input_max_row - 9'd2 )) begin
        pad_enable <= 1'b0;
    end else begin  
        if((lbram1_inter_write_addr == Input_max_col-3'd2)) begin
            pad_enable <= 1'b1;
        end 
    end
    
    if(InterOutput_counter == 2'b01 && flag_InterInput == 1'b1) begin
    
            Input_inter_curr_col<=(Input_inter_curr_col==(Input_max_col-18'd1))?18'd0:(Input_inter_curr_col+18'd1);
            Input_inter_curr_row<=(Input_inter_curr_col==(Input_max_col-18'd1))?(Input_inter_curr_row+18'd1):Input_inter_curr_row;
       
            Input_inter_read_addr_reg<=(Input_max_row*Input_inter_curr_row)+Input_inter_curr_col;
            
            lbram1_inter_read_addr<=(lbram1_inter_read_addr==(Input_max_col-18'd1))?18'd0:(lbram1_inter_read_addr+18'd1);
            lbram2_inter_read_addr<=(lbram2_inter_read_addr==(Input_max_col-18'd1))?18'd0:(lbram2_inter_read_addr+18'd1);
            lbram3_inter_read_addr<=(lbram3_inter_read_addr==(Input_max_col-18'd1))?18'd0:(lbram3_inter_read_addr+18'd1);
            
            lbram1_inter_write_addr<=(lbram1_inter_write_addr==(Input_max_col-18'd1))?18'd0:(lbram1_inter_write_addr+18'd1);
            lbram2_inter_write_addr<=(lbram1_inter_write_addr==(Input_max_col-18'd1))?18'd0:(lbram1_inter_write_addr+18'd1);
            lbram3_inter_write_addr<=(lbram1_inter_write_addr==(Input_max_col-18'd1))?18'd0:(lbram1_inter_write_addr+18'd1);
            
            lbram3_inter_we<=6'b111111;
            lbram2_inter_we<=6'b111111;
            lbram1_inter_we<=6'b111111;       
            
            lbram1_inter_write_data<=lbram2_inter_read_data;
            lbram2_inter_write_data<=lbram3_inter_read_data;
            if(pad_enable == 1'b0) begin
                lbram3_inter_write_data<=InterInput;
            end else begin
                if(pad_enable == 1'b1) begin
                    lbram3_inter_write_data<=48'd0;
                end
            end
            //lbram3_inter_write_data<=InterInput;
            
            //shift and update window buffer
            wbuffer_inter[0][0]<=wbuffer_inter[0][1];
            wbuffer_inter[1][0]<=wbuffer_inter[1][1];
            wbuffer_inter[2][0]<=wbuffer_inter[2][1];
            wbuffer_inter[0][1]<=wbuffer_inter[0][2];
            wbuffer_inter[1][1]<=wbuffer_inter[1][2];
            wbuffer_inter[2][1]<=wbuffer_inter[2][2];             
            wbuffer_inter[0][2]<=lbram1_inter_read_data;
            wbuffer_inter[1][2]<=lbram2_inter_read_data;
            wbuffer_inter[2][2]<=lbram3_inter_read_data;
    end
    ////////////////////////////As lead to multiple drivers/////////////////////
    //if(Input_inter_read_addr_reg >= MaxSizeOfInput + 18'd2 ) begin
    //        Output_inter_BRAM_we_reg <= 1'b0;
    //end
 end
     
 //write protect lbram      
/*always@(posedge clk &!Input_update_enable)
   begin
        lbram1_we<=2'd0;
        lbram2_we<=2'd0;
        lbram3_we<=2'd0;  
   end
*/

always@(posedge clk && !reset)
    begin
        filter_update_en<=filter_update_temp;
        Output_finalSum_write_data1<=Output_finalSum_write_data;
        case(curr_state)
        18'd0:
        begin    
          Input_addr_reset<=1'b0;
          Input_addr_en<=1'b1;
          curr_state<=18'd1;
        end
        18'd1:
        begin    
           Input_update_enable_flag<=1'b1;
           curr_state <= 18'd3;           
        end
        18'd2:
         begin
      //     filter_update_en <= 1'b1; 
         end
        18'd3:
            begin
            //buffer state
            end
        18'd4:
            begin
            //enable_conv<=0;
            end           
        endcase
    end
    
endmodule