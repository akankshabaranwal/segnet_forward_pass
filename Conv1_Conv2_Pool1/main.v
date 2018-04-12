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

// Output of the first Convolution Layer
wire [15:0] Output_inter_write_data;
wire [1:0] Output_inter_BRAM_we;
reg [1:0] Output_inter_BRAM_we_reg;
// Output of the individual filter without summing
wire [47:0] Output_read_data;
wire [47:0] Output_write_data;
wire [5:0] Output_BRAM_we;
wire [5:0] Output_BRAM_we_temp;
wire [5:0] Output_BRAM_we_temp_temp;


// Output of final Convolution layer
wire [15:0] Output_finalSum_write_data;
wire [1:0] Output_finalSum_BRAM_we;
// without sum
wire [1023:0] Output_final_write_data;       // changed
wire [5:0] Output_final_BRAM_we;
wire [5:0] Output_final_BRAM_we_temp;
wire [5:0] Output_final_BRAM_we_temp_temp;
wire [5:0] Output_final_BRAM_we_temp_temp_temp;
wire [5:0] Output_final_BRAM_we_temp_temp_temp_temp;
wire [5:0] Output_final_BRAM_we_temp6;
wire [5:0] Output_final_BRAM_we_temp7;
wire [5:0] Output_final_BRAM_we_temp8;
wire [5:0] Output_final_BRAM_we_temp9;
wire [5:0] Output_final_BRAM_we_temp10;
wire [5:0] Output_final_BRAM_we_temp11;
wire [5:0] Output_final_BRAM_we_temp12;
wire [5:0] Output_final_BRAM_we_temp13;
wire [5:0] Output_final_BRAM_we_temp14;
wire [5:0] Output_final_BRAM_we_temp15;
wire [5:0] Output_final_BRAM_we_temp16;
wire [5:0] Output_final_BRAM_we_temp17;
wire [5:0] Output_final_BRAM_we_temp18;
wire [5:0] Output_final_BRAM_we_temp19;
wire [5:0] Output_final_BRAM_we_temp20;
wire [5:0] Output_final_BRAM_we_temp21;
wire [5:0] Output_final_BRAM_we_temp22;
wire [5:0] Output_final_BRAM_we_temp23;
wire [5:0] Output_final_BRAM_we_temp24;
wire [5:0] Output_final_BRAM_we_temp25;
wire [5:0] Output_final_BRAM_we_temp26;
wire [5:0] Output_final_BRAM_we_temp27;
wire [5:0] Output_final_BRAM_we_temp28;
wire [5:0] Output_final_BRAM_we_temp29;
wire [5:0] Output_final_BRAM_we_temp30;
wire [5:0] Output_final_BRAM_we_temp31;
wire [5:0] Output_final_BRAM_we_temp32;
wire [5:0] Output_final_BRAM_we_temp33;
wire [5:0] Output_final_BRAM_we_temp34;
wire [5:0] Output_final_BRAM_we_temp35;
wire [5:0] Output_final_BRAM_we_temp36;
wire [5:0] Output_final_BRAM_we_temp37;
wire [5:0] Output_final_BRAM_we_temp38;
wire [5:0] Output_final_BRAM_we_temp39;
wire [5:0] Output_final_BRAM_we_temp40;
wire [5:0] Output_final_BRAM_we_temp41;
wire [5:0] Output_final_BRAM_we_temp42;
wire [5:0] Output_final_BRAM_we_temp43;
wire [5:0] Output_final_BRAM_we_temp44;
wire [5:0] Output_final_BRAM_we_temp45;
wire [5:0] Output_final_BRAM_we_temp46;
wire [5:0] Output_final_BRAM_we_temp47;
wire [5:0] Output_final_BRAM_we_temp48;
wire [5:0] Output_final_BRAM_we_temp49;
wire [5:0] Output_final_BRAM_we_temp50;
wire [5:0] Output_final_BRAM_we_temp51;
wire [5:0] Output_final_BRAM_we_temp52;
wire [5:0] Output_final_BRAM_we_temp53;
wire [5:0] Output_final_BRAM_we_temp54;
wire [5:0] Output_final_BRAM_we_temp55;
wire [5:0] Output_final_BRAM_we_temp56;
wire [5:0] Output_final_BRAM_we_temp57;
wire [5:0] Output_final_BRAM_we_temp58;
wire [5:0] Output_final_BRAM_we_temp59;
wire [5:0] Output_final_BRAM_we_temp60;
wire [5:0] Output_final_BRAM_we_temp61;
wire [5:0] Output_final_BRAM_we_temp62;
wire [5:0] Output_final_BRAM_we_temp63;
wire [5:0] Output_final_BRAM_we_temp64;

// current state
reg [17:0] curr_state;

// Lbram 1
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

reg [8:0] lbram1_read_addr;
reg [8:0] lbram2_read_addr;
reg [8:0] lbram3_read_addr;

reg [8:0] lbram1_write_addr;
reg [8:0] lbram2_write_addr;
reg [8:0] lbram3_write_addr;

// wbuffer 1
reg [47:0] wbuffer [0:2][0:2];
reg [143:0] wbuffer_full1;
reg [143:0] wbuffer_full2;
reg [143:0] wbuffer_full3;

// LBRAM 2
wire [1023:0] lbram1_inter_read_data; // changed
reg lbram1A_inter_en;
reg [127:0] lbram1_inter_we;          // changed
wire [1023:0] lbram2_inter_read_data;
reg lbram2A_inter_en;
reg [127:0] lbram2_inter_we;
wire [1023:0] lbram3_inter_read_data;
reg lbram3A_inter_en;
reg [127:0] lbram3_inter_we;
reg [1023:0] lbram1_inter_write_data;
reg lbram1B_inter_en;
reg [1023:0] lbram2_inter_write_data;
reg lbram2B_inter_en;
reg [1023:0] lbram3_inter_write_data;
reg lbram3B_inter_en;

reg [8:0] lbram1_inter_read_addr;
reg [8:0] lbram2_inter_read_addr;
reg [8:0] lbram3_inter_read_addr;
reg [8:0] lbram1_inter_write_addr;
reg [8:0] lbram2_inter_write_addr;
reg [8:0] lbram3_inter_write_addr;

// wbuffer 2
reg [1023:0] wbuffer_inter [0:2][0:2];
reg [143:0] wbuffer_inter_full1;
reg [143:0] wbuffer_inter_full2;
reg [143:0] wbuffer_inter_full3;
reg [143:0] wbuffer_inter_full4; // changed
reg [143:0] wbuffer_inter_full5; // changed
reg [143:0] wbuffer_inter_full6;
reg [143:0] wbuffer_inter_full7;
reg [143:0] wbuffer_inter_full8;
reg [143:0] wbuffer_inter_full9;
reg [143:0] wbuffer_inter_full10;
reg [143:0] wbuffer_inter_full11;
reg [143:0] wbuffer_inter_full12;
reg [143:0] wbuffer_inter_full13;
reg [143:0] wbuffer_inter_full14;
reg [143:0] wbuffer_inter_full15;
reg [143:0] wbuffer_inter_full16;
reg [143:0] wbuffer_inter_full17;
reg [143:0] wbuffer_inter_full18;
reg [143:0] wbuffer_inter_full19;
reg [143:0] wbuffer_inter_full20;
reg [143:0] wbuffer_inter_full21;
reg [143:0] wbuffer_inter_full22;
reg [143:0] wbuffer_inter_full23;
reg [143:0] wbuffer_inter_full24;
reg [143:0] wbuffer_inter_full25;
reg [143:0] wbuffer_inter_full26;
reg [143:0] wbuffer_inter_full27;
reg [143:0] wbuffer_inter_full28;
reg [143:0] wbuffer_inter_full29;
reg [143:0] wbuffer_inter_full30;
reg [143:0] wbuffer_inter_full31;
reg [143:0] wbuffer_inter_full32;
reg [143:0] wbuffer_inter_full33;
reg [143:0] wbuffer_inter_full34;
reg [143:0] wbuffer_inter_full35;
reg [143:0] wbuffer_inter_full36;
reg [143:0] wbuffer_inter_full37;
reg [143:0] wbuffer_inter_full38;
reg [143:0] wbuffer_inter_full39;
reg [143:0] wbuffer_inter_full40;
reg [143:0] wbuffer_inter_full41;
reg [143:0] wbuffer_inter_full42;
reg [143:0] wbuffer_inter_full43;
reg [143:0] wbuffer_inter_full44;
reg [143:0] wbuffer_inter_full45;
reg [143:0] wbuffer_inter_full46;
reg [143:0] wbuffer_inter_full47;
reg [143:0] wbuffer_inter_full48;
reg [143:0] wbuffer_inter_full49;
reg [143:0] wbuffer_inter_full50;
reg [143:0] wbuffer_inter_full51;
reg [143:0] wbuffer_inter_full52;
reg [143:0] wbuffer_inter_full53;
reg [143:0] wbuffer_inter_full54;
reg [143:0] wbuffer_inter_full55;
reg [143:0] wbuffer_inter_full56;
reg [143:0] wbuffer_inter_full57;
reg [143:0] wbuffer_inter_full58;
reg [143:0] wbuffer_inter_full59;
reg [143:0] wbuffer_inter_full60;
reg [143:0] wbuffer_inter_full61;
reg [143:0] wbuffer_inter_full62;
reg [143:0] wbuffer_inter_full63;
reg [143:0] wbuffer_inter_full64;
//reg [63:0] final_inter_output1;
// Address at which first Wbuffer completes
reg [17:0] start_conv_addr;
reg [17:0] start_inter_conv_addr;

// filter BRAM 1
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
reg [1023:0] fbram1_inter_write_data;
reg fbramA1_inter_en;
reg [127:0] fbram1_inter_we;
reg [8:0] fbram1_inter_read_addr;
wire [1023:0] fbram1_inter_read_data;
reg fbramB1_inter_en;

reg [8:0] fbram2_inter_write_addr;
reg [1023:0] fbram2_inter_write_data;
reg fbramA2_inter_en;
reg [127:0] fbram2_inter_we;
reg [8:0] fbram2_inter_read_addr;
wire [1023:0] fbram2_inter_read_data;
reg fbramB2_inter_en;

reg [8:0] fbram3_inter_write_addr;
reg [1023:0] fbram3_inter_write_data;
reg fbramA3_inter_en;
reg [127:0] fbram3_inter_we;
reg [8:0] fbram3_inter_read_addr;
wire [1023:0] fbram3_inter_read_data;
reg fbramB3_inter_en;

reg [8:0] fbram4_inter_write_addr;
reg [1023:0] fbram4_inter_write_data;
reg fbramA4_inter_en;
reg [127:0] fbram4_inter_we;
reg [8:0] fbram4_inter_read_addr;
wire [1023:0] fbram4_inter_read_data;
reg fbramB4_inter_en;

reg [8:0] fbram5_inter_write_addr;
reg [1023:0] fbram5_inter_write_data;
reg fbramA5_inter_en;
reg [127:0] fbram5_inter_we;
reg [8:0] fbram5_inter_read_addr;
wire [1023:0] fbram5_inter_read_data;
reg fbramB5_inter_en;

reg [8:0] fbram6_inter_write_addr;
reg [1023:0] fbram6_inter_write_data;
reg fbramA6_inter_en;
reg [127:0] fbram6_inter_we;
reg [8:0] fbram6_inter_read_addr;
wire [1023:0] fbram6_inter_read_data;
reg fbramB6_inter_en;

reg [8:0] fbram7_inter_write_addr;
reg [1023:0] fbram7_inter_write_data;
reg fbramA7_inter_en;
reg [127:0] fbram7_inter_we;
reg [8:0] fbram7_inter_read_addr;
wire [1023:0] fbram7_inter_read_data;
reg fbramB7_inter_en;

reg [8:0] fbram8_inter_write_addr;
reg [1023:0] fbram8_inter_write_data;
reg fbramA8_inter_en;
reg [127:0] fbram8_inter_we;
reg [8:0] fbram8_inter_read_addr;
wire [1023:0] fbram8_inter_read_data;
reg fbramB8_inter_en;

reg [8:0] fbram9_inter_write_addr;
reg [1023:0] fbram9_inter_write_data;  // changed
reg fbramA9_inter_en;
reg [127:0] fbram9_inter_we; // changed
reg [8:0] fbram9_inter_read_addr;
wire [1023:0] fbram9_inter_read_data; // changed
reg fbramB9_inter_en;

reg filter_inter_update_en;

reg [47:0] filter [0:2][0:2];
reg [143:0] filter_full1;
reg [143:0] filter_full2;
reg [143:0] filter_full3;

reg [1023:0] filter_inter [0:2][0:2];
reg [143:0] filter_inter_full1;
reg [143:0] filter_inter_full2;
reg [143:0] filter_inter_full3;
reg [143:0] filter_inter_full4; // changed
reg [143:0] filter_inter_full5;
reg [143:0] filter_inter_full6;
reg [143:0] filter_inter_full7;
reg [143:0] filter_inter_full8;
reg [143:0] filter_inter_full9;
reg [143:0] filter_inter_full10;
reg [143:0] filter_inter_full11;
reg [143:0] filter_inter_full12;
reg [143:0] filter_inter_full13;
reg [143:0] filter_inter_full14;
reg [143:0] filter_inter_full15;
reg [143:0] filter_inter_full16;
reg [143:0] filter_inter_full17;
reg [143:0] filter_inter_full18;
reg [143:0] filter_inter_full19;
reg [143:0] filter_inter_full20;
reg [143:0] filter_inter_full21;
reg [143:0] filter_inter_full22;
reg [143:0] filter_inter_full23;
reg [143:0] filter_inter_full24;
reg [143:0] filter_inter_full25;
reg [143:0] filter_inter_full26;
reg [143:0] filter_inter_full27;
reg [143:0] filter_inter_full28;
reg [143:0] filter_inter_full29;
reg [143:0] filter_inter_full30;
reg [143:0] filter_inter_full31;
reg [143:0] filter_inter_full32;
reg [143:0] filter_inter_full33;
reg [143:0] filter_inter_full34;
reg [143:0] filter_inter_full35;
reg [143:0] filter_inter_full36;
reg [143:0] filter_inter_full37;
reg [143:0] filter_inter_full38;
reg [143:0] filter_inter_full39;
reg [143:0] filter_inter_full40;
reg [143:0] filter_inter_full41;
reg [143:0] filter_inter_full42;
reg [143:0] filter_inter_full43;
reg [143:0] filter_inter_full44;
reg [143:0] filter_inter_full45;
reg [143:0] filter_inter_full46;
reg [143:0] filter_inter_full47;
reg [143:0] filter_inter_full48;
reg [143:0] filter_inter_full49;
reg [143:0] filter_inter_full50;
reg [143:0] filter_inter_full51;
reg [143:0] filter_inter_full52;
reg [143:0] filter_inter_full53;
reg [143:0] filter_inter_full54;
reg [143:0] filter_inter_full55;
reg [143:0] filter_inter_full56;
reg [143:0] filter_inter_full57;
reg [143:0] filter_inter_full58;
reg [143:0] filter_inter_full59;
reg [143:0] filter_inter_full60;
reg [143:0] filter_inter_full61;
reg [143:0] filter_inter_full62;
reg [143:0] filter_inter_full63;
reg [143:0] filter_inter_full64;

reg enable_conv;
reg enable_conv2;
reg enable_inter_conv;
reg enable_final_conv;
reg write_output;
reg [8:0] filter_counter;  // changed
reg [8:0]Nooffilters;
reg [8:0]InterOutput_counter;

reg flagwbuffer;
reg flagwbuffer2;
reg [1023:0] InterInput; 
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
        Input_inter_curr_col<=18'd223; //  changed
        Input_max_row<=18'd224; // changed
        Input_max_col<=18'd224; // changed
        flagwbuffer <= 1'b0;
        flagwbuffer <= 1'b0;
        Output_inter_BRAM_we_reg <= 1'b0;
        filter_update_temp<=1'b0;
        Input_addr_en<=1'b0;
        Input_addr_reset<=1'b1;
        Input_update_enable<=1'b1;
        Input_update_enable2<=1'b0;
        Input_update_enable_flag<=1'b0;
        //Output_inter_addr_en<=1'b0;
        //Output_inter_addr_reset<=1'b1;
        //Output_inter_update_enable<=1'b0;
        
        start_conv_addr<=18'd675; // changed
        ///////////////////start_inter_conv = 3*maxcol - 1////////////////////////
        start_inter_conv_addr <= 18'd672; // changed
        MaxSizeOfInput<= 18'd50176; // changed
        filter_counter <= 9'd64; // changed
        Nooffilters <= 9'd64;
        InterOutput_counter <= 9'd0;
        InterInput <= 1024'd0;
        
        //input BRAM variable initialisation
        Input_write_addr_reg<=18'b0;
        Input_BRAMA_en<=1'b0;
        Input_BRAMB_en<=1'b1;
        Input_BRAM_we<=6'd0;
        Input_read_addr_reg<=18'd0;
        Input_inter_read_addr_reg <= 18'd0;
        
        //Output_inter_BRAMA_en<=1'b0;
        //Output_inter_BRAMB_en<=1'b1;
        
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
        lbram1_inter_we<=128'd0;
        lbram2A_inter_en<=1'b1;
        lbram2B_inter_en<=1'b1;
        lbram2_inter_we<=128'd0;
        lbram3A_inter_en<=1'b1;
        lbram3B_inter_en<=1'b1;
        lbram3_inter_we<=128'd0;   
        
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
        fbram1_inter_we<=128'd0;
        fbram1_inter_read_addr<=9'd0;
        fbramB1_inter_en<=1'b1;
        
        fbram2_inter_write_addr<=9'b0;        
        fbramA2_inter_en<=1'b1;
        fbram2_inter_we<=128'd0;
        fbram2_inter_read_addr<=9'd0;
        fbramB2_inter_en<=1'b1;
        
        fbram3_inter_write_addr<=9'b0;        
        fbramA3_inter_en<=1'b1;
        fbram3_inter_we<=128'd0;
        fbram3_inter_read_addr<=9'd0;
        fbramB3_inter_en<=1'b1;
        
        fbram4_inter_write_addr<=9'b0;        
        fbramA4_inter_en<=1'b1;
        fbram4_inter_we<=128'd0;
        fbram4_inter_read_addr<=9'd0;
        fbramB4_inter_en<=1'b1;
        
        fbram5_inter_write_addr<=9'b0;        
        fbramA5_inter_en<=1'b1;
        fbram5_inter_we<=128'd0;
        fbram5_inter_read_addr<=9'd0;
        fbramB5_inter_en<=1'b1;
        
        fbram6_inter_write_addr<=9'b0;        
        fbramA6_inter_en<=1'b1;
        fbram6_inter_we<=128'd0;
        fbram6_inter_read_addr<=9'd0;
        fbramB6_inter_en<=1'b1;
        
        fbram7_inter_write_addr<=9'b0;        
        fbramA7_inter_en<=1'b1;
        fbram7_inter_we<=128'd0;
        fbram7_inter_read_addr<=9'd0;
        fbramB7_inter_en<=1'b1;
        
        fbram8_inter_write_addr<=9'b0;        
        fbramA8_inter_en<=1'b1;
        fbram8_inter_we<=128'd0;
        fbram8_inter_read_addr<=9'd0;
        fbramB8_inter_en<=1'b1;
        
        fbram9_inter_write_addr<=9'b0;        
        fbramA9_inter_en<=1'b1;
        fbram9_inter_we<=128'd0;
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
    filter_inter_full4[15:0]    <= filter_inter[0][0][63:48];
    filter_inter_full4[31:16]   <= filter_inter[0][1][63:48];
    filter_inter_full4[47:32]   <= filter_inter[0][2][63:48];
    filter_inter_full4[63:48]   <= filter_inter[1][0][63:48];
    filter_inter_full4[79:64]   <= filter_inter[1][1][63:48];
    filter_inter_full4[95:80]   <= filter_inter[1][2][63:48];
    filter_inter_full4[111:96]  <= filter_inter[2][0][63:48];
    filter_inter_full4[127:112] <= filter_inter[2][1][63:48];
    filter_inter_full4[143:128] <= filter_inter[2][2][63:48];
end
always@(*) begin
    filter_inter_full5[15:0]    <= filter_inter[0][0][79:64];
    filter_inter_full5[31:16]   <= filter_inter[0][1][79:64];
    filter_inter_full5[47:32]   <= filter_inter[0][2][79:64];
    filter_inter_full5[63:48]   <= filter_inter[1][0][79:64];
    filter_inter_full5[79:64]   <= filter_inter[1][1][79:64];
    filter_inter_full5[95:80]   <= filter_inter[1][2][79:64];
    filter_inter_full5[111:96]  <= filter_inter[2][0][79:64];
    filter_inter_full5[127:112] <= filter_inter[2][1][79:64];
    filter_inter_full5[143:128] <= filter_inter[2][2][79:64];
end
always@(*) begin
	filter_inter_full6[15:0]    <= filter_inter[0][0][95:80];
	filter_inter_full6[31:16]   <= filter_inter[0][1][95:80];
	filter_inter_full6[47:32]   <= filter_inter[0][2][95:80];
	filter_inter_full6[63:48]   <= filter_inter[1][0][95:80];
	filter_inter_full6[79:64]   <= filter_inter[1][1][95:80];
	filter_inter_full6[95:80]   <= filter_inter[1][2][95:80];
	filter_inter_full6[111:96]  <= filter_inter[2][0][95:80];
	filter_inter_full6[127:112] <= filter_inter[2][1][95:80];
	filter_inter_full6[143:128] <= filter_inter[2][2][95:80];
end
always@(*) begin
	filter_inter_full7[15:0]    <= filter_inter[0][0][111:96];
	filter_inter_full7[31:16]   <= filter_inter[0][1][111:96];
	filter_inter_full7[47:32]   <= filter_inter[0][2][111:96];
	filter_inter_full7[63:48]   <= filter_inter[1][0][111:96];
	filter_inter_full7[79:64]   <= filter_inter[1][1][111:96];
	filter_inter_full7[95:80]   <= filter_inter[1][2][111:96];
	filter_inter_full7[111:96]  <= filter_inter[2][0][111:96];
	filter_inter_full7[127:112] <= filter_inter[2][1][111:96];
	filter_inter_full7[143:128] <= filter_inter[2][2][111:96];
end
always@(*) begin
	filter_inter_full8[15:0]    <= filter_inter[0][0][127:112];
	filter_inter_full8[31:16]   <= filter_inter[0][1][127:112];
	filter_inter_full8[47:32]   <= filter_inter[0][2][127:112];
	filter_inter_full8[63:48]   <= filter_inter[1][0][127:112];
	filter_inter_full8[79:64]   <= filter_inter[1][1][127:112];
	filter_inter_full8[95:80]   <= filter_inter[1][2][127:112];
	filter_inter_full8[111:96]  <= filter_inter[2][0][127:112];
	filter_inter_full8[127:112] <= filter_inter[2][1][127:112];
	filter_inter_full8[143:128] <= filter_inter[2][2][127:112];
end
always@(*) begin
	filter_inter_full9[15:0]    <= filter_inter[0][0][143:128];
	filter_inter_full9[31:16]   <= filter_inter[0][1][143:128];
	filter_inter_full9[47:32]   <= filter_inter[0][2][143:128];
	filter_inter_full9[63:48]   <= filter_inter[1][0][143:128];
	filter_inter_full9[79:64]   <= filter_inter[1][1][143:128];
	filter_inter_full9[95:80]   <= filter_inter[1][2][143:128];
	filter_inter_full9[111:96]  <= filter_inter[2][0][143:128];
	filter_inter_full9[127:112] <= filter_inter[2][1][143:128];
	filter_inter_full9[143:128] <= filter_inter[2][2][143:128];
end
always@(*) begin
	filter_inter_full10[15:0]    <= filter_inter[0][0][159:144];
	filter_inter_full10[31:16]   <= filter_inter[0][1][159:144];
	filter_inter_full10[47:32]   <= filter_inter[0][2][159:144];
	filter_inter_full10[63:48]   <= filter_inter[1][0][159:144];
	filter_inter_full10[79:64]   <= filter_inter[1][1][159:144];
	filter_inter_full10[95:80]   <= filter_inter[1][2][159:144];
	filter_inter_full10[111:96]  <= filter_inter[2][0][159:144];
	filter_inter_full10[127:112] <= filter_inter[2][1][159:144];
	filter_inter_full10[143:128] <= filter_inter[2][2][159:144];
end
always@(*) begin
	filter_inter_full11[15:0]    <= filter_inter[0][0][175:160];
	filter_inter_full11[31:16]   <= filter_inter[0][1][175:160];
	filter_inter_full11[47:32]   <= filter_inter[0][2][175:160];
	filter_inter_full11[63:48]   <= filter_inter[1][0][175:160];
	filter_inter_full11[79:64]   <= filter_inter[1][1][175:160];
	filter_inter_full11[95:80]   <= filter_inter[1][2][175:160];
	filter_inter_full11[111:96]  <= filter_inter[2][0][175:160];
	filter_inter_full11[127:112] <= filter_inter[2][1][175:160];
	filter_inter_full11[143:128] <= filter_inter[2][2][175:160];
end
always@(*) begin
	filter_inter_full12[15:0]    <= filter_inter[0][0][191:176];
	filter_inter_full12[31:16]   <= filter_inter[0][1][191:176];
	filter_inter_full12[47:32]   <= filter_inter[0][2][191:176];
	filter_inter_full12[63:48]   <= filter_inter[1][0][191:176];
	filter_inter_full12[79:64]   <= filter_inter[1][1][191:176];
	filter_inter_full12[95:80]   <= filter_inter[1][2][191:176];
	filter_inter_full12[111:96]  <= filter_inter[2][0][191:176];
	filter_inter_full12[127:112] <= filter_inter[2][1][191:176];
	filter_inter_full12[143:128] <= filter_inter[2][2][191:176];
end
always@(*) begin
	filter_inter_full13[15:0]    <= filter_inter[0][0][207:192];
	filter_inter_full13[31:16]   <= filter_inter[0][1][207:192];
	filter_inter_full13[47:32]   <= filter_inter[0][2][207:192];
	filter_inter_full13[63:48]   <= filter_inter[1][0][207:192];
	filter_inter_full13[79:64]   <= filter_inter[1][1][207:192];
	filter_inter_full13[95:80]   <= filter_inter[1][2][207:192];
	filter_inter_full13[111:96]  <= filter_inter[2][0][207:192];
	filter_inter_full13[127:112] <= filter_inter[2][1][207:192];
	filter_inter_full13[143:128] <= filter_inter[2][2][207:192];
end
always@(*) begin
	filter_inter_full14[15:0]    <= filter_inter[0][0][223:208];
	filter_inter_full14[31:16]   <= filter_inter[0][1][223:208];
	filter_inter_full14[47:32]   <= filter_inter[0][2][223:208];
	filter_inter_full14[63:48]   <= filter_inter[1][0][223:208];
	filter_inter_full14[79:64]   <= filter_inter[1][1][223:208];
	filter_inter_full14[95:80]   <= filter_inter[1][2][223:208];
	filter_inter_full14[111:96]  <= filter_inter[2][0][223:208];
	filter_inter_full14[127:112] <= filter_inter[2][1][223:208];
	filter_inter_full14[143:128] <= filter_inter[2][2][223:208];
end
always@(*) begin
	filter_inter_full15[15:0]    <= filter_inter[0][0][239:224];
	filter_inter_full15[31:16]   <= filter_inter[0][1][239:224];
	filter_inter_full15[47:32]   <= filter_inter[0][2][239:224];
	filter_inter_full15[63:48]   <= filter_inter[1][0][239:224];
	filter_inter_full15[79:64]   <= filter_inter[1][1][239:224];
	filter_inter_full15[95:80]   <= filter_inter[1][2][239:224];
	filter_inter_full15[111:96]  <= filter_inter[2][0][239:224];
	filter_inter_full15[127:112] <= filter_inter[2][1][239:224];
	filter_inter_full15[143:128] <= filter_inter[2][2][239:224];
end
always@(*) begin
	filter_inter_full16[15:0]    <= filter_inter[0][0][255:240];
	filter_inter_full16[31:16]   <= filter_inter[0][1][255:240];
	filter_inter_full16[47:32]   <= filter_inter[0][2][255:240];
	filter_inter_full16[63:48]   <= filter_inter[1][0][255:240];
	filter_inter_full16[79:64]   <= filter_inter[1][1][255:240];
	filter_inter_full16[95:80]   <= filter_inter[1][2][255:240];
	filter_inter_full16[111:96]  <= filter_inter[2][0][255:240];
	filter_inter_full16[127:112] <= filter_inter[2][1][255:240];
	filter_inter_full16[143:128] <= filter_inter[2][2][255:240];
end
always@(*) begin
	filter_inter_full17[15:0]    <= filter_inter[0][0][271:256];
	filter_inter_full17[31:16]   <= filter_inter[0][1][271:256];
	filter_inter_full17[47:32]   <= filter_inter[0][2][271:256];
	filter_inter_full17[63:48]   <= filter_inter[1][0][271:256];
	filter_inter_full17[79:64]   <= filter_inter[1][1][271:256];
	filter_inter_full17[95:80]   <= filter_inter[1][2][271:256];
	filter_inter_full17[111:96]  <= filter_inter[2][0][271:256];
	filter_inter_full17[127:112] <= filter_inter[2][1][271:256];
	filter_inter_full17[143:128] <= filter_inter[2][2][271:256];
end
always@(*) begin
	filter_inter_full18[15:0]    <= filter_inter[0][0][287:272];
	filter_inter_full18[31:16]   <= filter_inter[0][1][287:272];
	filter_inter_full18[47:32]   <= filter_inter[0][2][287:272];
	filter_inter_full18[63:48]   <= filter_inter[1][0][287:272];
	filter_inter_full18[79:64]   <= filter_inter[1][1][287:272];
	filter_inter_full18[95:80]   <= filter_inter[1][2][287:272];
	filter_inter_full18[111:96]  <= filter_inter[2][0][287:272];
	filter_inter_full18[127:112] <= filter_inter[2][1][287:272];
	filter_inter_full18[143:128] <= filter_inter[2][2][287:272];
end
always@(*) begin
	filter_inter_full19[15:0]    <= filter_inter[0][0][303:288];
	filter_inter_full19[31:16]   <= filter_inter[0][1][303:288];
	filter_inter_full19[47:32]   <= filter_inter[0][2][303:288];
	filter_inter_full19[63:48]   <= filter_inter[1][0][303:288];
	filter_inter_full19[79:64]   <= filter_inter[1][1][303:288];
	filter_inter_full19[95:80]   <= filter_inter[1][2][303:288];
	filter_inter_full19[111:96]  <= filter_inter[2][0][303:288];
	filter_inter_full19[127:112] <= filter_inter[2][1][303:288];
	filter_inter_full19[143:128] <= filter_inter[2][2][303:288];
end
always@(*) begin
	filter_inter_full20[15:0]    <= filter_inter[0][0][319:304];
	filter_inter_full20[31:16]   <= filter_inter[0][1][319:304];
	filter_inter_full20[47:32]   <= filter_inter[0][2][319:304];
	filter_inter_full20[63:48]   <= filter_inter[1][0][319:304];
	filter_inter_full20[79:64]   <= filter_inter[1][1][319:304];
	filter_inter_full20[95:80]   <= filter_inter[1][2][319:304];
	filter_inter_full20[111:96]  <= filter_inter[2][0][319:304];
	filter_inter_full20[127:112] <= filter_inter[2][1][319:304];
	filter_inter_full20[143:128] <= filter_inter[2][2][319:304];
end
always@(*) begin
	filter_inter_full21[15:0]    <= filter_inter[0][0][335:320];
	filter_inter_full21[31:16]   <= filter_inter[0][1][335:320];
	filter_inter_full21[47:32]   <= filter_inter[0][2][335:320];
	filter_inter_full21[63:48]   <= filter_inter[1][0][335:320];
	filter_inter_full21[79:64]   <= filter_inter[1][1][335:320];
	filter_inter_full21[95:80]   <= filter_inter[1][2][335:320];
	filter_inter_full21[111:96]  <= filter_inter[2][0][335:320];
	filter_inter_full21[127:112] <= filter_inter[2][1][335:320];
	filter_inter_full21[143:128] <= filter_inter[2][2][335:320];
end
always@(*) begin
	filter_inter_full22[15:0]    <= filter_inter[0][0][351:336];
	filter_inter_full22[31:16]   <= filter_inter[0][1][351:336];
	filter_inter_full22[47:32]   <= filter_inter[0][2][351:336];
	filter_inter_full22[63:48]   <= filter_inter[1][0][351:336];
	filter_inter_full22[79:64]   <= filter_inter[1][1][351:336];
	filter_inter_full22[95:80]   <= filter_inter[1][2][351:336];
	filter_inter_full22[111:96]  <= filter_inter[2][0][351:336];
	filter_inter_full22[127:112] <= filter_inter[2][1][351:336];
	filter_inter_full22[143:128] <= filter_inter[2][2][351:336];
end
always@(*) begin
	filter_inter_full23[15:0]    <= filter_inter[0][0][367:352];
	filter_inter_full23[31:16]   <= filter_inter[0][1][367:352];
	filter_inter_full23[47:32]   <= filter_inter[0][2][367:352];
	filter_inter_full23[63:48]   <= filter_inter[1][0][367:352];
	filter_inter_full23[79:64]   <= filter_inter[1][1][367:352];
	filter_inter_full23[95:80]   <= filter_inter[1][2][367:352];
	filter_inter_full23[111:96]  <= filter_inter[2][0][367:352];
	filter_inter_full23[127:112] <= filter_inter[2][1][367:352];
	filter_inter_full23[143:128] <= filter_inter[2][2][367:352];
end
always@(*) begin
	filter_inter_full24[15:0]    <= filter_inter[0][0][383:368];
	filter_inter_full24[31:16]   <= filter_inter[0][1][383:368];
	filter_inter_full24[47:32]   <= filter_inter[0][2][383:368];
	filter_inter_full24[63:48]   <= filter_inter[1][0][383:368];
	filter_inter_full24[79:64]   <= filter_inter[1][1][383:368];
	filter_inter_full24[95:80]   <= filter_inter[1][2][383:368];
	filter_inter_full24[111:96]  <= filter_inter[2][0][383:368];
	filter_inter_full24[127:112] <= filter_inter[2][1][383:368];
	filter_inter_full24[143:128] <= filter_inter[2][2][383:368];
end
always@(*) begin
	filter_inter_full25[15:0]    <= filter_inter[0][0][399:384];
	filter_inter_full25[31:16]   <= filter_inter[0][1][399:384];
	filter_inter_full25[47:32]   <= filter_inter[0][2][399:384];
	filter_inter_full25[63:48]   <= filter_inter[1][0][399:384];
	filter_inter_full25[79:64]   <= filter_inter[1][1][399:384];
	filter_inter_full25[95:80]   <= filter_inter[1][2][399:384];
	filter_inter_full25[111:96]  <= filter_inter[2][0][399:384];
	filter_inter_full25[127:112] <= filter_inter[2][1][399:384];
	filter_inter_full25[143:128] <= filter_inter[2][2][399:384];
end
always@(*) begin
	filter_inter_full26[15:0]    <= filter_inter[0][0][415:400];
	filter_inter_full26[31:16]   <= filter_inter[0][1][415:400];
	filter_inter_full26[47:32]   <= filter_inter[0][2][415:400];
	filter_inter_full26[63:48]   <= filter_inter[1][0][415:400];
	filter_inter_full26[79:64]   <= filter_inter[1][1][415:400];
	filter_inter_full26[95:80]   <= filter_inter[1][2][415:400];
	filter_inter_full26[111:96]  <= filter_inter[2][0][415:400];
	filter_inter_full26[127:112] <= filter_inter[2][1][415:400];
	filter_inter_full26[143:128] <= filter_inter[2][2][415:400];
end
always@(*) begin
	filter_inter_full27[15:0]    <= filter_inter[0][0][431:416];
	filter_inter_full27[31:16]   <= filter_inter[0][1][431:416];
	filter_inter_full27[47:32]   <= filter_inter[0][2][431:416];
	filter_inter_full27[63:48]   <= filter_inter[1][0][431:416];
	filter_inter_full27[79:64]   <= filter_inter[1][1][431:416];
	filter_inter_full27[95:80]   <= filter_inter[1][2][431:416];
	filter_inter_full27[111:96]  <= filter_inter[2][0][431:416];
	filter_inter_full27[127:112] <= filter_inter[2][1][431:416];
	filter_inter_full27[143:128] <= filter_inter[2][2][431:416];
end
always@(*) begin
	filter_inter_full28[15:0]    <= filter_inter[0][0][447:432];
	filter_inter_full28[31:16]   <= filter_inter[0][1][447:432];
	filter_inter_full28[47:32]   <= filter_inter[0][2][447:432];
	filter_inter_full28[63:48]   <= filter_inter[1][0][447:432];
	filter_inter_full28[79:64]   <= filter_inter[1][1][447:432];
	filter_inter_full28[95:80]   <= filter_inter[1][2][447:432];
	filter_inter_full28[111:96]  <= filter_inter[2][0][447:432];
	filter_inter_full28[127:112] <= filter_inter[2][1][447:432];
	filter_inter_full28[143:128] <= filter_inter[2][2][447:432];
end
always@(*) begin
	filter_inter_full29[15:0]    <= filter_inter[0][0][463:448];
	filter_inter_full29[31:16]   <= filter_inter[0][1][463:448];
	filter_inter_full29[47:32]   <= filter_inter[0][2][463:448];
	filter_inter_full29[63:48]   <= filter_inter[1][0][463:448];
	filter_inter_full29[79:64]   <= filter_inter[1][1][463:448];
	filter_inter_full29[95:80]   <= filter_inter[1][2][463:448];
	filter_inter_full29[111:96]  <= filter_inter[2][0][463:448];
	filter_inter_full29[127:112] <= filter_inter[2][1][463:448];
	filter_inter_full29[143:128] <= filter_inter[2][2][463:448];
end
always@(*) begin
	filter_inter_full30[15:0]    <= filter_inter[0][0][479:464];
	filter_inter_full30[31:16]   <= filter_inter[0][1][479:464];
	filter_inter_full30[47:32]   <= filter_inter[0][2][479:464];
	filter_inter_full30[63:48]   <= filter_inter[1][0][479:464];
	filter_inter_full30[79:64]   <= filter_inter[1][1][479:464];
	filter_inter_full30[95:80]   <= filter_inter[1][2][479:464];
	filter_inter_full30[111:96]  <= filter_inter[2][0][479:464];
	filter_inter_full30[127:112] <= filter_inter[2][1][479:464];
	filter_inter_full30[143:128] <= filter_inter[2][2][479:464];
end
always@(*) begin
	filter_inter_full31[15:0]    <= filter_inter[0][0][495:480];
	filter_inter_full31[31:16]   <= filter_inter[0][1][495:480];
	filter_inter_full31[47:32]   <= filter_inter[0][2][495:480];
	filter_inter_full31[63:48]   <= filter_inter[1][0][495:480];
	filter_inter_full31[79:64]   <= filter_inter[1][1][495:480];
	filter_inter_full31[95:80]   <= filter_inter[1][2][495:480];
	filter_inter_full31[111:96]  <= filter_inter[2][0][495:480];
	filter_inter_full31[127:112] <= filter_inter[2][1][495:480];
	filter_inter_full31[143:128] <= filter_inter[2][2][495:480];
end
always@(*) begin
	filter_inter_full32[15:0]    <= filter_inter[0][0][511:496];
	filter_inter_full32[31:16]   <= filter_inter[0][1][511:496];
	filter_inter_full32[47:32]   <= filter_inter[0][2][511:496];
	filter_inter_full32[63:48]   <= filter_inter[1][0][511:496];
	filter_inter_full32[79:64]   <= filter_inter[1][1][511:496];
	filter_inter_full32[95:80]   <= filter_inter[1][2][511:496];
	filter_inter_full32[111:96]  <= filter_inter[2][0][511:496];
	filter_inter_full32[127:112] <= filter_inter[2][1][511:496];
	filter_inter_full32[143:128] <= filter_inter[2][2][511:496];
end
always@(*) begin
	filter_inter_full33[15:0]    <= filter_inter[0][0][527:512];
	filter_inter_full33[31:16]   <= filter_inter[0][1][527:512];
	filter_inter_full33[47:32]   <= filter_inter[0][2][527:512];
	filter_inter_full33[63:48]   <= filter_inter[1][0][527:512];
	filter_inter_full33[79:64]   <= filter_inter[1][1][527:512];
	filter_inter_full33[95:80]   <= filter_inter[1][2][527:512];
	filter_inter_full33[111:96]  <= filter_inter[2][0][527:512];
	filter_inter_full33[127:112] <= filter_inter[2][1][527:512];
	filter_inter_full33[143:128] <= filter_inter[2][2][527:512];
end
always@(*) begin
	filter_inter_full34[15:0]    <= filter_inter[0][0][543:528];
	filter_inter_full34[31:16]   <= filter_inter[0][1][543:528];
	filter_inter_full34[47:32]   <= filter_inter[0][2][543:528];
	filter_inter_full34[63:48]   <= filter_inter[1][0][543:528];
	filter_inter_full34[79:64]   <= filter_inter[1][1][543:528];
	filter_inter_full34[95:80]   <= filter_inter[1][2][543:528];
	filter_inter_full34[111:96]  <= filter_inter[2][0][543:528];
	filter_inter_full34[127:112] <= filter_inter[2][1][543:528];
	filter_inter_full34[143:128] <= filter_inter[2][2][543:528];
end
always@(*) begin
	filter_inter_full35[15:0]    <= filter_inter[0][0][559:544];
	filter_inter_full35[31:16]   <= filter_inter[0][1][559:544];
	filter_inter_full35[47:32]   <= filter_inter[0][2][559:544];
	filter_inter_full35[63:48]   <= filter_inter[1][0][559:544];
	filter_inter_full35[79:64]   <= filter_inter[1][1][559:544];
	filter_inter_full35[95:80]   <= filter_inter[1][2][559:544];
	filter_inter_full35[111:96]  <= filter_inter[2][0][559:544];
	filter_inter_full35[127:112] <= filter_inter[2][1][559:544];
	filter_inter_full35[143:128] <= filter_inter[2][2][559:544];
end
always@(*) begin
	filter_inter_full36[15:0]    <= filter_inter[0][0][575:560];
	filter_inter_full36[31:16]   <= filter_inter[0][1][575:560];
	filter_inter_full36[47:32]   <= filter_inter[0][2][575:560];
	filter_inter_full36[63:48]   <= filter_inter[1][0][575:560];
	filter_inter_full36[79:64]   <= filter_inter[1][1][575:560];
	filter_inter_full36[95:80]   <= filter_inter[1][2][575:560];
	filter_inter_full36[111:96]  <= filter_inter[2][0][575:560];
	filter_inter_full36[127:112] <= filter_inter[2][1][575:560];
	filter_inter_full36[143:128] <= filter_inter[2][2][575:560];
end
always@(*) begin
	filter_inter_full37[15:0]    <= filter_inter[0][0][591:576];
	filter_inter_full37[31:16]   <= filter_inter[0][1][591:576];
	filter_inter_full37[47:32]   <= filter_inter[0][2][591:576];
	filter_inter_full37[63:48]   <= filter_inter[1][0][591:576];
	filter_inter_full37[79:64]   <= filter_inter[1][1][591:576];
	filter_inter_full37[95:80]   <= filter_inter[1][2][591:576];
	filter_inter_full37[111:96]  <= filter_inter[2][0][591:576];
	filter_inter_full37[127:112] <= filter_inter[2][1][591:576];
	filter_inter_full37[143:128] <= filter_inter[2][2][591:576];
end
always@(*) begin
	filter_inter_full38[15:0]    <= filter_inter[0][0][607:592];
	filter_inter_full38[31:16]   <= filter_inter[0][1][607:592];
	filter_inter_full38[47:32]   <= filter_inter[0][2][607:592];
	filter_inter_full38[63:48]   <= filter_inter[1][0][607:592];
	filter_inter_full38[79:64]   <= filter_inter[1][1][607:592];
	filter_inter_full38[95:80]   <= filter_inter[1][2][607:592];
	filter_inter_full38[111:96]  <= filter_inter[2][0][607:592];
	filter_inter_full38[127:112] <= filter_inter[2][1][607:592];
	filter_inter_full38[143:128] <= filter_inter[2][2][607:592];
end
always@(*) begin
	filter_inter_full39[15:0]    <= filter_inter[0][0][623:608];
	filter_inter_full39[31:16]   <= filter_inter[0][1][623:608];
	filter_inter_full39[47:32]   <= filter_inter[0][2][623:608];
	filter_inter_full39[63:48]   <= filter_inter[1][0][623:608];
	filter_inter_full39[79:64]   <= filter_inter[1][1][623:608];
	filter_inter_full39[95:80]   <= filter_inter[1][2][623:608];
	filter_inter_full39[111:96]  <= filter_inter[2][0][623:608];
	filter_inter_full39[127:112] <= filter_inter[2][1][623:608];
	filter_inter_full39[143:128] <= filter_inter[2][2][623:608];
end
always@(*) begin
	filter_inter_full40[15:0]    <= filter_inter[0][0][639:624];
	filter_inter_full40[31:16]   <= filter_inter[0][1][639:624];
	filter_inter_full40[47:32]   <= filter_inter[0][2][639:624];
	filter_inter_full40[63:48]   <= filter_inter[1][0][639:624];
	filter_inter_full40[79:64]   <= filter_inter[1][1][639:624];
	filter_inter_full40[95:80]   <= filter_inter[1][2][639:624];
	filter_inter_full40[111:96]  <= filter_inter[2][0][639:624];
	filter_inter_full40[127:112] <= filter_inter[2][1][639:624];
	filter_inter_full40[143:128] <= filter_inter[2][2][639:624];
end
always@(*) begin
	filter_inter_full41[15:0]    <= filter_inter[0][0][655:640];
	filter_inter_full41[31:16]   <= filter_inter[0][1][655:640];
	filter_inter_full41[47:32]   <= filter_inter[0][2][655:640];
	filter_inter_full41[63:48]   <= filter_inter[1][0][655:640];
	filter_inter_full41[79:64]   <= filter_inter[1][1][655:640];
	filter_inter_full41[95:80]   <= filter_inter[1][2][655:640];
	filter_inter_full41[111:96]  <= filter_inter[2][0][655:640];
	filter_inter_full41[127:112] <= filter_inter[2][1][655:640];
	filter_inter_full41[143:128] <= filter_inter[2][2][655:640];
end
always@(*) begin
	filter_inter_full42[15:0]    <= filter_inter[0][0][671:656];
	filter_inter_full42[31:16]   <= filter_inter[0][1][671:656];
	filter_inter_full42[47:32]   <= filter_inter[0][2][671:656];
	filter_inter_full42[63:48]   <= filter_inter[1][0][671:656];
	filter_inter_full42[79:64]   <= filter_inter[1][1][671:656];
	filter_inter_full42[95:80]   <= filter_inter[1][2][671:656];
	filter_inter_full42[111:96]  <= filter_inter[2][0][671:656];
	filter_inter_full42[127:112] <= filter_inter[2][1][671:656];
	filter_inter_full42[143:128] <= filter_inter[2][2][671:656];
end
always@(*) begin
	filter_inter_full43[15:0]    <= filter_inter[0][0][687:672];
	filter_inter_full43[31:16]   <= filter_inter[0][1][687:672];
	filter_inter_full43[47:32]   <= filter_inter[0][2][687:672];
	filter_inter_full43[63:48]   <= filter_inter[1][0][687:672];
	filter_inter_full43[79:64]   <= filter_inter[1][1][687:672];
	filter_inter_full43[95:80]   <= filter_inter[1][2][687:672];
	filter_inter_full43[111:96]  <= filter_inter[2][0][687:672];
	filter_inter_full43[127:112] <= filter_inter[2][1][687:672];
	filter_inter_full43[143:128] <= filter_inter[2][2][687:672];
end
always@(*) begin
	filter_inter_full44[15:0]    <= filter_inter[0][0][703:688];
	filter_inter_full44[31:16]   <= filter_inter[0][1][703:688];
	filter_inter_full44[47:32]   <= filter_inter[0][2][703:688];
	filter_inter_full44[63:48]   <= filter_inter[1][0][703:688];
	filter_inter_full44[79:64]   <= filter_inter[1][1][703:688];
	filter_inter_full44[95:80]   <= filter_inter[1][2][703:688];
	filter_inter_full44[111:96]  <= filter_inter[2][0][703:688];
	filter_inter_full44[127:112] <= filter_inter[2][1][703:688];
	filter_inter_full44[143:128] <= filter_inter[2][2][703:688];
end
always@(*) begin
	filter_inter_full45[15:0]    <= filter_inter[0][0][719:704];
	filter_inter_full45[31:16]   <= filter_inter[0][1][719:704];
	filter_inter_full45[47:32]   <= filter_inter[0][2][719:704];
	filter_inter_full45[63:48]   <= filter_inter[1][0][719:704];
	filter_inter_full45[79:64]   <= filter_inter[1][1][719:704];
	filter_inter_full45[95:80]   <= filter_inter[1][2][719:704];
	filter_inter_full45[111:96]  <= filter_inter[2][0][719:704];
	filter_inter_full45[127:112] <= filter_inter[2][1][719:704];
	filter_inter_full45[143:128] <= filter_inter[2][2][719:704];
end
always@(*) begin
	filter_inter_full46[15:0]    <= filter_inter[0][0][735:720];
	filter_inter_full46[31:16]   <= filter_inter[0][1][735:720];
	filter_inter_full46[47:32]   <= filter_inter[0][2][735:720];
	filter_inter_full46[63:48]   <= filter_inter[1][0][735:720];
	filter_inter_full46[79:64]   <= filter_inter[1][1][735:720];
	filter_inter_full46[95:80]   <= filter_inter[1][2][735:720];
	filter_inter_full46[111:96]  <= filter_inter[2][0][735:720];
	filter_inter_full46[127:112] <= filter_inter[2][1][735:720];
	filter_inter_full46[143:128] <= filter_inter[2][2][735:720];
end
always@(*) begin
	filter_inter_full47[15:0]    <= filter_inter[0][0][751:736];
	filter_inter_full47[31:16]   <= filter_inter[0][1][751:736];
	filter_inter_full47[47:32]   <= filter_inter[0][2][751:736];
	filter_inter_full47[63:48]   <= filter_inter[1][0][751:736];
	filter_inter_full47[79:64]   <= filter_inter[1][1][751:736];
	filter_inter_full47[95:80]   <= filter_inter[1][2][751:736];
	filter_inter_full47[111:96]  <= filter_inter[2][0][751:736];
	filter_inter_full47[127:112] <= filter_inter[2][1][751:736];
	filter_inter_full47[143:128] <= filter_inter[2][2][751:736];
end
always@(*) begin
	filter_inter_full48[15:0]    <= filter_inter[0][0][767:752];
	filter_inter_full48[31:16]   <= filter_inter[0][1][767:752];
	filter_inter_full48[47:32]   <= filter_inter[0][2][767:752];
	filter_inter_full48[63:48]   <= filter_inter[1][0][767:752];
	filter_inter_full48[79:64]   <= filter_inter[1][1][767:752];
	filter_inter_full48[95:80]   <= filter_inter[1][2][767:752];
	filter_inter_full48[111:96]  <= filter_inter[2][0][767:752];
	filter_inter_full48[127:112] <= filter_inter[2][1][767:752];
	filter_inter_full48[143:128] <= filter_inter[2][2][767:752];
end
always@(*) begin
	filter_inter_full49[15:0]    <= filter_inter[0][0][783:768];
	filter_inter_full49[31:16]   <= filter_inter[0][1][783:768];
	filter_inter_full49[47:32]   <= filter_inter[0][2][783:768];
	filter_inter_full49[63:48]   <= filter_inter[1][0][783:768];
	filter_inter_full49[79:64]   <= filter_inter[1][1][783:768];
	filter_inter_full49[95:80]   <= filter_inter[1][2][783:768];
	filter_inter_full49[111:96]  <= filter_inter[2][0][783:768];
	filter_inter_full49[127:112] <= filter_inter[2][1][783:768];
	filter_inter_full49[143:128] <= filter_inter[2][2][783:768];
end
always@(*) begin
	filter_inter_full50[15:0]    <= filter_inter[0][0][799:784];
	filter_inter_full50[31:16]   <= filter_inter[0][1][799:784];
	filter_inter_full50[47:32]   <= filter_inter[0][2][799:784];
	filter_inter_full50[63:48]   <= filter_inter[1][0][799:784];
	filter_inter_full50[79:64]   <= filter_inter[1][1][799:784];
	filter_inter_full50[95:80]   <= filter_inter[1][2][799:784];
	filter_inter_full50[111:96]  <= filter_inter[2][0][799:784];
	filter_inter_full50[127:112] <= filter_inter[2][1][799:784];
	filter_inter_full50[143:128] <= filter_inter[2][2][799:784];
end
always@(*) begin
	filter_inter_full51[15:0]    <= filter_inter[0][0][815:800];
	filter_inter_full51[31:16]   <= filter_inter[0][1][815:800];
	filter_inter_full51[47:32]   <= filter_inter[0][2][815:800];
	filter_inter_full51[63:48]   <= filter_inter[1][0][815:800];
	filter_inter_full51[79:64]   <= filter_inter[1][1][815:800];
	filter_inter_full51[95:80]   <= filter_inter[1][2][815:800];
	filter_inter_full51[111:96]  <= filter_inter[2][0][815:800];
	filter_inter_full51[127:112] <= filter_inter[2][1][815:800];
	filter_inter_full51[143:128] <= filter_inter[2][2][815:800];
end
always@(*) begin
	filter_inter_full52[15:0]    <= filter_inter[0][0][831:816];
	filter_inter_full52[31:16]   <= filter_inter[0][1][831:816];
	filter_inter_full52[47:32]   <= filter_inter[0][2][831:816];
	filter_inter_full52[63:48]   <= filter_inter[1][0][831:816];
	filter_inter_full52[79:64]   <= filter_inter[1][1][831:816];
	filter_inter_full52[95:80]   <= filter_inter[1][2][831:816];
	filter_inter_full52[111:96]  <= filter_inter[2][0][831:816];
	filter_inter_full52[127:112] <= filter_inter[2][1][831:816];
	filter_inter_full52[143:128] <= filter_inter[2][2][831:816];
end
always@(*) begin
	filter_inter_full53[15:0]    <= filter_inter[0][0][847:832];
	filter_inter_full53[31:16]   <= filter_inter[0][1][847:832];
	filter_inter_full53[47:32]   <= filter_inter[0][2][847:832];
	filter_inter_full53[63:48]   <= filter_inter[1][0][847:832];
	filter_inter_full53[79:64]   <= filter_inter[1][1][847:832];
	filter_inter_full53[95:80]   <= filter_inter[1][2][847:832];
	filter_inter_full53[111:96]  <= filter_inter[2][0][847:832];
	filter_inter_full53[127:112] <= filter_inter[2][1][847:832];
	filter_inter_full53[143:128] <= filter_inter[2][2][847:832];
end
always@(*) begin
	filter_inter_full54[15:0]    <= filter_inter[0][0][863:848];
	filter_inter_full54[31:16]   <= filter_inter[0][1][863:848];
	filter_inter_full54[47:32]   <= filter_inter[0][2][863:848];
	filter_inter_full54[63:48]   <= filter_inter[1][0][863:848];
	filter_inter_full54[79:64]   <= filter_inter[1][1][863:848];
	filter_inter_full54[95:80]   <= filter_inter[1][2][863:848];
	filter_inter_full54[111:96]  <= filter_inter[2][0][863:848];
	filter_inter_full54[127:112] <= filter_inter[2][1][863:848];
	filter_inter_full54[143:128] <= filter_inter[2][2][863:848];
end
always@(*) begin
	filter_inter_full55[15:0]    <= filter_inter[0][0][879:864];
	filter_inter_full55[31:16]   <= filter_inter[0][1][879:864];
	filter_inter_full55[47:32]   <= filter_inter[0][2][879:864];
	filter_inter_full55[63:48]   <= filter_inter[1][0][879:864];
	filter_inter_full55[79:64]   <= filter_inter[1][1][879:864];
	filter_inter_full55[95:80]   <= filter_inter[1][2][879:864];
	filter_inter_full55[111:96]  <= filter_inter[2][0][879:864];
	filter_inter_full55[127:112] <= filter_inter[2][1][879:864];
	filter_inter_full55[143:128] <= filter_inter[2][2][879:864];
end
always@(*) begin
	filter_inter_full56[15:0]    <= filter_inter[0][0][895:880];
	filter_inter_full56[31:16]   <= filter_inter[0][1][895:880];
	filter_inter_full56[47:32]   <= filter_inter[0][2][895:880];
	filter_inter_full56[63:48]   <= filter_inter[1][0][895:880];
	filter_inter_full56[79:64]   <= filter_inter[1][1][895:880];
	filter_inter_full56[95:80]   <= filter_inter[1][2][895:880];
	filter_inter_full56[111:96]  <= filter_inter[2][0][895:880];
	filter_inter_full56[127:112] <= filter_inter[2][1][895:880];
	filter_inter_full56[143:128] <= filter_inter[2][2][895:880];
end
always@(*) begin
	filter_inter_full57[15:0]    <= filter_inter[0][0][911:896];
	filter_inter_full57[31:16]   <= filter_inter[0][1][911:896];
	filter_inter_full57[47:32]   <= filter_inter[0][2][911:896];
	filter_inter_full57[63:48]   <= filter_inter[1][0][911:896];
	filter_inter_full57[79:64]   <= filter_inter[1][1][911:896];
	filter_inter_full57[95:80]   <= filter_inter[1][2][911:896];
	filter_inter_full57[111:96]  <= filter_inter[2][0][911:896];
	filter_inter_full57[127:112] <= filter_inter[2][1][911:896];
	filter_inter_full57[143:128] <= filter_inter[2][2][911:896];
end
always@(*) begin
	filter_inter_full58[15:0]    <= filter_inter[0][0][927:912];
	filter_inter_full58[31:16]   <= filter_inter[0][1][927:912];
	filter_inter_full58[47:32]   <= filter_inter[0][2][927:912];
	filter_inter_full58[63:48]   <= filter_inter[1][0][927:912];
	filter_inter_full58[79:64]   <= filter_inter[1][1][927:912];
	filter_inter_full58[95:80]   <= filter_inter[1][2][927:912];
	filter_inter_full58[111:96]  <= filter_inter[2][0][927:912];
	filter_inter_full58[127:112] <= filter_inter[2][1][927:912];
	filter_inter_full58[143:128] <= filter_inter[2][2][927:912];
end
always@(*) begin
	filter_inter_full59[15:0]    <= filter_inter[0][0][943:928];
	filter_inter_full59[31:16]   <= filter_inter[0][1][943:928];
	filter_inter_full59[47:32]   <= filter_inter[0][2][943:928];
	filter_inter_full59[63:48]   <= filter_inter[1][0][943:928];
	filter_inter_full59[79:64]   <= filter_inter[1][1][943:928];
	filter_inter_full59[95:80]   <= filter_inter[1][2][943:928];
	filter_inter_full59[111:96]  <= filter_inter[2][0][943:928];
	filter_inter_full59[127:112] <= filter_inter[2][1][943:928];
	filter_inter_full59[143:128] <= filter_inter[2][2][943:928];
end
always@(*) begin
	filter_inter_full60[15:0]    <= filter_inter[0][0][959:944];
	filter_inter_full60[31:16]   <= filter_inter[0][1][959:944];
	filter_inter_full60[47:32]   <= filter_inter[0][2][959:944];
	filter_inter_full60[63:48]   <= filter_inter[1][0][959:944];
	filter_inter_full60[79:64]   <= filter_inter[1][1][959:944];
	filter_inter_full60[95:80]   <= filter_inter[1][2][959:944];
	filter_inter_full60[111:96]  <= filter_inter[2][0][959:944];
	filter_inter_full60[127:112] <= filter_inter[2][1][959:944];
	filter_inter_full60[143:128] <= filter_inter[2][2][959:944];
end
always@(*) begin
	filter_inter_full61[15:0]    <= filter_inter[0][0][975:960];
	filter_inter_full61[31:16]   <= filter_inter[0][1][975:960];
	filter_inter_full61[47:32]   <= filter_inter[0][2][975:960];
	filter_inter_full61[63:48]   <= filter_inter[1][0][975:960];
	filter_inter_full61[79:64]   <= filter_inter[1][1][975:960];
	filter_inter_full61[95:80]   <= filter_inter[1][2][975:960];
	filter_inter_full61[111:96]  <= filter_inter[2][0][975:960];
	filter_inter_full61[127:112] <= filter_inter[2][1][975:960];
	filter_inter_full61[143:128] <= filter_inter[2][2][975:960];
end
always@(*) begin
	filter_inter_full62[15:0]    <= filter_inter[0][0][991:976];
	filter_inter_full62[31:16]   <= filter_inter[0][1][991:976];
	filter_inter_full62[47:32]   <= filter_inter[0][2][991:976];
	filter_inter_full62[63:48]   <= filter_inter[1][0][991:976];
	filter_inter_full62[79:64]   <= filter_inter[1][1][991:976];
	filter_inter_full62[95:80]   <= filter_inter[1][2][991:976];
	filter_inter_full62[111:96]  <= filter_inter[2][0][991:976];
	filter_inter_full62[127:112] <= filter_inter[2][1][991:976];
	filter_inter_full62[143:128] <= filter_inter[2][2][991:976];
end
always@(*) begin
	filter_inter_full63[15:0]    <= filter_inter[0][0][1007:992];
	filter_inter_full63[31:16]   <= filter_inter[0][1][1007:992];
	filter_inter_full63[47:32]   <= filter_inter[0][2][1007:992];
	filter_inter_full63[63:48]   <= filter_inter[1][0][1007:992];
	filter_inter_full63[79:64]   <= filter_inter[1][1][1007:992];
	filter_inter_full63[95:80]   <= filter_inter[1][2][1007:992];
	filter_inter_full63[111:96]  <= filter_inter[2][0][1007:992];
	filter_inter_full63[127:112] <= filter_inter[2][1][1007:992];
	filter_inter_full63[143:128] <= filter_inter[2][2][1007:992];
end
always@(*) begin
	filter_inter_full64[15:0]    <= filter_inter[0][0][1023:1008];
	filter_inter_full64[31:16]   <= filter_inter[0][1][1023:1008];
	filter_inter_full64[47:32]   <= filter_inter[0][2][1023:1008];
	filter_inter_full64[63:48]   <= filter_inter[1][0][1023:1008];
	filter_inter_full64[79:64]   <= filter_inter[1][1][1023:1008];
	filter_inter_full64[95:80]   <= filter_inter[1][2][1023:1008];
	filter_inter_full64[111:96]  <= filter_inter[2][0][1023:1008];
	filter_inter_full64[127:112] <= filter_inter[2][1][1023:1008];
	filter_inter_full64[143:128] <= filter_inter[2][2][1023:1008];
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
    wbuffer_inter_full4[15:0]    <= wbuffer_inter[0][0][63:48];
    wbuffer_inter_full4[31:16]   <= wbuffer_inter[0][1][63:48];
    wbuffer_inter_full4[47:32]   <= wbuffer_inter[0][2][63:48];
    wbuffer_inter_full4[63:48]   <= wbuffer_inter[1][0][63:48];
    wbuffer_inter_full4[79:64]   <= wbuffer_inter[1][1][63:48];
    wbuffer_inter_full4[95:80]   <= wbuffer_inter[1][2][63:48];
    wbuffer_inter_full4[111:96]  <= wbuffer_inter[2][0][63:48];
    wbuffer_inter_full4[127:112] <= wbuffer_inter[2][1][63:48];
    wbuffer_inter_full4[143:128] <= wbuffer_inter[2][2][63:48];
    
end

always@(*) begin
    wbuffer_inter_full5[15:0]    <= wbuffer_inter[0][0][79:64];
    wbuffer_inter_full5[31:16]   <= wbuffer_inter[0][1][79:64];
    wbuffer_inter_full5[47:32]   <= wbuffer_inter[0][2][79:64];
    wbuffer_inter_full5[63:48]   <= wbuffer_inter[1][0][79:64];
    wbuffer_inter_full5[79:64]   <= wbuffer_inter[1][1][79:64];
    wbuffer_inter_full5[95:80]   <= wbuffer_inter[1][2][79:64];
    wbuffer_inter_full5[111:96]  <= wbuffer_inter[2][0][79:64];
    wbuffer_inter_full5[127:112] <= wbuffer_inter[2][1][79:64];
    wbuffer_inter_full5[143:128] <= wbuffer_inter[2][2][79:64];
    
end

always@(*) begin
	wbuffer_inter_full6[15:0]    <= wbuffer_inter[0][0][95:80];
	wbuffer_inter_full6[31:16]   <= wbuffer_inter[0][1][95:80];
	wbuffer_inter_full6[47:32]   <= wbuffer_inter[0][2][95:80];
	wbuffer_inter_full6[63:48]   <= wbuffer_inter[1][0][95:80];
	wbuffer_inter_full6[79:64]   <= wbuffer_inter[1][1][95:80];
	wbuffer_inter_full6[95:80]   <= wbuffer_inter[1][2][95:80];
	wbuffer_inter_full6[111:96]  <= wbuffer_inter[2][0][95:80];
	wbuffer_inter_full6[127:112] <= wbuffer_inter[2][1][95:80];
	wbuffer_inter_full6[143:128] <= wbuffer_inter[2][2][95:80];
end
always@(*) begin
	wbuffer_inter_full7[15:0]    <= wbuffer_inter[0][0][111:96];
	wbuffer_inter_full7[31:16]   <= wbuffer_inter[0][1][111:96];
	wbuffer_inter_full7[47:32]   <= wbuffer_inter[0][2][111:96];
	wbuffer_inter_full7[63:48]   <= wbuffer_inter[1][0][111:96];
	wbuffer_inter_full7[79:64]   <= wbuffer_inter[1][1][111:96];
	wbuffer_inter_full7[95:80]   <= wbuffer_inter[1][2][111:96];
	wbuffer_inter_full7[111:96]  <= wbuffer_inter[2][0][111:96];
	wbuffer_inter_full7[127:112] <= wbuffer_inter[2][1][111:96];
	wbuffer_inter_full7[143:128] <= wbuffer_inter[2][2][111:96];
end
always@(*) begin
	wbuffer_inter_full8[15:0]    <= wbuffer_inter[0][0][127:112];
	wbuffer_inter_full8[31:16]   <= wbuffer_inter[0][1][127:112];
	wbuffer_inter_full8[47:32]   <= wbuffer_inter[0][2][127:112];
	wbuffer_inter_full8[63:48]   <= wbuffer_inter[1][0][127:112];
	wbuffer_inter_full8[79:64]   <= wbuffer_inter[1][1][127:112];
	wbuffer_inter_full8[95:80]   <= wbuffer_inter[1][2][127:112];
	wbuffer_inter_full8[111:96]  <= wbuffer_inter[2][0][127:112];
	wbuffer_inter_full8[127:112] <= wbuffer_inter[2][1][127:112];
	wbuffer_inter_full8[143:128] <= wbuffer_inter[2][2][127:112];
end
always@(*) begin
	wbuffer_inter_full9[15:0]    <= wbuffer_inter[0][0][143:128];
	wbuffer_inter_full9[31:16]   <= wbuffer_inter[0][1][143:128];
	wbuffer_inter_full9[47:32]   <= wbuffer_inter[0][2][143:128];
	wbuffer_inter_full9[63:48]   <= wbuffer_inter[1][0][143:128];
	wbuffer_inter_full9[79:64]   <= wbuffer_inter[1][1][143:128];
	wbuffer_inter_full9[95:80]   <= wbuffer_inter[1][2][143:128];
	wbuffer_inter_full9[111:96]  <= wbuffer_inter[2][0][143:128];
	wbuffer_inter_full9[127:112] <= wbuffer_inter[2][1][143:128];
	wbuffer_inter_full9[143:128] <= wbuffer_inter[2][2][143:128];
end
always@(*) begin
	wbuffer_inter_full10[15:0]    <= wbuffer_inter[0][0][159:144];
	wbuffer_inter_full10[31:16]   <= wbuffer_inter[0][1][159:144];
	wbuffer_inter_full10[47:32]   <= wbuffer_inter[0][2][159:144];
	wbuffer_inter_full10[63:48]   <= wbuffer_inter[1][0][159:144];
	wbuffer_inter_full10[79:64]   <= wbuffer_inter[1][1][159:144];
	wbuffer_inter_full10[95:80]   <= wbuffer_inter[1][2][159:144];
	wbuffer_inter_full10[111:96]  <= wbuffer_inter[2][0][159:144];
	wbuffer_inter_full10[127:112] <= wbuffer_inter[2][1][159:144];
	wbuffer_inter_full10[143:128] <= wbuffer_inter[2][2][159:144];
end
always@(*) begin
	wbuffer_inter_full11[15:0]    <= wbuffer_inter[0][0][175:160];
	wbuffer_inter_full11[31:16]   <= wbuffer_inter[0][1][175:160];
	wbuffer_inter_full11[47:32]   <= wbuffer_inter[0][2][175:160];
	wbuffer_inter_full11[63:48]   <= wbuffer_inter[1][0][175:160];
	wbuffer_inter_full11[79:64]   <= wbuffer_inter[1][1][175:160];
	wbuffer_inter_full11[95:80]   <= wbuffer_inter[1][2][175:160];
	wbuffer_inter_full11[111:96]  <= wbuffer_inter[2][0][175:160];
	wbuffer_inter_full11[127:112] <= wbuffer_inter[2][1][175:160];
	wbuffer_inter_full11[143:128] <= wbuffer_inter[2][2][175:160];
end
always@(*) begin
	wbuffer_inter_full12[15:0]    <= wbuffer_inter[0][0][191:176];
	wbuffer_inter_full12[31:16]   <= wbuffer_inter[0][1][191:176];
	wbuffer_inter_full12[47:32]   <= wbuffer_inter[0][2][191:176];
	wbuffer_inter_full12[63:48]   <= wbuffer_inter[1][0][191:176];
	wbuffer_inter_full12[79:64]   <= wbuffer_inter[1][1][191:176];
	wbuffer_inter_full12[95:80]   <= wbuffer_inter[1][2][191:176];
	wbuffer_inter_full12[111:96]  <= wbuffer_inter[2][0][191:176];
	wbuffer_inter_full12[127:112] <= wbuffer_inter[2][1][191:176];
	wbuffer_inter_full12[143:128] <= wbuffer_inter[2][2][191:176];
end
always@(*) begin
	wbuffer_inter_full13[15:0]    <= wbuffer_inter[0][0][207:192];
	wbuffer_inter_full13[31:16]   <= wbuffer_inter[0][1][207:192];
	wbuffer_inter_full13[47:32]   <= wbuffer_inter[0][2][207:192];
	wbuffer_inter_full13[63:48]   <= wbuffer_inter[1][0][207:192];
	wbuffer_inter_full13[79:64]   <= wbuffer_inter[1][1][207:192];
	wbuffer_inter_full13[95:80]   <= wbuffer_inter[1][2][207:192];
	wbuffer_inter_full13[111:96]  <= wbuffer_inter[2][0][207:192];
	wbuffer_inter_full13[127:112] <= wbuffer_inter[2][1][207:192];
	wbuffer_inter_full13[143:128] <= wbuffer_inter[2][2][207:192];
end
always@(*) begin
	wbuffer_inter_full14[15:0]    <= wbuffer_inter[0][0][223:208];
	wbuffer_inter_full14[31:16]   <= wbuffer_inter[0][1][223:208];
	wbuffer_inter_full14[47:32]   <= wbuffer_inter[0][2][223:208];
	wbuffer_inter_full14[63:48]   <= wbuffer_inter[1][0][223:208];
	wbuffer_inter_full14[79:64]   <= wbuffer_inter[1][1][223:208];
	wbuffer_inter_full14[95:80]   <= wbuffer_inter[1][2][223:208];
	wbuffer_inter_full14[111:96]  <= wbuffer_inter[2][0][223:208];
	wbuffer_inter_full14[127:112] <= wbuffer_inter[2][1][223:208];
	wbuffer_inter_full14[143:128] <= wbuffer_inter[2][2][223:208];
end
always@(*) begin
	wbuffer_inter_full15[15:0]    <= wbuffer_inter[0][0][239:224];
	wbuffer_inter_full15[31:16]   <= wbuffer_inter[0][1][239:224];
	wbuffer_inter_full15[47:32]   <= wbuffer_inter[0][2][239:224];
	wbuffer_inter_full15[63:48]   <= wbuffer_inter[1][0][239:224];
	wbuffer_inter_full15[79:64]   <= wbuffer_inter[1][1][239:224];
	wbuffer_inter_full15[95:80]   <= wbuffer_inter[1][2][239:224];
	wbuffer_inter_full15[111:96]  <= wbuffer_inter[2][0][239:224];
	wbuffer_inter_full15[127:112] <= wbuffer_inter[2][1][239:224];
	wbuffer_inter_full15[143:128] <= wbuffer_inter[2][2][239:224];
end
always@(*) begin
	wbuffer_inter_full16[15:0]    <= wbuffer_inter[0][0][255:240];
	wbuffer_inter_full16[31:16]   <= wbuffer_inter[0][1][255:240];
	wbuffer_inter_full16[47:32]   <= wbuffer_inter[0][2][255:240];
	wbuffer_inter_full16[63:48]   <= wbuffer_inter[1][0][255:240];
	wbuffer_inter_full16[79:64]   <= wbuffer_inter[1][1][255:240];
	wbuffer_inter_full16[95:80]   <= wbuffer_inter[1][2][255:240];
	wbuffer_inter_full16[111:96]  <= wbuffer_inter[2][0][255:240];
	wbuffer_inter_full16[127:112] <= wbuffer_inter[2][1][255:240];
	wbuffer_inter_full16[143:128] <= wbuffer_inter[2][2][255:240];
end
always@(*) begin
	wbuffer_inter_full17[15:0]    <= wbuffer_inter[0][0][271:256];
	wbuffer_inter_full17[31:16]   <= wbuffer_inter[0][1][271:256];
	wbuffer_inter_full17[47:32]   <= wbuffer_inter[0][2][271:256];
	wbuffer_inter_full17[63:48]   <= wbuffer_inter[1][0][271:256];
	wbuffer_inter_full17[79:64]   <= wbuffer_inter[1][1][271:256];
	wbuffer_inter_full17[95:80]   <= wbuffer_inter[1][2][271:256];
	wbuffer_inter_full17[111:96]  <= wbuffer_inter[2][0][271:256];
	wbuffer_inter_full17[127:112] <= wbuffer_inter[2][1][271:256];
	wbuffer_inter_full17[143:128] <= wbuffer_inter[2][2][271:256];
end
always@(*) begin
	wbuffer_inter_full18[15:0]    <= wbuffer_inter[0][0][287:272];
	wbuffer_inter_full18[31:16]   <= wbuffer_inter[0][1][287:272];
	wbuffer_inter_full18[47:32]   <= wbuffer_inter[0][2][287:272];
	wbuffer_inter_full18[63:48]   <= wbuffer_inter[1][0][287:272];
	wbuffer_inter_full18[79:64]   <= wbuffer_inter[1][1][287:272];
	wbuffer_inter_full18[95:80]   <= wbuffer_inter[1][2][287:272];
	wbuffer_inter_full18[111:96]  <= wbuffer_inter[2][0][287:272];
	wbuffer_inter_full18[127:112] <= wbuffer_inter[2][1][287:272];
	wbuffer_inter_full18[143:128] <= wbuffer_inter[2][2][287:272];
end
always@(*) begin
	wbuffer_inter_full19[15:0]    <= wbuffer_inter[0][0][303:288];
	wbuffer_inter_full19[31:16]   <= wbuffer_inter[0][1][303:288];
	wbuffer_inter_full19[47:32]   <= wbuffer_inter[0][2][303:288];
	wbuffer_inter_full19[63:48]   <= wbuffer_inter[1][0][303:288];
	wbuffer_inter_full19[79:64]   <= wbuffer_inter[1][1][303:288];
	wbuffer_inter_full19[95:80]   <= wbuffer_inter[1][2][303:288];
	wbuffer_inter_full19[111:96]  <= wbuffer_inter[2][0][303:288];
	wbuffer_inter_full19[127:112] <= wbuffer_inter[2][1][303:288];
	wbuffer_inter_full19[143:128] <= wbuffer_inter[2][2][303:288];
end
always@(*) begin
	wbuffer_inter_full20[15:0]    <= wbuffer_inter[0][0][319:304];
	wbuffer_inter_full20[31:16]   <= wbuffer_inter[0][1][319:304];
	wbuffer_inter_full20[47:32]   <= wbuffer_inter[0][2][319:304];
	wbuffer_inter_full20[63:48]   <= wbuffer_inter[1][0][319:304];
	wbuffer_inter_full20[79:64]   <= wbuffer_inter[1][1][319:304];
	wbuffer_inter_full20[95:80]   <= wbuffer_inter[1][2][319:304];
	wbuffer_inter_full20[111:96]  <= wbuffer_inter[2][0][319:304];
	wbuffer_inter_full20[127:112] <= wbuffer_inter[2][1][319:304];
	wbuffer_inter_full20[143:128] <= wbuffer_inter[2][2][319:304];
end
always@(*) begin
	wbuffer_inter_full21[15:0]    <= wbuffer_inter[0][0][335:320];
	wbuffer_inter_full21[31:16]   <= wbuffer_inter[0][1][335:320];
	wbuffer_inter_full21[47:32]   <= wbuffer_inter[0][2][335:320];
	wbuffer_inter_full21[63:48]   <= wbuffer_inter[1][0][335:320];
	wbuffer_inter_full21[79:64]   <= wbuffer_inter[1][1][335:320];
	wbuffer_inter_full21[95:80]   <= wbuffer_inter[1][2][335:320];
	wbuffer_inter_full21[111:96]  <= wbuffer_inter[2][0][335:320];
	wbuffer_inter_full21[127:112] <= wbuffer_inter[2][1][335:320];
	wbuffer_inter_full21[143:128] <= wbuffer_inter[2][2][335:320];
end
always@(*) begin
	wbuffer_inter_full22[15:0]    <= wbuffer_inter[0][0][351:336];
	wbuffer_inter_full22[31:16]   <= wbuffer_inter[0][1][351:336];
	wbuffer_inter_full22[47:32]   <= wbuffer_inter[0][2][351:336];
	wbuffer_inter_full22[63:48]   <= wbuffer_inter[1][0][351:336];
	wbuffer_inter_full22[79:64]   <= wbuffer_inter[1][1][351:336];
	wbuffer_inter_full22[95:80]   <= wbuffer_inter[1][2][351:336];
	wbuffer_inter_full22[111:96]  <= wbuffer_inter[2][0][351:336];
	wbuffer_inter_full22[127:112] <= wbuffer_inter[2][1][351:336];
	wbuffer_inter_full22[143:128] <= wbuffer_inter[2][2][351:336];
end
always@(*) begin
	wbuffer_inter_full23[15:0]    <= wbuffer_inter[0][0][367:352];
	wbuffer_inter_full23[31:16]   <= wbuffer_inter[0][1][367:352];
	wbuffer_inter_full23[47:32]   <= wbuffer_inter[0][2][367:352];
	wbuffer_inter_full23[63:48]   <= wbuffer_inter[1][0][367:352];
	wbuffer_inter_full23[79:64]   <= wbuffer_inter[1][1][367:352];
	wbuffer_inter_full23[95:80]   <= wbuffer_inter[1][2][367:352];
	wbuffer_inter_full23[111:96]  <= wbuffer_inter[2][0][367:352];
	wbuffer_inter_full23[127:112] <= wbuffer_inter[2][1][367:352];
	wbuffer_inter_full23[143:128] <= wbuffer_inter[2][2][367:352];
end
always@(*) begin
	wbuffer_inter_full24[15:0]    <= wbuffer_inter[0][0][383:368];
	wbuffer_inter_full24[31:16]   <= wbuffer_inter[0][1][383:368];
	wbuffer_inter_full24[47:32]   <= wbuffer_inter[0][2][383:368];
	wbuffer_inter_full24[63:48]   <= wbuffer_inter[1][0][383:368];
	wbuffer_inter_full24[79:64]   <= wbuffer_inter[1][1][383:368];
	wbuffer_inter_full24[95:80]   <= wbuffer_inter[1][2][383:368];
	wbuffer_inter_full24[111:96]  <= wbuffer_inter[2][0][383:368];
	wbuffer_inter_full24[127:112] <= wbuffer_inter[2][1][383:368];
	wbuffer_inter_full24[143:128] <= wbuffer_inter[2][2][383:368];
end
always@(*) begin
	wbuffer_inter_full25[15:0]    <= wbuffer_inter[0][0][399:384];
	wbuffer_inter_full25[31:16]   <= wbuffer_inter[0][1][399:384];
	wbuffer_inter_full25[47:32]   <= wbuffer_inter[0][2][399:384];
	wbuffer_inter_full25[63:48]   <= wbuffer_inter[1][0][399:384];
	wbuffer_inter_full25[79:64]   <= wbuffer_inter[1][1][399:384];
	wbuffer_inter_full25[95:80]   <= wbuffer_inter[1][2][399:384];
	wbuffer_inter_full25[111:96]  <= wbuffer_inter[2][0][399:384];
	wbuffer_inter_full25[127:112] <= wbuffer_inter[2][1][399:384];
	wbuffer_inter_full25[143:128] <= wbuffer_inter[2][2][399:384];
end
always@(*) begin
	wbuffer_inter_full26[15:0]    <= wbuffer_inter[0][0][415:400];
	wbuffer_inter_full26[31:16]   <= wbuffer_inter[0][1][415:400];
	wbuffer_inter_full26[47:32]   <= wbuffer_inter[0][2][415:400];
	wbuffer_inter_full26[63:48]   <= wbuffer_inter[1][0][415:400];
	wbuffer_inter_full26[79:64]   <= wbuffer_inter[1][1][415:400];
	wbuffer_inter_full26[95:80]   <= wbuffer_inter[1][2][415:400];
	wbuffer_inter_full26[111:96]  <= wbuffer_inter[2][0][415:400];
	wbuffer_inter_full26[127:112] <= wbuffer_inter[2][1][415:400];
	wbuffer_inter_full26[143:128] <= wbuffer_inter[2][2][415:400];
end
always@(*) begin
	wbuffer_inter_full27[15:0]    <= wbuffer_inter[0][0][431:416];
	wbuffer_inter_full27[31:16]   <= wbuffer_inter[0][1][431:416];
	wbuffer_inter_full27[47:32]   <= wbuffer_inter[0][2][431:416];
	wbuffer_inter_full27[63:48]   <= wbuffer_inter[1][0][431:416];
	wbuffer_inter_full27[79:64]   <= wbuffer_inter[1][1][431:416];
	wbuffer_inter_full27[95:80]   <= wbuffer_inter[1][2][431:416];
	wbuffer_inter_full27[111:96]  <= wbuffer_inter[2][0][431:416];
	wbuffer_inter_full27[127:112] <= wbuffer_inter[2][1][431:416];
	wbuffer_inter_full27[143:128] <= wbuffer_inter[2][2][431:416];
end
always@(*) begin
	wbuffer_inter_full28[15:0]    <= wbuffer_inter[0][0][447:432];
	wbuffer_inter_full28[31:16]   <= wbuffer_inter[0][1][447:432];
	wbuffer_inter_full28[47:32]   <= wbuffer_inter[0][2][447:432];
	wbuffer_inter_full28[63:48]   <= wbuffer_inter[1][0][447:432];
	wbuffer_inter_full28[79:64]   <= wbuffer_inter[1][1][447:432];
	wbuffer_inter_full28[95:80]   <= wbuffer_inter[1][2][447:432];
	wbuffer_inter_full28[111:96]  <= wbuffer_inter[2][0][447:432];
	wbuffer_inter_full28[127:112] <= wbuffer_inter[2][1][447:432];
	wbuffer_inter_full28[143:128] <= wbuffer_inter[2][2][447:432];
end
always@(*) begin
	wbuffer_inter_full29[15:0]    <= wbuffer_inter[0][0][463:448];
	wbuffer_inter_full29[31:16]   <= wbuffer_inter[0][1][463:448];
	wbuffer_inter_full29[47:32]   <= wbuffer_inter[0][2][463:448];
	wbuffer_inter_full29[63:48]   <= wbuffer_inter[1][0][463:448];
	wbuffer_inter_full29[79:64]   <= wbuffer_inter[1][1][463:448];
	wbuffer_inter_full29[95:80]   <= wbuffer_inter[1][2][463:448];
	wbuffer_inter_full29[111:96]  <= wbuffer_inter[2][0][463:448];
	wbuffer_inter_full29[127:112] <= wbuffer_inter[2][1][463:448];
	wbuffer_inter_full29[143:128] <= wbuffer_inter[2][2][463:448];
end
always@(*) begin
	wbuffer_inter_full30[15:0]    <= wbuffer_inter[0][0][479:464];
	wbuffer_inter_full30[31:16]   <= wbuffer_inter[0][1][479:464];
	wbuffer_inter_full30[47:32]   <= wbuffer_inter[0][2][479:464];
	wbuffer_inter_full30[63:48]   <= wbuffer_inter[1][0][479:464];
	wbuffer_inter_full30[79:64]   <= wbuffer_inter[1][1][479:464];
	wbuffer_inter_full30[95:80]   <= wbuffer_inter[1][2][479:464];
	wbuffer_inter_full30[111:96]  <= wbuffer_inter[2][0][479:464];
	wbuffer_inter_full30[127:112] <= wbuffer_inter[2][1][479:464];
	wbuffer_inter_full30[143:128] <= wbuffer_inter[2][2][479:464];
end
always@(*) begin
	wbuffer_inter_full31[15:0]    <= wbuffer_inter[0][0][495:480];
	wbuffer_inter_full31[31:16]   <= wbuffer_inter[0][1][495:480];
	wbuffer_inter_full31[47:32]   <= wbuffer_inter[0][2][495:480];
	wbuffer_inter_full31[63:48]   <= wbuffer_inter[1][0][495:480];
	wbuffer_inter_full31[79:64]   <= wbuffer_inter[1][1][495:480];
	wbuffer_inter_full31[95:80]   <= wbuffer_inter[1][2][495:480];
	wbuffer_inter_full31[111:96]  <= wbuffer_inter[2][0][495:480];
	wbuffer_inter_full31[127:112] <= wbuffer_inter[2][1][495:480];
	wbuffer_inter_full31[143:128] <= wbuffer_inter[2][2][495:480];
end
always@(*) begin
	wbuffer_inter_full32[15:0]    <= wbuffer_inter[0][0][511:496];
	wbuffer_inter_full32[31:16]   <= wbuffer_inter[0][1][511:496];
	wbuffer_inter_full32[47:32]   <= wbuffer_inter[0][2][511:496];
	wbuffer_inter_full32[63:48]   <= wbuffer_inter[1][0][511:496];
	wbuffer_inter_full32[79:64]   <= wbuffer_inter[1][1][511:496];
	wbuffer_inter_full32[95:80]   <= wbuffer_inter[1][2][511:496];
	wbuffer_inter_full32[111:96]  <= wbuffer_inter[2][0][511:496];
	wbuffer_inter_full32[127:112] <= wbuffer_inter[2][1][511:496];
	wbuffer_inter_full32[143:128] <= wbuffer_inter[2][2][511:496];
end
always@(*) begin
	wbuffer_inter_full33[15:0]    <= wbuffer_inter[0][0][527:512];
	wbuffer_inter_full33[31:16]   <= wbuffer_inter[0][1][527:512];
	wbuffer_inter_full33[47:32]   <= wbuffer_inter[0][2][527:512];
	wbuffer_inter_full33[63:48]   <= wbuffer_inter[1][0][527:512];
	wbuffer_inter_full33[79:64]   <= wbuffer_inter[1][1][527:512];
	wbuffer_inter_full33[95:80]   <= wbuffer_inter[1][2][527:512];
	wbuffer_inter_full33[111:96]  <= wbuffer_inter[2][0][527:512];
	wbuffer_inter_full33[127:112] <= wbuffer_inter[2][1][527:512];
	wbuffer_inter_full33[143:128] <= wbuffer_inter[2][2][527:512];
end
always@(*) begin
	wbuffer_inter_full34[15:0]    <= wbuffer_inter[0][0][543:528];
	wbuffer_inter_full34[31:16]   <= wbuffer_inter[0][1][543:528];
	wbuffer_inter_full34[47:32]   <= wbuffer_inter[0][2][543:528];
	wbuffer_inter_full34[63:48]   <= wbuffer_inter[1][0][543:528];
	wbuffer_inter_full34[79:64]   <= wbuffer_inter[1][1][543:528];
	wbuffer_inter_full34[95:80]   <= wbuffer_inter[1][2][543:528];
	wbuffer_inter_full34[111:96]  <= wbuffer_inter[2][0][543:528];
	wbuffer_inter_full34[127:112] <= wbuffer_inter[2][1][543:528];
	wbuffer_inter_full34[143:128] <= wbuffer_inter[2][2][543:528];
end
always@(*) begin
	wbuffer_inter_full35[15:0]    <= wbuffer_inter[0][0][559:544];
	wbuffer_inter_full35[31:16]   <= wbuffer_inter[0][1][559:544];
	wbuffer_inter_full35[47:32]   <= wbuffer_inter[0][2][559:544];
	wbuffer_inter_full35[63:48]   <= wbuffer_inter[1][0][559:544];
	wbuffer_inter_full35[79:64]   <= wbuffer_inter[1][1][559:544];
	wbuffer_inter_full35[95:80]   <= wbuffer_inter[1][2][559:544];
	wbuffer_inter_full35[111:96]  <= wbuffer_inter[2][0][559:544];
	wbuffer_inter_full35[127:112] <= wbuffer_inter[2][1][559:544];
	wbuffer_inter_full35[143:128] <= wbuffer_inter[2][2][559:544];
end
always@(*) begin
	wbuffer_inter_full36[15:0]    <= wbuffer_inter[0][0][575:560];
	wbuffer_inter_full36[31:16]   <= wbuffer_inter[0][1][575:560];
	wbuffer_inter_full36[47:32]   <= wbuffer_inter[0][2][575:560];
	wbuffer_inter_full36[63:48]   <= wbuffer_inter[1][0][575:560];
	wbuffer_inter_full36[79:64]   <= wbuffer_inter[1][1][575:560];
	wbuffer_inter_full36[95:80]   <= wbuffer_inter[1][2][575:560];
	wbuffer_inter_full36[111:96]  <= wbuffer_inter[2][0][575:560];
	wbuffer_inter_full36[127:112] <= wbuffer_inter[2][1][575:560];
	wbuffer_inter_full36[143:128] <= wbuffer_inter[2][2][575:560];
end
always@(*) begin
	wbuffer_inter_full37[15:0]    <= wbuffer_inter[0][0][591:576];
	wbuffer_inter_full37[31:16]   <= wbuffer_inter[0][1][591:576];
	wbuffer_inter_full37[47:32]   <= wbuffer_inter[0][2][591:576];
	wbuffer_inter_full37[63:48]   <= wbuffer_inter[1][0][591:576];
	wbuffer_inter_full37[79:64]   <= wbuffer_inter[1][1][591:576];
	wbuffer_inter_full37[95:80]   <= wbuffer_inter[1][2][591:576];
	wbuffer_inter_full37[111:96]  <= wbuffer_inter[2][0][591:576];
	wbuffer_inter_full37[127:112] <= wbuffer_inter[2][1][591:576];
	wbuffer_inter_full37[143:128] <= wbuffer_inter[2][2][591:576];
end
always@(*) begin
	wbuffer_inter_full38[15:0]    <= wbuffer_inter[0][0][607:592];
	wbuffer_inter_full38[31:16]   <= wbuffer_inter[0][1][607:592];
	wbuffer_inter_full38[47:32]   <= wbuffer_inter[0][2][607:592];
	wbuffer_inter_full38[63:48]   <= wbuffer_inter[1][0][607:592];
	wbuffer_inter_full38[79:64]   <= wbuffer_inter[1][1][607:592];
	wbuffer_inter_full38[95:80]   <= wbuffer_inter[1][2][607:592];
	wbuffer_inter_full38[111:96]  <= wbuffer_inter[2][0][607:592];
	wbuffer_inter_full38[127:112] <= wbuffer_inter[2][1][607:592];
	wbuffer_inter_full38[143:128] <= wbuffer_inter[2][2][607:592];
end
always@(*) begin
	wbuffer_inter_full39[15:0]    <= wbuffer_inter[0][0][623:608];
	wbuffer_inter_full39[31:16]   <= wbuffer_inter[0][1][623:608];
	wbuffer_inter_full39[47:32]   <= wbuffer_inter[0][2][623:608];
	wbuffer_inter_full39[63:48]   <= wbuffer_inter[1][0][623:608];
	wbuffer_inter_full39[79:64]   <= wbuffer_inter[1][1][623:608];
	wbuffer_inter_full39[95:80]   <= wbuffer_inter[1][2][623:608];
	wbuffer_inter_full39[111:96]  <= wbuffer_inter[2][0][623:608];
	wbuffer_inter_full39[127:112] <= wbuffer_inter[2][1][623:608];
	wbuffer_inter_full39[143:128] <= wbuffer_inter[2][2][623:608];
end
always@(*) begin
	wbuffer_inter_full40[15:0]    <= wbuffer_inter[0][0][639:624];
	wbuffer_inter_full40[31:16]   <= wbuffer_inter[0][1][639:624];
	wbuffer_inter_full40[47:32]   <= wbuffer_inter[0][2][639:624];
	wbuffer_inter_full40[63:48]   <= wbuffer_inter[1][0][639:624];
	wbuffer_inter_full40[79:64]   <= wbuffer_inter[1][1][639:624];
	wbuffer_inter_full40[95:80]   <= wbuffer_inter[1][2][639:624];
	wbuffer_inter_full40[111:96]  <= wbuffer_inter[2][0][639:624];
	wbuffer_inter_full40[127:112] <= wbuffer_inter[2][1][639:624];
	wbuffer_inter_full40[143:128] <= wbuffer_inter[2][2][639:624];
end
always@(*) begin
	wbuffer_inter_full41[15:0]    <= wbuffer_inter[0][0][655:640];
	wbuffer_inter_full41[31:16]   <= wbuffer_inter[0][1][655:640];
	wbuffer_inter_full41[47:32]   <= wbuffer_inter[0][2][655:640];
	wbuffer_inter_full41[63:48]   <= wbuffer_inter[1][0][655:640];
	wbuffer_inter_full41[79:64]   <= wbuffer_inter[1][1][655:640];
	wbuffer_inter_full41[95:80]   <= wbuffer_inter[1][2][655:640];
	wbuffer_inter_full41[111:96]  <= wbuffer_inter[2][0][655:640];
	wbuffer_inter_full41[127:112] <= wbuffer_inter[2][1][655:640];
	wbuffer_inter_full41[143:128] <= wbuffer_inter[2][2][655:640];
end
always@(*) begin
	wbuffer_inter_full42[15:0]    <= wbuffer_inter[0][0][671:656];
	wbuffer_inter_full42[31:16]   <= wbuffer_inter[0][1][671:656];
	wbuffer_inter_full42[47:32]   <= wbuffer_inter[0][2][671:656];
	wbuffer_inter_full42[63:48]   <= wbuffer_inter[1][0][671:656];
	wbuffer_inter_full42[79:64]   <= wbuffer_inter[1][1][671:656];
	wbuffer_inter_full42[95:80]   <= wbuffer_inter[1][2][671:656];
	wbuffer_inter_full42[111:96]  <= wbuffer_inter[2][0][671:656];
	wbuffer_inter_full42[127:112] <= wbuffer_inter[2][1][671:656];
	wbuffer_inter_full42[143:128] <= wbuffer_inter[2][2][671:656];
end
always@(*) begin
	wbuffer_inter_full43[15:0]    <= wbuffer_inter[0][0][687:672];
	wbuffer_inter_full43[31:16]   <= wbuffer_inter[0][1][687:672];
	wbuffer_inter_full43[47:32]   <= wbuffer_inter[0][2][687:672];
	wbuffer_inter_full43[63:48]   <= wbuffer_inter[1][0][687:672];
	wbuffer_inter_full43[79:64]   <= wbuffer_inter[1][1][687:672];
	wbuffer_inter_full43[95:80]   <= wbuffer_inter[1][2][687:672];
	wbuffer_inter_full43[111:96]  <= wbuffer_inter[2][0][687:672];
	wbuffer_inter_full43[127:112] <= wbuffer_inter[2][1][687:672];
	wbuffer_inter_full43[143:128] <= wbuffer_inter[2][2][687:672];
end
always@(*) begin
	wbuffer_inter_full44[15:0]    <= wbuffer_inter[0][0][703:688];
	wbuffer_inter_full44[31:16]   <= wbuffer_inter[0][1][703:688];
	wbuffer_inter_full44[47:32]   <= wbuffer_inter[0][2][703:688];
	wbuffer_inter_full44[63:48]   <= wbuffer_inter[1][0][703:688];
	wbuffer_inter_full44[79:64]   <= wbuffer_inter[1][1][703:688];
	wbuffer_inter_full44[95:80]   <= wbuffer_inter[1][2][703:688];
	wbuffer_inter_full44[111:96]  <= wbuffer_inter[2][0][703:688];
	wbuffer_inter_full44[127:112] <= wbuffer_inter[2][1][703:688];
	wbuffer_inter_full44[143:128] <= wbuffer_inter[2][2][703:688];
end
always@(*) begin
	wbuffer_inter_full45[15:0]    <= wbuffer_inter[0][0][719:704];
	wbuffer_inter_full45[31:16]   <= wbuffer_inter[0][1][719:704];
	wbuffer_inter_full45[47:32]   <= wbuffer_inter[0][2][719:704];
	wbuffer_inter_full45[63:48]   <= wbuffer_inter[1][0][719:704];
	wbuffer_inter_full45[79:64]   <= wbuffer_inter[1][1][719:704];
	wbuffer_inter_full45[95:80]   <= wbuffer_inter[1][2][719:704];
	wbuffer_inter_full45[111:96]  <= wbuffer_inter[2][0][719:704];
	wbuffer_inter_full45[127:112] <= wbuffer_inter[2][1][719:704];
	wbuffer_inter_full45[143:128] <= wbuffer_inter[2][2][719:704];
end
always@(*) begin
	wbuffer_inter_full46[15:0]    <= wbuffer_inter[0][0][735:720];
	wbuffer_inter_full46[31:16]   <= wbuffer_inter[0][1][735:720];
	wbuffer_inter_full46[47:32]   <= wbuffer_inter[0][2][735:720];
	wbuffer_inter_full46[63:48]   <= wbuffer_inter[1][0][735:720];
	wbuffer_inter_full46[79:64]   <= wbuffer_inter[1][1][735:720];
	wbuffer_inter_full46[95:80]   <= wbuffer_inter[1][2][735:720];
	wbuffer_inter_full46[111:96]  <= wbuffer_inter[2][0][735:720];
	wbuffer_inter_full46[127:112] <= wbuffer_inter[2][1][735:720];
	wbuffer_inter_full46[143:128] <= wbuffer_inter[2][2][735:720];
end
always@(*) begin
	wbuffer_inter_full47[15:0]    <= wbuffer_inter[0][0][751:736];
	wbuffer_inter_full47[31:16]   <= wbuffer_inter[0][1][751:736];
	wbuffer_inter_full47[47:32]   <= wbuffer_inter[0][2][751:736];
	wbuffer_inter_full47[63:48]   <= wbuffer_inter[1][0][751:736];
	wbuffer_inter_full47[79:64]   <= wbuffer_inter[1][1][751:736];
	wbuffer_inter_full47[95:80]   <= wbuffer_inter[1][2][751:736];
	wbuffer_inter_full47[111:96]  <= wbuffer_inter[2][0][751:736];
	wbuffer_inter_full47[127:112] <= wbuffer_inter[2][1][751:736];
	wbuffer_inter_full47[143:128] <= wbuffer_inter[2][2][751:736];
end
always@(*) begin
	wbuffer_inter_full48[15:0]    <= wbuffer_inter[0][0][767:752];
	wbuffer_inter_full48[31:16]   <= wbuffer_inter[0][1][767:752];
	wbuffer_inter_full48[47:32]   <= wbuffer_inter[0][2][767:752];
	wbuffer_inter_full48[63:48]   <= wbuffer_inter[1][0][767:752];
	wbuffer_inter_full48[79:64]   <= wbuffer_inter[1][1][767:752];
	wbuffer_inter_full48[95:80]   <= wbuffer_inter[1][2][767:752];
	wbuffer_inter_full48[111:96]  <= wbuffer_inter[2][0][767:752];
	wbuffer_inter_full48[127:112] <= wbuffer_inter[2][1][767:752];
	wbuffer_inter_full48[143:128] <= wbuffer_inter[2][2][767:752];
end
always@(*) begin
	wbuffer_inter_full49[15:0]    <= wbuffer_inter[0][0][783:768];
	wbuffer_inter_full49[31:16]   <= wbuffer_inter[0][1][783:768];
	wbuffer_inter_full49[47:32]   <= wbuffer_inter[0][2][783:768];
	wbuffer_inter_full49[63:48]   <= wbuffer_inter[1][0][783:768];
	wbuffer_inter_full49[79:64]   <= wbuffer_inter[1][1][783:768];
	wbuffer_inter_full49[95:80]   <= wbuffer_inter[1][2][783:768];
	wbuffer_inter_full49[111:96]  <= wbuffer_inter[2][0][783:768];
	wbuffer_inter_full49[127:112] <= wbuffer_inter[2][1][783:768];
	wbuffer_inter_full49[143:128] <= wbuffer_inter[2][2][783:768];
end
always@(*) begin
	wbuffer_inter_full50[15:0]    <= wbuffer_inter[0][0][799:784];
	wbuffer_inter_full50[31:16]   <= wbuffer_inter[0][1][799:784];
	wbuffer_inter_full50[47:32]   <= wbuffer_inter[0][2][799:784];
	wbuffer_inter_full50[63:48]   <= wbuffer_inter[1][0][799:784];
	wbuffer_inter_full50[79:64]   <= wbuffer_inter[1][1][799:784];
	wbuffer_inter_full50[95:80]   <= wbuffer_inter[1][2][799:784];
	wbuffer_inter_full50[111:96]  <= wbuffer_inter[2][0][799:784];
	wbuffer_inter_full50[127:112] <= wbuffer_inter[2][1][799:784];
	wbuffer_inter_full50[143:128] <= wbuffer_inter[2][2][799:784];
end
always@(*) begin
	wbuffer_inter_full51[15:0]    <= wbuffer_inter[0][0][815:800];
	wbuffer_inter_full51[31:16]   <= wbuffer_inter[0][1][815:800];
	wbuffer_inter_full51[47:32]   <= wbuffer_inter[0][2][815:800];
	wbuffer_inter_full51[63:48]   <= wbuffer_inter[1][0][815:800];
	wbuffer_inter_full51[79:64]   <= wbuffer_inter[1][1][815:800];
	wbuffer_inter_full51[95:80]   <= wbuffer_inter[1][2][815:800];
	wbuffer_inter_full51[111:96]  <= wbuffer_inter[2][0][815:800];
	wbuffer_inter_full51[127:112] <= wbuffer_inter[2][1][815:800];
	wbuffer_inter_full51[143:128] <= wbuffer_inter[2][2][815:800];
end
always@(*) begin
	wbuffer_inter_full52[15:0]    <= wbuffer_inter[0][0][831:816];
	wbuffer_inter_full52[31:16]   <= wbuffer_inter[0][1][831:816];
	wbuffer_inter_full52[47:32]   <= wbuffer_inter[0][2][831:816];
	wbuffer_inter_full52[63:48]   <= wbuffer_inter[1][0][831:816];
	wbuffer_inter_full52[79:64]   <= wbuffer_inter[1][1][831:816];
	wbuffer_inter_full52[95:80]   <= wbuffer_inter[1][2][831:816];
	wbuffer_inter_full52[111:96]  <= wbuffer_inter[2][0][831:816];
	wbuffer_inter_full52[127:112] <= wbuffer_inter[2][1][831:816];
	wbuffer_inter_full52[143:128] <= wbuffer_inter[2][2][831:816];
end
always@(*) begin
	wbuffer_inter_full53[15:0]    <= wbuffer_inter[0][0][847:832];
	wbuffer_inter_full53[31:16]   <= wbuffer_inter[0][1][847:832];
	wbuffer_inter_full53[47:32]   <= wbuffer_inter[0][2][847:832];
	wbuffer_inter_full53[63:48]   <= wbuffer_inter[1][0][847:832];
	wbuffer_inter_full53[79:64]   <= wbuffer_inter[1][1][847:832];
	wbuffer_inter_full53[95:80]   <= wbuffer_inter[1][2][847:832];
	wbuffer_inter_full53[111:96]  <= wbuffer_inter[2][0][847:832];
	wbuffer_inter_full53[127:112] <= wbuffer_inter[2][1][847:832];
	wbuffer_inter_full53[143:128] <= wbuffer_inter[2][2][847:832];
end
always@(*) begin
	wbuffer_inter_full54[15:0]    <= wbuffer_inter[0][0][863:848];
	wbuffer_inter_full54[31:16]   <= wbuffer_inter[0][1][863:848];
	wbuffer_inter_full54[47:32]   <= wbuffer_inter[0][2][863:848];
	wbuffer_inter_full54[63:48]   <= wbuffer_inter[1][0][863:848];
	wbuffer_inter_full54[79:64]   <= wbuffer_inter[1][1][863:848];
	wbuffer_inter_full54[95:80]   <= wbuffer_inter[1][2][863:848];
	wbuffer_inter_full54[111:96]  <= wbuffer_inter[2][0][863:848];
	wbuffer_inter_full54[127:112] <= wbuffer_inter[2][1][863:848];
	wbuffer_inter_full54[143:128] <= wbuffer_inter[2][2][863:848];
end
always@(*) begin
	wbuffer_inter_full55[15:0]    <= wbuffer_inter[0][0][879:864];
	wbuffer_inter_full55[31:16]   <= wbuffer_inter[0][1][879:864];
	wbuffer_inter_full55[47:32]   <= wbuffer_inter[0][2][879:864];
	wbuffer_inter_full55[63:48]   <= wbuffer_inter[1][0][879:864];
	wbuffer_inter_full55[79:64]   <= wbuffer_inter[1][1][879:864];
	wbuffer_inter_full55[95:80]   <= wbuffer_inter[1][2][879:864];
	wbuffer_inter_full55[111:96]  <= wbuffer_inter[2][0][879:864];
	wbuffer_inter_full55[127:112] <= wbuffer_inter[2][1][879:864];
	wbuffer_inter_full55[143:128] <= wbuffer_inter[2][2][879:864];
end
always@(*) begin
	wbuffer_inter_full56[15:0]    <= wbuffer_inter[0][0][895:880];
	wbuffer_inter_full56[31:16]   <= wbuffer_inter[0][1][895:880];
	wbuffer_inter_full56[47:32]   <= wbuffer_inter[0][2][895:880];
	wbuffer_inter_full56[63:48]   <= wbuffer_inter[1][0][895:880];
	wbuffer_inter_full56[79:64]   <= wbuffer_inter[1][1][895:880];
	wbuffer_inter_full56[95:80]   <= wbuffer_inter[1][2][895:880];
	wbuffer_inter_full56[111:96]  <= wbuffer_inter[2][0][895:880];
	wbuffer_inter_full56[127:112] <= wbuffer_inter[2][1][895:880];
	wbuffer_inter_full56[143:128] <= wbuffer_inter[2][2][895:880];
end
always@(*) begin
	wbuffer_inter_full57[15:0]    <= wbuffer_inter[0][0][911:896];
	wbuffer_inter_full57[31:16]   <= wbuffer_inter[0][1][911:896];
	wbuffer_inter_full57[47:32]   <= wbuffer_inter[0][2][911:896];
	wbuffer_inter_full57[63:48]   <= wbuffer_inter[1][0][911:896];
	wbuffer_inter_full57[79:64]   <= wbuffer_inter[1][1][911:896];
	wbuffer_inter_full57[95:80]   <= wbuffer_inter[1][2][911:896];
	wbuffer_inter_full57[111:96]  <= wbuffer_inter[2][0][911:896];
	wbuffer_inter_full57[127:112] <= wbuffer_inter[2][1][911:896];
	wbuffer_inter_full57[143:128] <= wbuffer_inter[2][2][911:896];
end
always@(*) begin
	wbuffer_inter_full58[15:0]    <= wbuffer_inter[0][0][927:912];
	wbuffer_inter_full58[31:16]   <= wbuffer_inter[0][1][927:912];
	wbuffer_inter_full58[47:32]   <= wbuffer_inter[0][2][927:912];
	wbuffer_inter_full58[63:48]   <= wbuffer_inter[1][0][927:912];
	wbuffer_inter_full58[79:64]   <= wbuffer_inter[1][1][927:912];
	wbuffer_inter_full58[95:80]   <= wbuffer_inter[1][2][927:912];
	wbuffer_inter_full58[111:96]  <= wbuffer_inter[2][0][927:912];
	wbuffer_inter_full58[127:112] <= wbuffer_inter[2][1][927:912];
	wbuffer_inter_full58[143:128] <= wbuffer_inter[2][2][927:912];
end
always@(*) begin
	wbuffer_inter_full59[15:0]    <= wbuffer_inter[0][0][943:928];
	wbuffer_inter_full59[31:16]   <= wbuffer_inter[0][1][943:928];
	wbuffer_inter_full59[47:32]   <= wbuffer_inter[0][2][943:928];
	wbuffer_inter_full59[63:48]   <= wbuffer_inter[1][0][943:928];
	wbuffer_inter_full59[79:64]   <= wbuffer_inter[1][1][943:928];
	wbuffer_inter_full59[95:80]   <= wbuffer_inter[1][2][943:928];
	wbuffer_inter_full59[111:96]  <= wbuffer_inter[2][0][943:928];
	wbuffer_inter_full59[127:112] <= wbuffer_inter[2][1][943:928];
	wbuffer_inter_full59[143:128] <= wbuffer_inter[2][2][943:928];
end
always@(*) begin
	wbuffer_inter_full60[15:0]    <= wbuffer_inter[0][0][959:944];
	wbuffer_inter_full60[31:16]   <= wbuffer_inter[0][1][959:944];
	wbuffer_inter_full60[47:32]   <= wbuffer_inter[0][2][959:944];
	wbuffer_inter_full60[63:48]   <= wbuffer_inter[1][0][959:944];
	wbuffer_inter_full60[79:64]   <= wbuffer_inter[1][1][959:944];
	wbuffer_inter_full60[95:80]   <= wbuffer_inter[1][2][959:944];
	wbuffer_inter_full60[111:96]  <= wbuffer_inter[2][0][959:944];
	wbuffer_inter_full60[127:112] <= wbuffer_inter[2][1][959:944];
	wbuffer_inter_full60[143:128] <= wbuffer_inter[2][2][959:944];
end
always@(*) begin
	wbuffer_inter_full61[15:0]    <= wbuffer_inter[0][0][975:960];
	wbuffer_inter_full61[31:16]   <= wbuffer_inter[0][1][975:960];
	wbuffer_inter_full61[47:32]   <= wbuffer_inter[0][2][975:960];
	wbuffer_inter_full61[63:48]   <= wbuffer_inter[1][0][975:960];
	wbuffer_inter_full61[79:64]   <= wbuffer_inter[1][1][975:960];
	wbuffer_inter_full61[95:80]   <= wbuffer_inter[1][2][975:960];
	wbuffer_inter_full61[111:96]  <= wbuffer_inter[2][0][975:960];
	wbuffer_inter_full61[127:112] <= wbuffer_inter[2][1][975:960];
	wbuffer_inter_full61[143:128] <= wbuffer_inter[2][2][975:960];
end
always@(*) begin
	wbuffer_inter_full62[15:0]    <= wbuffer_inter[0][0][991:976];
	wbuffer_inter_full62[31:16]   <= wbuffer_inter[0][1][991:976];
	wbuffer_inter_full62[47:32]   <= wbuffer_inter[0][2][991:976];
	wbuffer_inter_full62[63:48]   <= wbuffer_inter[1][0][991:976];
	wbuffer_inter_full62[79:64]   <= wbuffer_inter[1][1][991:976];
	wbuffer_inter_full62[95:80]   <= wbuffer_inter[1][2][991:976];
	wbuffer_inter_full62[111:96]  <= wbuffer_inter[2][0][991:976];
	wbuffer_inter_full62[127:112] <= wbuffer_inter[2][1][991:976];
	wbuffer_inter_full62[143:128] <= wbuffer_inter[2][2][991:976];
end
always@(*) begin
	wbuffer_inter_full63[15:0]    <= wbuffer_inter[0][0][1007:992];
	wbuffer_inter_full63[31:16]   <= wbuffer_inter[0][1][1007:992];
	wbuffer_inter_full63[47:32]   <= wbuffer_inter[0][2][1007:992];
	wbuffer_inter_full63[63:48]   <= wbuffer_inter[1][0][1007:992];
	wbuffer_inter_full63[79:64]   <= wbuffer_inter[1][1][1007:992];
	wbuffer_inter_full63[95:80]   <= wbuffer_inter[1][2][1007:992];
	wbuffer_inter_full63[111:96]  <= wbuffer_inter[2][0][1007:992];
	wbuffer_inter_full63[127:112] <= wbuffer_inter[2][1][1007:992];
	wbuffer_inter_full63[143:128] <= wbuffer_inter[2][2][1007:992];
end
always@(*) begin
	wbuffer_inter_full64[15:0]    <= wbuffer_inter[0][0][1023:1008];
	wbuffer_inter_full64[31:16]   <= wbuffer_inter[0][1][1023:1008];
	wbuffer_inter_full64[47:32]   <= wbuffer_inter[0][2][1023:1008];
	wbuffer_inter_full64[63:48]   <= wbuffer_inter[1][0][1023:1008];
	wbuffer_inter_full64[79:64]   <= wbuffer_inter[1][1][1023:1008];
	wbuffer_inter_full64[95:80]   <= wbuffer_inter[1][2][1023:1008];
	wbuffer_inter_full64[111:96]  <= wbuffer_inter[2][0][1023:1008];
	wbuffer_inter_full64[127:112] <= wbuffer_inter[2][1][1023:1008];
	wbuffer_inter_full64[143:128] <= wbuffer_inter[2][2][1023:1008];
end


always@(*) begin
    enable_inter_conv = Output_BRAM_we[0];
    enable_final_conv = Output_final_BRAM_we[0];
    Output_inter_BRAM_we_reg <= Output_inter_BRAM_we;
    //final_inter_output1[63:0] <= Output_final_write_data[63:0];
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

/*add_along_dimension a1(
    .clk(clk),
    .Output_write_data(Output_inter_write_data),
    .Output_BRAM_we(Output_inter_BRAM_we),
    .enable_conv(enable_inter_conv),
    .conv_concat(Output_write_data)
        ); */             

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

multiply_add ma7(
    .clk(clk),
    .Output_write_data(Output_final_write_data[63:48]),
    .Output_BRAM_we(Output_final_BRAM_we_temp_temp_temp),
    .enable_conv(enable_conv2),
    .filter_full(filter_inter_full4),
    .wbuffer_full(wbuffer_inter_full4)
        );
        
multiply_add ma8(
    .clk(clk),
    .Output_write_data(Output_final_write_data[79:64]),
    .Output_BRAM_we(Output_final_BRAM_we_temp_temp_temp_temp),
    .enable_conv(enable_conv2),
    .filter_full(filter_inter_full5),
    .wbuffer_full(wbuffer_inter_full5)
        );

multiply_add ma9(
	.clk(clk),
	.Output_write_data(Output_final_write_data[95:80]),
	.Output_BRAM_we(Output_final_BRAM_we_temp6),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full6),
	.wbuffer_full(wbuffer_inter_full6)
    );
multiply_add ma10(
	.clk(clk),
	.Output_write_data(Output_final_write_data[111:96]),
	.Output_BRAM_we(Output_final_BRAM_we_temp7),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full7),
	.wbuffer_full(wbuffer_inter_full7)
    );
multiply_add ma11(
	.clk(clk),
	.Output_write_data(Output_final_write_data[127:112]),
	.Output_BRAM_we(Output_final_BRAM_we_temp8),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full8),
	.wbuffer_full(wbuffer_inter_full8)
    );
multiply_add ma12(
	.clk(clk),
	.Output_write_data(Output_final_write_data[143:128]),
	.Output_BRAM_we(Output_final_BRAM_we_temp9),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full9),
	.wbuffer_full(wbuffer_inter_full9)
    );
multiply_add ma13(
	.clk(clk),
	.Output_write_data(Output_final_write_data[159:144]),
	.Output_BRAM_we(Output_final_BRAM_we_temp10),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full10),
	.wbuffer_full(wbuffer_inter_full10)
    );
multiply_add ma14(
	.clk(clk),
	.Output_write_data(Output_final_write_data[175:160]),
	.Output_BRAM_we(Output_final_BRAM_we_temp11),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full11),
	.wbuffer_full(wbuffer_inter_full11)
    );
multiply_add ma15(
	.clk(clk),
	.Output_write_data(Output_final_write_data[191:176]),
	.Output_BRAM_we(Output_final_BRAM_we_temp12),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full12),
	.wbuffer_full(wbuffer_inter_full12)
    );
multiply_add ma16(
	.clk(clk),
	.Output_write_data(Output_final_write_data[207:192]),
	.Output_BRAM_we(Output_final_BRAM_we_temp13),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full13),
	.wbuffer_full(wbuffer_inter_full13)
    );
multiply_add ma17(
	.clk(clk),
	.Output_write_data(Output_final_write_data[223:208]),
	.Output_BRAM_we(Output_final_BRAM_we_temp14),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full14),
	.wbuffer_full(wbuffer_inter_full14)
    );
multiply_add ma18(
	.clk(clk),
	.Output_write_data(Output_final_write_data[239:224]),
	.Output_BRAM_we(Output_final_BRAM_we_temp15),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full15),
	.wbuffer_full(wbuffer_inter_full15)
    );
multiply_add ma19(
	.clk(clk),
	.Output_write_data(Output_final_write_data[255:240]),
	.Output_BRAM_we(Output_final_BRAM_we_temp16),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full16),
	.wbuffer_full(wbuffer_inter_full16)
    );
multiply_add ma20(
	.clk(clk),
	.Output_write_data(Output_final_write_data[271:256]),
	.Output_BRAM_we(Output_final_BRAM_we_temp17),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full17),
	.wbuffer_full(wbuffer_inter_full17)
    );
multiply_add ma21(
	.clk(clk),
	.Output_write_data(Output_final_write_data[287:272]),
	.Output_BRAM_we(Output_final_BRAM_we_temp18),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full18),
	.wbuffer_full(wbuffer_inter_full18)
    );
multiply_add ma22(
	.clk(clk),
	.Output_write_data(Output_final_write_data[303:288]),
	.Output_BRAM_we(Output_final_BRAM_we_temp19),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full19),
	.wbuffer_full(wbuffer_inter_full19)
    );
multiply_add ma23(
	.clk(clk),
	.Output_write_data(Output_final_write_data[319:304]),
	.Output_BRAM_we(Output_final_BRAM_we_temp20),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full20),
	.wbuffer_full(wbuffer_inter_full20)
    );
multiply_add ma24(
	.clk(clk),
	.Output_write_data(Output_final_write_data[335:320]),
	.Output_BRAM_we(Output_final_BRAM_we_temp21),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full21),
	.wbuffer_full(wbuffer_inter_full21)
    );
multiply_add ma25(
	.clk(clk),
	.Output_write_data(Output_final_write_data[351:336]),
	.Output_BRAM_we(Output_final_BRAM_we_temp22),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full22),
	.wbuffer_full(wbuffer_inter_full22)
    );
multiply_add ma26(
	.clk(clk),
	.Output_write_data(Output_final_write_data[367:352]),
	.Output_BRAM_we(Output_final_BRAM_we_temp23),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full23),
	.wbuffer_full(wbuffer_inter_full23)
    );
multiply_add ma27(
	.clk(clk),
	.Output_write_data(Output_final_write_data[383:368]),
	.Output_BRAM_we(Output_final_BRAM_we_temp24),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full24),
	.wbuffer_full(wbuffer_inter_full24)
    );
multiply_add ma28(
	.clk(clk),
	.Output_write_data(Output_final_write_data[399:384]),
	.Output_BRAM_we(Output_final_BRAM_we_temp25),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full25),
	.wbuffer_full(wbuffer_inter_full25)
    );
multiply_add ma29(
	.clk(clk),
	.Output_write_data(Output_final_write_data[415:400]),
	.Output_BRAM_we(Output_final_BRAM_we_temp26),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full26),
	.wbuffer_full(wbuffer_inter_full26)
    );
multiply_add ma30(
	.clk(clk),
	.Output_write_data(Output_final_write_data[431:416]),
	.Output_BRAM_we(Output_final_BRAM_we_temp27),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full27),
	.wbuffer_full(wbuffer_inter_full27)
    );
multiply_add ma31(
	.clk(clk),
	.Output_write_data(Output_final_write_data[447:432]),
	.Output_BRAM_we(Output_final_BRAM_we_temp28),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full28),
	.wbuffer_full(wbuffer_inter_full28)
    );
multiply_add ma32(
	.clk(clk),
	.Output_write_data(Output_final_write_data[463:448]),
	.Output_BRAM_we(Output_final_BRAM_we_temp29),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full29),
	.wbuffer_full(wbuffer_inter_full29)
    );
multiply_add ma33(
	.clk(clk),
	.Output_write_data(Output_final_write_data[479:464]),
	.Output_BRAM_we(Output_final_BRAM_we_temp30),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full30),
	.wbuffer_full(wbuffer_inter_full30)
    );
multiply_add ma34(
	.clk(clk),
	.Output_write_data(Output_final_write_data[495:480]),
	.Output_BRAM_we(Output_final_BRAM_we_temp31),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full31),
	.wbuffer_full(wbuffer_inter_full31)
    );
multiply_add ma35(
	.clk(clk),
	.Output_write_data(Output_final_write_data[511:496]),
	.Output_BRAM_we(Output_final_BRAM_we_temp32),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full32),
	.wbuffer_full(wbuffer_inter_full32)
    );
multiply_add ma36(
	.clk(clk),
	.Output_write_data(Output_final_write_data[527:512]),
	.Output_BRAM_we(Output_final_BRAM_we_temp33),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full33),
	.wbuffer_full(wbuffer_inter_full33)
    );
multiply_add ma37(
	.clk(clk),
	.Output_write_data(Output_final_write_data[543:528]),
	.Output_BRAM_we(Output_final_BRAM_we_temp34),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full34),
	.wbuffer_full(wbuffer_inter_full34)
    );
multiply_add ma38(
	.clk(clk),
	.Output_write_data(Output_final_write_data[559:544]),
	.Output_BRAM_we(Output_final_BRAM_we_temp35),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full35),
	.wbuffer_full(wbuffer_inter_full35)
    );
multiply_add ma39(
	.clk(clk),
	.Output_write_data(Output_final_write_data[575:560]),
	.Output_BRAM_we(Output_final_BRAM_we_temp36),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full36),
	.wbuffer_full(wbuffer_inter_full36)
    );
multiply_add ma40(
	.clk(clk),
	.Output_write_data(Output_final_write_data[591:576]),
	.Output_BRAM_we(Output_final_BRAM_we_temp37),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full37),
	.wbuffer_full(wbuffer_inter_full37)
    );
multiply_add ma41(
	.clk(clk),
	.Output_write_data(Output_final_write_data[607:592]),
	.Output_BRAM_we(Output_final_BRAM_we_temp38),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full38),
	.wbuffer_full(wbuffer_inter_full38)
    );
multiply_add ma42(
	.clk(clk),
	.Output_write_data(Output_final_write_data[623:608]),
	.Output_BRAM_we(Output_final_BRAM_we_temp39),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full39),
	.wbuffer_full(wbuffer_inter_full39)
    );
multiply_add ma43(
	.clk(clk),
	.Output_write_data(Output_final_write_data[639:624]),
	.Output_BRAM_we(Output_final_BRAM_we_temp40),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full40),
	.wbuffer_full(wbuffer_inter_full40)
    );
multiply_add ma44(
	.clk(clk),
	.Output_write_data(Output_final_write_data[655:640]),
	.Output_BRAM_we(Output_final_BRAM_we_temp41),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full41),
	.wbuffer_full(wbuffer_inter_full41)
    );
multiply_add ma45(
	.clk(clk),
	.Output_write_data(Output_final_write_data[671:656]),
	.Output_BRAM_we(Output_final_BRAM_we_temp42),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full42),
	.wbuffer_full(wbuffer_inter_full42)
    );
multiply_add ma46(
	.clk(clk),
	.Output_write_data(Output_final_write_data[687:672]),
	.Output_BRAM_we(Output_final_BRAM_we_temp43),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full43),
	.wbuffer_full(wbuffer_inter_full43)
    );
multiply_add ma47(
	.clk(clk),
	.Output_write_data(Output_final_write_data[703:688]),
	.Output_BRAM_we(Output_final_BRAM_we_temp44),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full44),
	.wbuffer_full(wbuffer_inter_full44)
    );
multiply_add ma48(
	.clk(clk),
	.Output_write_data(Output_final_write_data[719:704]),
	.Output_BRAM_we(Output_final_BRAM_we_temp45),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full45),
	.wbuffer_full(wbuffer_inter_full45)
    );
multiply_add ma49(
	.clk(clk),
	.Output_write_data(Output_final_write_data[735:720]),
	.Output_BRAM_we(Output_final_BRAM_we_temp46),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full46),
	.wbuffer_full(wbuffer_inter_full46)
    );
multiply_add ma50(
	.clk(clk),
	.Output_write_data(Output_final_write_data[751:736]),
	.Output_BRAM_we(Output_final_BRAM_we_temp47),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full47),
	.wbuffer_full(wbuffer_inter_full47)
    );
multiply_add ma51(
	.clk(clk),
	.Output_write_data(Output_final_write_data[767:752]),
	.Output_BRAM_we(Output_final_BRAM_we_temp48),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full48),
	.wbuffer_full(wbuffer_inter_full48)
    );
multiply_add ma52(
	.clk(clk),
	.Output_write_data(Output_final_write_data[783:768]),
	.Output_BRAM_we(Output_final_BRAM_we_temp49),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full49),
	.wbuffer_full(wbuffer_inter_full49)
    );
multiply_add ma53(
	.clk(clk),
	.Output_write_data(Output_final_write_data[799:784]),
	.Output_BRAM_we(Output_final_BRAM_we_temp50),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full50),
	.wbuffer_full(wbuffer_inter_full50)
    );
multiply_add ma54(
	.clk(clk),
	.Output_write_data(Output_final_write_data[815:800]),
	.Output_BRAM_we(Output_final_BRAM_we_temp51),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full51),
	.wbuffer_full(wbuffer_inter_full51)
    );
multiply_add ma55(
	.clk(clk),
	.Output_write_data(Output_final_write_data[831:816]),
	.Output_BRAM_we(Output_final_BRAM_we_temp52),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full52),
	.wbuffer_full(wbuffer_inter_full52)
    );
multiply_add ma56(
	.clk(clk),
	.Output_write_data(Output_final_write_data[847:832]),
	.Output_BRAM_we(Output_final_BRAM_we_temp53),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full53),
	.wbuffer_full(wbuffer_inter_full53)
    );
multiply_add ma57(
	.clk(clk),
	.Output_write_data(Output_final_write_data[863:848]),
	.Output_BRAM_we(Output_final_BRAM_we_temp54),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full54),
	.wbuffer_full(wbuffer_inter_full54)
    );
multiply_add ma58(
	.clk(clk),
	.Output_write_data(Output_final_write_data[879:864]),
	.Output_BRAM_we(Output_final_BRAM_we_temp55),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full55),
	.wbuffer_full(wbuffer_inter_full55)
    );
multiply_add ma59(
	.clk(clk),
	.Output_write_data(Output_final_write_data[895:880]),
	.Output_BRAM_we(Output_final_BRAM_we_temp56),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full56),
	.wbuffer_full(wbuffer_inter_full56)
    );
multiply_add ma60(
	.clk(clk),
	.Output_write_data(Output_final_write_data[911:896]),
	.Output_BRAM_we(Output_final_BRAM_we_temp57),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full57),
	.wbuffer_full(wbuffer_inter_full57)
    );
multiply_add ma61(
	.clk(clk),
	.Output_write_data(Output_final_write_data[927:912]),
	.Output_BRAM_we(Output_final_BRAM_we_temp58),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full58),
	.wbuffer_full(wbuffer_inter_full58)
    );
multiply_add ma62(
	.clk(clk),
	.Output_write_data(Output_final_write_data[943:928]),
	.Output_BRAM_we(Output_final_BRAM_we_temp59),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full59),
	.wbuffer_full(wbuffer_inter_full59)
    );
multiply_add ma63(
	.clk(clk),
	.Output_write_data(Output_final_write_data[959:944]),
	.Output_BRAM_we(Output_final_BRAM_we_temp60),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full60),
	.wbuffer_full(wbuffer_inter_full60)
    );
multiply_add ma64(
	.clk(clk),
	.Output_write_data(Output_final_write_data[975:960]),
	.Output_BRAM_we(Output_final_BRAM_we_temp61),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full61),
	.wbuffer_full(wbuffer_inter_full61)
    );
multiply_add ma65(
	.clk(clk),
	.Output_write_data(Output_final_write_data[991:976]),
	.Output_BRAM_we(Output_final_BRAM_we_temp62),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full62),
	.wbuffer_full(wbuffer_inter_full62)
    );
multiply_add ma66(
	.clk(clk),
	.Output_write_data(Output_final_write_data[1007:992]),
	.Output_BRAM_we(Output_final_BRAM_we_temp63),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full63),
	.wbuffer_full(wbuffer_inter_full63)
    );
multiply_add ma67(
	.clk(clk),
	.Output_write_data(Output_final_write_data[1023:1008]),
	.Output_BRAM_we(Output_final_BRAM_we_temp64),
	.enable_conv(enable_conv2),
	.filter_full(filter_inter_full64),
	.wbuffer_full(wbuffer_inter_full64)
    );

/*add_only_dimension2 a2(
    .clk(clk),
    .Output_write_data(Output_finalSum_write_data),
    .Output_BRAM_we(Output_finalSum_BRAM_we),
    .enable_conv(enable_final_conv),
    .conv_concat(Output_final_write_data)
        );               
*/


reg [5:0] conv_state;

always@(fbram1_read_data or fbram2_read_data or fbram3_read_data or fbram4_read_data or fbram5_read_data or fbram6_read_data or fbram7_read_data or fbram8_read_data or fbram9_read_data )begin
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

   
//prepare window
always@(posedge clk )
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
                
                fbram1_read_addr<=(fbram1_read_addr==(Nooffilters-9'd1))?18'd0:(fbram1_read_addr+18'd1);
                fbram2_read_addr<=(fbram2_read_addr==(Nooffilters-9'd1))?18'd0:(fbram2_read_addr+18'd1);
                fbram3_read_addr<=(fbram3_read_addr==(Nooffilters-9'd1))?18'd0:(fbram3_read_addr+18'd1);
                fbram4_read_addr<=(fbram4_read_addr==(Nooffilters-9'd1))?18'd0:(fbram4_read_addr+18'd1);
                fbram5_read_addr<=(fbram5_read_addr==(Nooffilters-9'd1))?18'd0:(fbram5_read_addr+18'd1);
                fbram6_read_addr<=(fbram6_read_addr==(Nooffilters-9'd1))?18'd0:(fbram6_read_addr+18'd1);
                fbram7_read_addr<=(fbram7_read_addr==(Nooffilters-9'd1))?18'd0:(fbram7_read_addr+18'd1);
                fbram8_read_addr<=(fbram8_read_addr==(Nooffilters-9'd1))?18'd0:(fbram8_read_addr+18'd1);
                fbram9_read_addr<=(fbram9_read_addr==(Nooffilters-9'd1))?18'd0:(fbram9_read_addr+18'd1);
                
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
 
 always@(posedge clk && filter_inter_update_en ) begin
    
     fbram1_inter_read_addr<=(fbram1_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram1_inter_read_addr+18'd1);
     fbram2_inter_read_addr<=(fbram2_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram2_inter_read_addr+18'd1);
     fbram3_inter_read_addr<=(fbram3_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram3_inter_read_addr+18'd1);
     fbram4_inter_read_addr<=(fbram4_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram4_inter_read_addr+18'd1);
     fbram5_inter_read_addr<=(fbram5_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram5_inter_read_addr+18'd1);
     fbram6_inter_read_addr<=(fbram6_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram6_inter_read_addr+18'd1);
     fbram7_inter_read_addr<=(fbram7_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram7_inter_read_addr+18'd1);
     fbram8_inter_read_addr<=(fbram8_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram8_inter_read_addr+18'd1);
     fbram9_inter_read_addr<=(fbram9_inter_read_addr==(Nooffilters-9'd1))?18'd0:(fbram9_inter_read_addr+18'd1);
     
     //if(Output_inter_BRAM_we_reg == 1'b0 && fbram1_inter_read_addr == (Nooffilters-2'd1)) begin
     //   filter_inter_update_en <= 1'b0;
     //end
 end
 
   
 always@(posedge clk && Output_inter_BRAM_we_reg ) begin
    InterOutput_counter <= (InterOutput_counter >=Nooffilters) ? 2'd1:(InterOutput_counter+2'd1);
    InterInput[15:0]  <= (InterOutput_counter == 3'b001) ? Output_inter_write_data : InterInput[15:0];
    InterInput[31:16] <= (InterOutput_counter == 3'b010) ? Output_inter_write_data : InterInput[31:16];
    InterInput[47:32] <= (InterOutput_counter == 3'b011) ? Output_inter_write_data : InterInput[47:32];
    InterInput[63:48] <= (InterOutput_counter == 3'b100) ? Output_inter_write_data : InterInput[63:48];
    InterInput[79:64] <= (InterOutput_counter == 3'b101) ? Output_inter_write_data : InterInput[79:64];
    InterInput[95:80] <= (InterOutput_counter == 9'd6) ? Output_inter_write_data : InterInput[95:80];
    InterInput[111:96] <= (InterOutput_counter == 9'd7) ? Output_inter_write_data : InterInput[111:96];
    InterInput[127:112] <= (InterOutput_counter == 9'd8) ? Output_inter_write_data : InterInput[127:112];
    InterInput[143:128] <= (InterOutput_counter == 9'd9) ? Output_inter_write_data : InterInput[143:128];
    InterInput[159:144] <= (InterOutput_counter == 9'd10) ? Output_inter_write_data : InterInput[159:144];
    InterInput[175:160] <= (InterOutput_counter == 9'd11) ? Output_inter_write_data : InterInput[175:160];
    InterInput[191:176] <= (InterOutput_counter == 9'd12) ? Output_inter_write_data : InterInput[191:176];
    InterInput[207:192] <= (InterOutput_counter == 9'd13) ? Output_inter_write_data : InterInput[207:192];
    InterInput[223:208] <= (InterOutput_counter == 9'd14) ? Output_inter_write_data : InterInput[223:208];
    InterInput[239:224] <= (InterOutput_counter == 9'd15) ? Output_inter_write_data : InterInput[239:224];
    InterInput[255:240] <= (InterOutput_counter == 9'd16) ? Output_inter_write_data : InterInput[255:240];
    InterInput[271:256] <= (InterOutput_counter == 9'd17) ? Output_inter_write_data : InterInput[271:256];
    InterInput[287:272] <= (InterOutput_counter == 9'd18) ? Output_inter_write_data : InterInput[287:272];
    InterInput[303:288] <= (InterOutput_counter == 9'd19) ? Output_inter_write_data : InterInput[303:288];
    InterInput[319:304] <= (InterOutput_counter == 9'd20) ? Output_inter_write_data : InterInput[319:304];
    InterInput[335:320] <= (InterOutput_counter == 9'd21) ? Output_inter_write_data : InterInput[335:320];
    InterInput[351:336] <= (InterOutput_counter == 9'd22) ? Output_inter_write_data : InterInput[351:336];
    InterInput[367:352] <= (InterOutput_counter == 9'd23) ? Output_inter_write_data : InterInput[367:352];
    InterInput[383:368] <= (InterOutput_counter == 9'd24) ? Output_inter_write_data : InterInput[383:368];
    InterInput[399:384] <= (InterOutput_counter == 9'd25) ? Output_inter_write_data : InterInput[399:384];
    InterInput[415:400] <= (InterOutput_counter == 9'd26) ? Output_inter_write_data : InterInput[415:400];
    InterInput[431:416] <= (InterOutput_counter == 9'd27) ? Output_inter_write_data : InterInput[431:416];
    InterInput[447:432] <= (InterOutput_counter == 9'd28) ? Output_inter_write_data : InterInput[447:432];
    InterInput[463:448] <= (InterOutput_counter == 9'd29) ? Output_inter_write_data : InterInput[463:448];
    InterInput[479:464] <= (InterOutput_counter == 9'd30) ? Output_inter_write_data : InterInput[479:464];
    InterInput[495:480] <= (InterOutput_counter == 9'd31) ? Output_inter_write_data : InterInput[495:480];
    InterInput[511:496] <= (InterOutput_counter == 9'd32) ? Output_inter_write_data : InterInput[511:496];
    InterInput[527:512] <= (InterOutput_counter == 9'd33) ? Output_inter_write_data : InterInput[527:512];
    InterInput[543:528] <= (InterOutput_counter == 9'd34) ? Output_inter_write_data : InterInput[543:528];
    InterInput[559:544] <= (InterOutput_counter == 9'd35) ? Output_inter_write_data : InterInput[559:544];
    InterInput[575:560] <= (InterOutput_counter == 9'd36) ? Output_inter_write_data : InterInput[575:560];
    InterInput[591:576] <= (InterOutput_counter == 9'd37) ? Output_inter_write_data : InterInput[591:576];
    InterInput[607:592] <= (InterOutput_counter == 9'd38) ? Output_inter_write_data : InterInput[607:592];
    InterInput[623:608] <= (InterOutput_counter == 9'd39) ? Output_inter_write_data : InterInput[623:608];
    InterInput[639:624] <= (InterOutput_counter == 9'd40) ? Output_inter_write_data : InterInput[639:624];
    InterInput[655:640] <= (InterOutput_counter == 9'd41) ? Output_inter_write_data : InterInput[655:640];
    InterInput[671:656] <= (InterOutput_counter == 9'd42) ? Output_inter_write_data : InterInput[671:656];
    InterInput[687:672] <= (InterOutput_counter == 9'd43) ? Output_inter_write_data : InterInput[687:672];
    InterInput[703:688] <= (InterOutput_counter == 9'd44) ? Output_inter_write_data : InterInput[703:688];
    InterInput[719:704] <= (InterOutput_counter == 9'd45) ? Output_inter_write_data : InterInput[719:704];
    InterInput[735:720] <= (InterOutput_counter == 9'd46) ? Output_inter_write_data : InterInput[735:720];
    InterInput[751:736] <= (InterOutput_counter == 9'd47) ? Output_inter_write_data : InterInput[751:736];
    InterInput[767:752] <= (InterOutput_counter == 9'd48) ? Output_inter_write_data : InterInput[767:752];
    InterInput[783:768] <= (InterOutput_counter == 9'd49) ? Output_inter_write_data : InterInput[783:768];
    InterInput[799:784] <= (InterOutput_counter == 9'd50) ? Output_inter_write_data : InterInput[799:784];
    InterInput[815:800] <= (InterOutput_counter == 9'd51) ? Output_inter_write_data : InterInput[815:800];
    InterInput[831:816] <= (InterOutput_counter == 9'd52) ? Output_inter_write_data : InterInput[831:816];
    InterInput[847:832] <= (InterOutput_counter == 9'd53) ? Output_inter_write_data : InterInput[847:832];
    InterInput[863:848] <= (InterOutput_counter == 9'd54) ? Output_inter_write_data : InterInput[863:848];
    InterInput[879:864] <= (InterOutput_counter == 9'd55) ? Output_inter_write_data : InterInput[879:864];
    InterInput[895:880] <= (InterOutput_counter == 9'd56) ? Output_inter_write_data : InterInput[895:880];
    InterInput[911:896] <= (InterOutput_counter == 9'd57) ? Output_inter_write_data : InterInput[911:896];
    InterInput[927:912] <= (InterOutput_counter == 9'd58) ? Output_inter_write_data : InterInput[927:912];
    InterInput[943:928] <= (InterOutput_counter == 9'd59) ? Output_inter_write_data : InterInput[943:928];
    InterInput[959:944] <= (InterOutput_counter == 9'd60) ? Output_inter_write_data : InterInput[959:944];
    InterInput[975:960] <= (InterOutput_counter == 9'd61) ? Output_inter_write_data : InterInput[975:960];
    InterInput[991:976] <= (InterOutput_counter == 9'd62) ? Output_inter_write_data : InterInput[991:976];
    InterInput[1007:992] <= (InterOutput_counter == 9'd63) ? Output_inter_write_data : InterInput[1007:992];
    InterInput[1023:1008] <= (InterOutput_counter == 9'd64) ? Output_inter_write_data : InterInput[1023:1008];
    ////////////////////////////////////////changed //////////////////////////////////////////////
    //if(InterOutput_counter == 2'b01) begin
    //    flag_InterInput <= 1'b1;
    //end
    
    if(InterOutput_counter == 9'd62) begin
        flag_InterInput <= 1'b1;
    end
   
    if((Input_inter_read_addr_reg == start_inter_conv_addr-18'd1) && (InterOutput_counter == 9'd62) ) begin
        filter_inter_update_en <= 1'b1;
        enable_conv2 <= 1'b1;
    end else begin
        if(Input_inter_read_addr_reg >= MaxSizeOfInput + 18'd2 ) begin
            filter_inter_update_en <= 1'b0;
            done_conv<=1;
        end
    end
    
    //if(filter_inter_update_en ==1'b1) begin
    //        enable_conv2 <= 1'b1;
    //end
    
    if((lbram1_inter_write_addr == 9'd0) && (Input_inter_curr_row < Input_max_row - 9'd2 )) begin
        pad_enable <= 1'b0;
    end else begin  
        if((lbram1_inter_write_addr == Input_max_col-9'd2)) begin
            pad_enable <= 1'b1;
        end 
    end
    
    if(InterOutput_counter == 9'd62 && flag_InterInput == 1'b1) begin
    
            Input_inter_curr_col<=(Input_inter_curr_col==(Input_max_col-18'd1))?18'd0:(Input_inter_curr_col+18'd1);
            Input_inter_curr_row<=(Input_inter_curr_col==(Input_max_col-18'd1))?(Input_inter_curr_row+18'd1):Input_inter_curr_row;
       
            Input_inter_read_addr_reg<=(Input_max_row*Input_inter_curr_row)+Input_inter_curr_col;
            
            lbram1_inter_read_addr<=(lbram1_inter_read_addr==(Input_max_col-18'd1))?18'd0:(lbram1_inter_read_addr+18'd1);
            lbram2_inter_read_addr<=(lbram2_inter_read_addr==(Input_max_col-18'd1))?18'd0:(lbram2_inter_read_addr+18'd1);
            lbram3_inter_read_addr<=(lbram3_inter_read_addr==(Input_max_col-18'd1))?18'd0:(lbram3_inter_read_addr+18'd1);
            
            lbram1_inter_write_addr<=(lbram1_inter_write_addr==(Input_max_col-18'd1))?18'd0:(lbram1_inter_write_addr+18'd1);
            lbram2_inter_write_addr<=(lbram1_inter_write_addr==(Input_max_col-18'd1))?18'd0:(lbram1_inter_write_addr+18'd1);
            lbram3_inter_write_addr<=(lbram1_inter_write_addr==(Input_max_col-18'd1))?18'd0:(lbram1_inter_write_addr+18'd1);
            ////////////////////////////////////testing of large concatenation /////////////////////////////
            lbram3_inter_we<=128'b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
            lbram2_inter_we<=128'b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
            lbram1_inter_we<=128'b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;       
            /////////////////////////////////////////////////////////////////////////////////////////////////
            lbram1_inter_write_data<=lbram2_inter_read_data;
            lbram2_inter_write_data<=lbram3_inter_read_data;
            if(pad_enable == 1'b0) begin
                lbram3_inter_write_data<=InterInput;
            end else begin
                if(pad_enable == 1'b1) begin
                    lbram3_inter_write_data<=1024'd0;
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
     
always@(posedge clk )
    begin
              filter_update_en<=filter_update_temp;
                    //  Output_finalSum_write_data1<=Output_final_write_data[15:0];

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
//3301
//3023