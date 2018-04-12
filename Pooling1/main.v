`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2018 22:29:52
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
input [15:0] Output_inter_write_data,
output [1023:0] Output_pool_final
    ); 
 
 reg [31:0] InputPool1;
    reg [31:0] InputPool2;
    reg [31:0] InputPool3;
    reg [31:0] InputPool4;
    reg [31:0] InputPool5;
    reg [31:0] InputPool6;
    reg [31:0] InputPool7;
    reg [31:0] InputPool8;
    reg [31:0] InputPool9;
    reg [31:0] InputPool10;
    reg [31:0] InputPool11;
    reg [31:0] InputPool12;
    reg [31:0] InputPool13;
    reg [31:0] InputPool14;
    reg [31:0] InputPool15;
    reg [31:0] InputPool16;
    reg [31:0] InputPool17;
    reg [31:0] InputPool18;
    reg [31:0] InputPool19;
    reg [31:0] InputPool20;
    reg [31:0] InputPool21;
    reg [31:0] InputPool22;
    reg [31:0] InputPool23;
    reg [31:0] InputPool24;
    reg [31:0] InputPool25;
    reg [31:0] InputPool26;
    reg [31:0] InputPool27;
    reg [31:0] InputPool28;
    reg [31:0] InputPool29;
    reg [31:0] InputPool30;
    reg [31:0] InputPool31;
    reg [31:0] InputPool32;
    reg [31:0] InputPool33;
    reg [31:0] InputPool34;
    reg [31:0] InputPool35;
    reg [31:0] InputPool36;
    reg [31:0] InputPool37;
    reg [31:0] InputPool38;
    reg [31:0] InputPool39;
    reg [31:0] InputPool40;
    reg [31:0] InputPool41;
    reg [31:0] InputPool42;
    reg [31:0] InputPool43;
    reg [31:0] InputPool44;
    reg [31:0] InputPool45;
    reg [31:0] InputPool46;
    reg [31:0] InputPool47;
    reg [31:0] InputPool48;
    reg [31:0] InputPool49;
    reg [31:0] InputPool50;
    reg [31:0] InputPool51;
    reg [31:0] InputPool52;
    reg [31:0] InputPool53;
    reg [31:0] InputPool54;
    reg [31:0] InputPool55;
    reg [31:0] InputPool56;
    reg [31:0] InputPool57;
    reg [31:0] InputPool58;
    reg [31:0] InputPool59;
    reg [31:0] InputPool60;
    reg [31:0] InputPool61;
    reg [31:0] InputPool62;
    reg [31:0] InputPool63;
    reg [31:0] InputPool64;
 
    reg [31:0] InputPool1final;
    reg [31:0] InputPool2final;
    reg [31:0] InputPool3final;
    reg [31:0] InputPool4final;
    reg [31:0] InputPool5final;
    reg [31:0] InputPool6final;
    reg [31:0] InputPool7final;
    reg [31:0] InputPool8final;
    reg [31:0] InputPool9final;
    reg [31:0] InputPool10final;
    reg [31:0] InputPool11final;
    reg [31:0] InputPool12final;
    reg [31:0] InputPool13final;
    reg [31:0] InputPool14final;
    reg [31:0] InputPool15final;
    reg [31:0] InputPool16final;
    reg [31:0] InputPool17final;
    reg [31:0] InputPool18final;
    reg [31:0] InputPool19final;
    reg [31:0] InputPool20final;
    reg [31:0] InputPool21final;
    reg [31:0] InputPool22final;
    reg [31:0] InputPool23final;
    reg [31:0] InputPool24final;
    reg [31:0] InputPool25final;
    reg [31:0] InputPool26final;
    reg [31:0] InputPool27final;
    reg [31:0] InputPool28final;
    reg [31:0] InputPool29final;
    reg [31:0] InputPool30final;
    reg [31:0] InputPool31final;
    reg [31:0] InputPool32final;
    reg [31:0] InputPool33final;
    reg [31:0] InputPool34final;
    reg [31:0] InputPool35final;
    reg [31:0] InputPool36final;
    reg [31:0] InputPool37final;
    reg [31:0] InputPool38final;
    reg [31:0] InputPool39final;
    reg [31:0] InputPool40final;
    reg [31:0] InputPool41final;
    reg [31:0] InputPool42final;
    reg [31:0] InputPool43final;
    reg [31:0] InputPool44final;
    reg [31:0] InputPool45final;
    reg [31:0] InputPool46final;
    reg [31:0] InputPool47final;
    reg [31:0] InputPool48final;
    reg [31:0] InputPool49final;
    reg [31:0] InputPool50final;
    reg [31:0] InputPool51final;
    reg [31:0] InputPool52final;
    reg [31:0] InputPool53final;
    reg [31:0] InputPool54final;
    reg [31:0] InputPool55final;
    reg [31:0] InputPool56final;
    reg [31:0] InputPool57final;
    reg [31:0] InputPool58final;
    reg [31:0] InputPool59final;
    reg [31:0] InputPool60final;
    reg [31:0] InputPool61final;
    reg [31:0] InputPool62final;
    reg [31:0] InputPool63final;
    reg [31:0] InputPool64final;
    
   wire [1:0] Output_pool_we;
    wire [1:0] Output_pool_we_temp;
    wire [1:0] Output_pool_we_temp2;
    wire [1:0] Output_pool_we_temp3;
    wire [1:0] Output_pool_we_temp4;
    wire [1:0] Output_pool_we_temp5;
    wire [1:0] Output_pool_we_temp6;
    wire [1:0] Output_pool_we_temp7;
    wire [1:0] Output_pool_we_temp8;
    wire [1:0] Output_pool_we_temp9;
    wire [1:0] Output_pool_we_temp10;
    wire [1:0] Output_pool_we_temp11;
    wire [1:0] Output_pool_we_temp12;
    wire [1:0] Output_pool_we_temp13;
    wire [1:0] Output_pool_we_temp14;
    wire [1:0] Output_pool_we_temp15;
    wire [1:0] Output_pool_we_temp16;
    wire [1:0] Output_pool_we_temp17;
    wire [1:0] Output_pool_we_temp18;
    wire [1:0] Output_pool_we_temp19;
    wire [1:0] Output_pool_we_temp20;
    wire [1:0] Output_pool_we_temp21;
    wire [1:0] Output_pool_we_temp22;
    wire [1:0] Output_pool_we_temp23;
    wire [1:0] Output_pool_we_temp24;
    wire [1:0] Output_pool_we_temp25;
    wire [1:0] Output_pool_we_temp26;
    wire [1:0] Output_pool_we_temp27;
    wire [1:0] Output_pool_we_temp28;
    wire [1:0] Output_pool_we_temp29;
    wire [1:0] Output_pool_we_temp30;
    wire [1:0] Output_pool_we_temp31;
    wire [1:0] Output_pool_we_temp32;
    wire [1:0] Output_pool_we_temp33;
    wire [1:0] Output_pool_we_temp34;
    wire [1:0] Output_pool_we_temp35;
    wire [1:0] Output_pool_we_temp36;
    wire [1:0] Output_pool_we_temp37;
    wire [1:0] Output_pool_we_temp38;
    wire [1:0] Output_pool_we_temp39;
    wire [1:0] Output_pool_we_temp40;
    wire [1:0] Output_pool_we_temp41;
    wire [1:0] Output_pool_we_temp42;
    wire [1:0] Output_pool_we_temp43;
    wire [1:0] Output_pool_we_temp44;
    wire [1:0] Output_pool_we_temp45;
    wire [1:0] Output_pool_we_temp46;
    wire [1:0] Output_pool_we_temp47;
    wire [1:0] Output_pool_we_temp48;
    wire [1:0] Output_pool_we_temp49;
    wire [1:0] Output_pool_we_temp50;
    wire [1:0] Output_pool_we_temp51;
    wire [1:0] Output_pool_we_temp52;
    wire [1:0] Output_pool_we_temp53;
    wire [1:0] Output_pool_we_temp54;
    wire [1:0] Output_pool_we_temp55;
    wire [1:0] Output_pool_we_temp56;
    wire [1:0] Output_pool_we_temp57;
    wire [1:0] Output_pool_we_temp58;
    wire [1:0] Output_pool_we_temp59;
    wire [1:0] Output_pool_we_temp60;
    wire [1:0] Output_pool_we_temp61;
    wire [1:0] Output_pool_we_temp62;
    wire [1:0] Output_pool_we_temp63;
    wire [1:0] Output_pool_we_temp64;
    
    wire [1:0] Output_pool_we_final;
    wire [1:0] Output_pool_we_temp_final;
    wire [1:0] Output_pool_we_temp2_final;
    wire [1:0] Output_pool_we_temp3_final;
    wire [1:0] Output_pool_we_temp4_final;
    wire [1:0] Output_pool_we_temp5_final;
    wire [1:0] Output_pool_we_temp6_final;
    wire [1:0] Output_pool_we_temp7_final;
    wire [1:0] Output_pool_we_temp8_final;
    wire [1:0] Output_pool_we_temp9_final;
    wire [1:0] Output_pool_we_temp10_final;
    wire [1:0] Output_pool_we_temp11_final;
    wire [1:0] Output_pool_we_temp12_final;
    wire [1:0] Output_pool_we_temp13_final;
    wire [1:0] Output_pool_we_temp14_final;
    wire [1:0] Output_pool_we_temp15_final;
    wire [1:0] Output_pool_we_temp16_final;
    wire [1:0] Output_pool_we_temp17_final;
    wire [1:0] Output_pool_we_temp18_final;
    wire [1:0] Output_pool_we_temp19_final;
    wire [1:0] Output_pool_we_temp20_final;
    wire [1:0] Output_pool_we_temp21_final;
    wire [1:0] Output_pool_we_temp22_final;
    wire [1:0] Output_pool_we_temp23_final;
    wire [1:0] Output_pool_we_temp24_final;
    wire [1:0] Output_pool_we_temp25_final;
    wire [1:0] Output_pool_we_temp26_final;
    wire [1:0] Output_pool_we_temp27_final;
    wire [1:0] Output_pool_we_temp28_final;
    wire [1:0] Output_pool_we_temp29_final;
    wire [1:0] Output_pool_we_temp30_final;
    wire [1:0] Output_pool_we_temp31_final;
    wire [1:0] Output_pool_we_temp32_final;
    wire [1:0] Output_pool_we_temp33_final;
    wire [1:0] Output_pool_we_temp34_final;
    wire [1:0] Output_pool_we_temp35_final;
    wire [1:0] Output_pool_we_temp36_final;
    wire [1:0] Output_pool_we_temp37_final;
    wire [1:0] Output_pool_we_temp38_final;
    wire [1:0] Output_pool_we_temp39_final;
    wire [1:0] Output_pool_we_temp40_final;
    wire [1:0] Output_pool_we_temp41_final;
    wire [1:0] Output_pool_we_temp42_final;
    wire [1:0] Output_pool_we_temp43_final;
    wire [1:0] Output_pool_we_temp44_final;
    wire [1:0] Output_pool_we_temp45_final;
    wire [1:0] Output_pool_we_temp46_final;
    wire [1:0] Output_pool_we_temp47_final;
    wire [1:0] Output_pool_we_temp48_final;
    wire [1:0] Output_pool_we_temp49_final;
    wire [1:0] Output_pool_we_temp50_final;
    wire [1:0] Output_pool_we_temp51_final;
    wire [1:0] Output_pool_we_temp52_final;
    wire [1:0] Output_pool_we_temp53_final;
    wire [1:0] Output_pool_we_temp54_final;
    wire [1:0] Output_pool_we_temp55_final;
    wire [1:0] Output_pool_we_temp56_final;
    wire [1:0] Output_pool_we_temp57_final;
    wire [1:0] Output_pool_we_temp58_final;
    wire [1:0] Output_pool_we_temp59_final;
    wire [1:0] Output_pool_we_temp60_final;
    wire [1:0] Output_pool_we_temp61_final;
    wire [1:0] Output_pool_we_temp62_final;
    wire [1:0] Output_pool_we_temp63_final;
    wire [1:0] Output_pool_we_temp64_final;
    
    wire [1023:0] Output_pool_inter;
    
    reg [8:0] InterPoolOutput_counter;
    reg [8:0] async_read_counter;
    reg [8:0] async_write_counter;
    
    
    reg Input_update_enable_flag;
    reg row_update_pool;
    reg col_update_pool;
    reg flag_output_pool;
    reg flag_write_addr_update;
    reg flag_write_addr_update2;
    reg flag_valid_input_pooling;
    reg flag_valid_input_pooling_temp;
    
    reg [8:0]Nooffilters_2;
    reg [8:0]Nooffilters_2_1;
    
    reg row_pool;
    reg row_pool1;
    reg row_pool2;
    reg row_pool3;
    reg row_pool4;
    reg row_pool5;
    reg row_pool6;
    reg row_pool7;
    reg row_pool8;
    reg row_pool9;
    reg row_pool10;
    reg row_pool11;
    reg row_pool12;
    reg row_pool13;
    reg row_pool14;
    reg row_pool15;
    reg row_pool16;
    reg row_pool17;
    reg row_pool18;

    reg enable_compare;
    reg enable_compare2;
    
    wire [1535:0] temp_pool_read_data;
    reg [1535:0] temp_pool_write_data;
    reg tempA_pool_en;
    reg tempB_pool_en;
    reg [191:0] temp_pool_we;
    reg [6:0] temp_pool_read_addr;
    reg [6:0] temp_pool_write_addr;
    
    reg [8:0] Input_max_col_afterpool1;
    
    always@(posedge clk) begin
     row_pool1 <= row_pool;
     row_pool2 <= row_pool1;
     row_pool3 <= row_pool2;
     row_pool4 <= row_pool3;
     row_pool5 <= row_pool4;
     row_pool6 <= row_pool5;
     row_pool7 <= row_pool6;
     row_pool8 <= row_pool7;
     row_pool9 <= row_pool8;
     row_pool10 <= row_pool9;
     row_pool11 <= row_pool10;
     row_pool12 <= row_pool11;
     row_pool13 <= row_pool12;
     row_pool14 <= row_pool13;
     row_pool15 <= row_pool14;
     row_pool16 <= row_pool15;
     row_pool17 <= row_pool16;
     row_pool18 <= row_pool17;
    end
    
    initial begin
    
        enable_compare <= 1'b0;
        enable_compare2 <= 1'b0;
        
        InterPoolOutput_counter <= 9'd0;
        async_read_counter <= 9'd0;
        async_write_counter <= 9'd0;
        Input_max_col_afterpool1 <= 9'd112;
            
        flag_output_pool<=1'b0;
          
        flag_write_addr_update <=1'b0;
        flag_write_addr_update2<=1'b0;
        flag_valid_input_pooling <= 1'b0;
        flag_valid_input_pooling_temp <= 1'b0;
            
        tempA_pool_en <= 1'b0;
        tempB_pool_en <= 1'b0;
        temp_pool_we <= 192'd0;
        temp_pool_read_addr <= 7'd0;
        temp_pool_write_addr <= 7'd0;
            
        Nooffilters_2 <= 9'd64;
        Nooffilters_2_1 <= 9'd128;
    end
    
    temp_pool_BRAM temp_pool2(
        .BRAM_PORTA_addr(temp_pool_write_addr),
        .BRAM_PORTA_clk(clk),
        .BRAM_PORTA_din(temp_pool_write_data),
        .BRAM_PORTA_en(tempA_pool_en),
        .BRAM_PORTA_we(temp_pool_we),
        .BRAM_PORTB_addr(temp_pool_read_addr),
        .BRAM_PORTB_clk(clk),
        .BRAM_PORTB_dout(temp_pool_read_data),
        .BRAM_PORTB_en(tempB_pool_en)
    );
    
    compare_only3 c1(
            .clk(clk),
            .Output_write_data(Output_pool_inter[15:0]),
            .Output_BRAM_we(Output_pool_we),
            .enable_conv(enable_compare),
            .conv_concat(InputPool1)
        );
    
    compare_only3 c2(
            .clk(clk),
            .Output_write_data(Output_pool_inter[31:16]),
            .Output_BRAM_we(Output_pool_we_temp),
            .enable_conv(enable_compare),
            .conv_concat(InputPool2)
        );
    
    compare_only3 c3(
            .clk(clk),
            .Output_write_data(Output_pool_inter[47:32]),
            .Output_BRAM_we(Output_pool_we_temp2),
            .enable_conv(enable_compare),
            .conv_concat(InputPool3)
        );
    
    compare_only3 c4(
        .clk(clk),
        .Output_write_data(Output_pool_inter[63:48]),
        .Output_BRAM_we(Output_pool_we_temp3),
        .enable_conv(enable_compare),
        .conv_concat(InputPool4)
        );
    compare_only3 c5(
        .clk(clk),
        .Output_write_data(Output_pool_inter[79:64]),
        .Output_BRAM_we(Output_pool_we_temp4),
        .enable_conv(enable_compare),
        .conv_concat(InputPool5)
        );
    compare_only3 c6(
        .clk(clk),
        .Output_write_data(Output_pool_inter[95:80]),
        .Output_BRAM_we(Output_pool_we_temp5),
        .enable_conv(enable_compare),
        .conv_concat(InputPool6)
        );
    compare_only3 c7(
        .clk(clk),
        .Output_write_data(Output_pool_inter[111:96]),
        .Output_BRAM_we(Output_pool_we_temp6),
        .enable_conv(enable_compare),
        .conv_concat(InputPool7)
        );
    compare_only3 c8(
        .clk(clk),
        .Output_write_data(Output_pool_inter[127:112]),
        .Output_BRAM_we(Output_pool_we_temp7),
        .enable_conv(enable_compare),
        .conv_concat(InputPool8)
        );
    compare_only3 c9(
        .clk(clk),
        .Output_write_data(Output_pool_inter[143:128]),
        .Output_BRAM_we(Output_pool_we_temp8),
        .enable_conv(enable_compare),
        .conv_concat(InputPool9)
        );
    compare_only3 c10(
        .clk(clk),
        .Output_write_data(Output_pool_inter[159:144]),
        .Output_BRAM_we(Output_pool_we_temp9),
        .enable_conv(enable_compare),
        .conv_concat(InputPool10)
        );
    compare_only3 c11(
        .clk(clk),
        .Output_write_data(Output_pool_inter[175:160]),
        .Output_BRAM_we(Output_pool_we_temp10),
        .enable_conv(enable_compare),
        .conv_concat(InputPool11)
        );
    compare_only3 c12(
        .clk(clk),
        .Output_write_data(Output_pool_inter[191:176]),
        .Output_BRAM_we(Output_pool_we_temp11),
        .enable_conv(enable_compare),
        .conv_concat(InputPool12)
        );
    compare_only3 c13(
        .clk(clk),
        .Output_write_data(Output_pool_inter[207:192]),
        .Output_BRAM_we(Output_pool_we_temp12),
        .enable_conv(enable_compare),
        .conv_concat(InputPool13)
        );
    compare_only3 c14(
        .clk(clk),
        .Output_write_data(Output_pool_inter[223:208]),
        .Output_BRAM_we(Output_pool_we_temp13),
        .enable_conv(enable_compare),
        .conv_concat(InputPool14)
        );
    compare_only3 c15(
        .clk(clk),
        .Output_write_data(Output_pool_inter[239:224]),
        .Output_BRAM_we(Output_pool_we_temp14),
        .enable_conv(enable_compare),
        .conv_concat(InputPool15)
        );
    compare_only3 c16(
        .clk(clk),
        .Output_write_data(Output_pool_inter[255:240]),
        .Output_BRAM_we(Output_pool_we_temp15),
        .enable_conv(enable_compare),
        .conv_concat(InputPool16)
        );
    compare_only3 c17(
        .clk(clk),
        .Output_write_data(Output_pool_inter[271:256]),
        .Output_BRAM_we(Output_pool_we_temp16),
        .enable_conv(enable_compare),
        .conv_concat(InputPool17)
        );
    compare_only3 c18(
        .clk(clk),
        .Output_write_data(Output_pool_inter[287:272]),
        .Output_BRAM_we(Output_pool_we_temp17),
        .enable_conv(enable_compare),
        .conv_concat(InputPool18)
        );
    compare_only3 c19(
        .clk(clk),
        .Output_write_data(Output_pool_inter[303:288]),
        .Output_BRAM_we(Output_pool_we_temp18),
        .enable_conv(enable_compare),
        .conv_concat(InputPool19)
        );
    compare_only3 c20(
        .clk(clk),
        .Output_write_data(Output_pool_inter[319:304]),
        .Output_BRAM_we(Output_pool_we_temp19),
        .enable_conv(enable_compare),
        .conv_concat(InputPool20)
        );
    compare_only3 c21(
        .clk(clk),
        .Output_write_data(Output_pool_inter[335:320]),
        .Output_BRAM_we(Output_pool_we_temp20),
        .enable_conv(enable_compare),
        .conv_concat(InputPool21)
        );
    compare_only3 c22(
        .clk(clk),
        .Output_write_data(Output_pool_inter[351:336]),
        .Output_BRAM_we(Output_pool_we_temp21),
        .enable_conv(enable_compare),
        .conv_concat(InputPool22)
        );
    compare_only3 c23(
        .clk(clk),
        .Output_write_data(Output_pool_inter[367:352]),
        .Output_BRAM_we(Output_pool_we_temp22),
        .enable_conv(enable_compare),
        .conv_concat(InputPool23)
        );
    compare_only3 c24(
        .clk(clk),
        .Output_write_data(Output_pool_inter[383:368]),
        .Output_BRAM_we(Output_pool_we_temp23),
        .enable_conv(enable_compare),
        .conv_concat(InputPool24)
        );
    compare_only3 c25(
        .clk(clk),
        .Output_write_data(Output_pool_inter[399:384]),
        .Output_BRAM_we(Output_pool_we_temp24),
        .enable_conv(enable_compare),
        .conv_concat(InputPool25)
        );
    compare_only3 c26(
        .clk(clk),
        .Output_write_data(Output_pool_inter[415:400]),
        .Output_BRAM_we(Output_pool_we_temp25),
        .enable_conv(enable_compare),
        .conv_concat(InputPool26)
        );
    compare_only3 c27(
        .clk(clk),
        .Output_write_data(Output_pool_inter[431:416]),
        .Output_BRAM_we(Output_pool_we_temp26),
        .enable_conv(enable_compare),
        .conv_concat(InputPool27)
        );
    compare_only3 c28(
        .clk(clk),
        .Output_write_data(Output_pool_inter[447:432]),
        .Output_BRAM_we(Output_pool_we_temp27),
        .enable_conv(enable_compare),
        .conv_concat(InputPool28)
        );
    compare_only3 c29(
        .clk(clk),
        .Output_write_data(Output_pool_inter[463:448]),
        .Output_BRAM_we(Output_pool_we_temp28),
        .enable_conv(enable_compare),
        .conv_concat(InputPool29)
        );
    compare_only3 c30(
        .clk(clk),
        .Output_write_data(Output_pool_inter[479:464]),
        .Output_BRAM_we(Output_pool_we_temp29),
        .enable_conv(enable_compare),
        .conv_concat(InputPool30)
        );
    compare_only3 c31(
        .clk(clk),
        .Output_write_data(Output_pool_inter[495:480]),
        .Output_BRAM_we(Output_pool_we_temp30),
        .enable_conv(enable_compare),
        .conv_concat(InputPool31)
        );
    compare_only3 c32(
        .clk(clk),
        .Output_write_data(Output_pool_inter[511:496]),
        .Output_BRAM_we(Output_pool_we_temp31),
        .enable_conv(enable_compare),
        .conv_concat(InputPool32)
        );
    compare_only3 c33(
        .clk(clk),
        .Output_write_data(Output_pool_inter[527:512]),
        .Output_BRAM_we(Output_pool_we_temp32),
        .enable_conv(enable_compare),
        .conv_concat(InputPool33)
        );
    compare_only3 c34(
        .clk(clk),
        .Output_write_data(Output_pool_inter[543:528]),
        .Output_BRAM_we(Output_pool_we_temp33),
        .enable_conv(enable_compare),
        .conv_concat(InputPool34)
        );
    compare_only3 c35(
        .clk(clk),
        .Output_write_data(Output_pool_inter[559:544]),
        .Output_BRAM_we(Output_pool_we_temp34),
        .enable_conv(enable_compare),
        .conv_concat(InputPool35)
        );
    compare_only3 c36(
        .clk(clk),
        .Output_write_data(Output_pool_inter[575:560]),
        .Output_BRAM_we(Output_pool_we_temp35),
        .enable_conv(enable_compare),
        .conv_concat(InputPool36)
        );
    compare_only3 c37(
        .clk(clk),
        .Output_write_data(Output_pool_inter[591:576]),
        .Output_BRAM_we(Output_pool_we_temp36),
        .enable_conv(enable_compare),
        .conv_concat(InputPool37)
        );
    compare_only3 c38(
        .clk(clk),
        .Output_write_data(Output_pool_inter[607:592]),
        .Output_BRAM_we(Output_pool_we_temp37),
        .enable_conv(enable_compare),
        .conv_concat(InputPool38)
        );
    compare_only3 c39(
        .clk(clk),
        .Output_write_data(Output_pool_inter[623:608]),
        .Output_BRAM_we(Output_pool_we_temp38),
        .enable_conv(enable_compare),
        .conv_concat(InputPool39)
        );
    compare_only3 c40(
        .clk(clk),
        .Output_write_data(Output_pool_inter[639:624]),
        .Output_BRAM_we(Output_pool_we_temp39),
        .enable_conv(enable_compare),
        .conv_concat(InputPool40)
        );
    compare_only3 c41(
        .clk(clk),
        .Output_write_data(Output_pool_inter[655:640]),
        .Output_BRAM_we(Output_pool_we_temp40),
        .enable_conv(enable_compare),
        .conv_concat(InputPool41)
        );
    compare_only3 c42(
        .clk(clk),
        .Output_write_data(Output_pool_inter[671:656]),
        .Output_BRAM_we(Output_pool_we_temp41),
        .enable_conv(enable_compare),
        .conv_concat(InputPool42)
        );
    compare_only3 c43(
        .clk(clk),
        .Output_write_data(Output_pool_inter[687:672]),
        .Output_BRAM_we(Output_pool_we_temp42),
        .enable_conv(enable_compare),
        .conv_concat(InputPool43)
        );
    compare_only3 c44(
        .clk(clk),
        .Output_write_data(Output_pool_inter[703:688]),
        .Output_BRAM_we(Output_pool_we_temp43),
        .enable_conv(enable_compare),
        .conv_concat(InputPool44)
        );
    compare_only3 c45(
        .clk(clk),
        .Output_write_data(Output_pool_inter[719:704]),
        .Output_BRAM_we(Output_pool_we_temp44),
        .enable_conv(enable_compare),
        .conv_concat(InputPool45)
        );
    compare_only3 c46(
        .clk(clk),
        .Output_write_data(Output_pool_inter[735:720]),
        .Output_BRAM_we(Output_pool_we_temp45),
        .enable_conv(enable_compare),
        .conv_concat(InputPool46)
        );
    compare_only3 c47(
        .clk(clk),
        .Output_write_data(Output_pool_inter[751:736]),
        .Output_BRAM_we(Output_pool_we_temp46),
        .enable_conv(enable_compare),
        .conv_concat(InputPool47)
        );
    compare_only3 c48(
        .clk(clk),
        .Output_write_data(Output_pool_inter[767:752]),
        .Output_BRAM_we(Output_pool_we_temp47),
        .enable_conv(enable_compare),
        .conv_concat(InputPool48)
        );
    compare_only3 c49(
        .clk(clk),
        .Output_write_data(Output_pool_inter[783:768]),
        .Output_BRAM_we(Output_pool_we_temp48),
        .enable_conv(enable_compare),
        .conv_concat(InputPool49)
        );
    compare_only3 c50(
        .clk(clk),
        .Output_write_data(Output_pool_inter[799:784]),
        .Output_BRAM_we(Output_pool_we_temp49),
        .enable_conv(enable_compare),
        .conv_concat(InputPool50)
        );
    compare_only3 c51(
        .clk(clk),
        .Output_write_data(Output_pool_inter[815:800]),
        .Output_BRAM_we(Output_pool_we_temp50),
        .enable_conv(enable_compare),
        .conv_concat(InputPool51)
        );
    compare_only3 c52(
        .clk(clk),
        .Output_write_data(Output_pool_inter[831:816]),
        .Output_BRAM_we(Output_pool_we_temp51),
        .enable_conv(enable_compare),
        .conv_concat(InputPool52)
        );
    compare_only3 c53(
        .clk(clk),
        .Output_write_data(Output_pool_inter[847:832]),
        .Output_BRAM_we(Output_pool_we_temp52),
        .enable_conv(enable_compare),
        .conv_concat(InputPool53)
        );
    compare_only3 c54(
        .clk(clk),
        .Output_write_data(Output_pool_inter[863:848]),
        .Output_BRAM_we(Output_pool_we_temp53),
        .enable_conv(enable_compare),
        .conv_concat(InputPool54)
        );
    compare_only3 c55(
        .clk(clk),
        .Output_write_data(Output_pool_inter[879:864]),
        .Output_BRAM_we(Output_pool_we_temp54),
        .enable_conv(enable_compare),
        .conv_concat(InputPool55)
        );
    compare_only3 c56(
        .clk(clk),
        .Output_write_data(Output_pool_inter[895:880]),
        .Output_BRAM_we(Output_pool_we_temp55),
        .enable_conv(enable_compare),
        .conv_concat(InputPool56)
        );
    compare_only3 c57(
        .clk(clk),
        .Output_write_data(Output_pool_inter[911:896]),
        .Output_BRAM_we(Output_pool_we_temp56),
        .enable_conv(enable_compare),
        .conv_concat(InputPool57)
        );
    compare_only3 c58(
        .clk(clk),
        .Output_write_data(Output_pool_inter[927:912]),
        .Output_BRAM_we(Output_pool_we_temp57),
        .enable_conv(enable_compare),
        .conv_concat(InputPool58)
        );
    compare_only3 c59(
        .clk(clk),
        .Output_write_data(Output_pool_inter[943:928]),
        .Output_BRAM_we(Output_pool_we_temp58),
        .enable_conv(enable_compare),
        .conv_concat(InputPool59)
        );
    compare_only3 c60(
        .clk(clk),
        .Output_write_data(Output_pool_inter[959:944]),
        .Output_BRAM_we(Output_pool_we_temp59),
        .enable_conv(enable_compare),
        .conv_concat(InputPool60)
        );
    compare_only3 c61(
        .clk(clk),
        .Output_write_data(Output_pool_inter[975:960]),
        .Output_BRAM_we(Output_pool_we_temp60),
        .enable_conv(enable_compare),
        .conv_concat(InputPool61)
        );
    compare_only3 c62(
        .clk(clk),
        .Output_write_data(Output_pool_inter[991:976]),
        .Output_BRAM_we(Output_pool_we_temp61),
        .enable_conv(enable_compare),
        .conv_concat(InputPool62)
        );
    compare_only3 c63(
        .clk(clk),
        .Output_write_data(Output_pool_inter[1007:992]),
        .Output_BRAM_we(Output_pool_we_temp62),
        .enable_conv(enable_compare),
        .conv_concat(InputPool63)
        );
    compare_only3 c64(
        .clk(clk),
        .Output_write_data(Output_pool_inter[1023:1008]),
        .Output_BRAM_we(Output_pool_we_temp63),
        .enable_conv(enable_compare),
        .conv_concat(InputPool64)
        );
    
    compare_only3 cf1(
            .clk(clk),
            .Output_write_data(Output_pool_final[15:0]),
            .Output_BRAM_we(Output_pool_we_final),
            .enable_conv(enable_compare2),
            .conv_concat(InputPool1final)
        );
    
    compare_only3 cf2(
            .clk(clk),
            .Output_write_data(Output_pool_final[31:16]),
            .Output_BRAM_we(Output_pool_we_temp_final),
            .enable_conv(enable_compare2),
            .conv_concat(InputPool2final)
        );
    
    compare_only3 cf3(
            .clk(clk),
            .Output_write_data(Output_pool_final[47:32]),
            .Output_BRAM_we(Output_pool_we_temp2_final),
            .enable_conv(enable_compare2),
            .conv_concat(InputPool3final)
        );
    
    compare_only3 cf4(
        .clk(clk),
        .Output_write_data(Output_pool_final[63:48]),
        .Output_BRAM_we(Output_pool_we_temp3_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool4final)
        );
    compare_only3 cf5(
        .clk(clk),
        .Output_write_data(Output_pool_final[79:64]),
        .Output_BRAM_we(Output_pool_we_temp4_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool5final)
        );
    compare_only3 cf6(
        .clk(clk),
        .Output_write_data(Output_pool_final[95:80]),
        .Output_BRAM_we(Output_pool_we_temp5_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool6final)
        );
    compare_only3 cf7(
        .clk(clk),
        .Output_write_data(Output_pool_final[111:96]),
        .Output_BRAM_we(Output_pool_we_temp6_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool7final)
        );
    compare_only3 cf8(
        .clk(clk),
        .Output_write_data(Output_pool_final[127:112]),
        .Output_BRAM_we(Output_pool_we_temp7_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool8final)
        );
    compare_only3 cf9(
        .clk(clk),
        .Output_write_data(Output_pool_final[143:128]),
        .Output_BRAM_we(Output_pool_we_temp8_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool9final)
        );
    compare_only3 cf10(
        .clk(clk),
        .Output_write_data(Output_pool_final[159:144]),
        .Output_BRAM_we(Output_pool_we_temp9_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool10final)
        );
    compare_only3 cf11(
        .clk(clk),
        .Output_write_data(Output_pool_final[175:160]),
        .Output_BRAM_we(Output_pool_we_temp10_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool11final)
        );
    compare_only3 cf12(
        .clk(clk),
        .Output_write_data(Output_pool_final[191:176]),
        .Output_BRAM_we(Output_pool_we_temp11_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool12final)
        );
    compare_only3 cf13(
        .clk(clk),
        .Output_write_data(Output_pool_final[207:192]),
        .Output_BRAM_we(Output_pool_we_temp12_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool13final)
        );
    compare_only3 cf14(
        .clk(clk),
        .Output_write_data(Output_pool_final[223:208]),
        .Output_BRAM_we(Output_pool_we_temp13_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool14final)
        );
    compare_only3 cf15(
        .clk(clk),
        .Output_write_data(Output_pool_final[239:224]),
        .Output_BRAM_we(Output_pool_we_temp14_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool15final)
        );
    compare_only3 cf16(
        .clk(clk),
        .Output_write_data(Output_pool_final[255:240]),
        .Output_BRAM_we(Output_pool_we_temp15_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool16final)
        );
    compare_only3 cf17(
        .clk(clk),
        .Output_write_data(Output_pool_final[271:256]),
        .Output_BRAM_we(Output_pool_we_temp16_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool17final)
        );
    compare_only3 cf18(
        .clk(clk),
        .Output_write_data(Output_pool_final[287:272]),
        .Output_BRAM_we(Output_pool_we_temp17_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool18final)
        );
    compare_only3 cf19(
        .clk(clk),
        .Output_write_data(Output_pool_final[303:288]),
        .Output_BRAM_we(Output_pool_we_temp18_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool19final)
        );
    compare_only3 cf20(
        .clk(clk),
        .Output_write_data(Output_pool_final[319:304]),
        .Output_BRAM_we(Output_pool_we_temp19_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool20final)
        );
    compare_only3 cf21(
        .clk(clk),
        .Output_write_data(Output_pool_final[335:320]),
        .Output_BRAM_we(Output_pool_we_temp20_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool21final)
        );
    compare_only3 cf22(
        .clk(clk),
        .Output_write_data(Output_pool_final[351:336]),
        .Output_BRAM_we(Output_pool_we_temp21_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool22final)
        );
    compare_only3 cf23(
        .clk(clk),
        .Output_write_data(Output_pool_final[367:352]),
        .Output_BRAM_we(Output_pool_we_temp22_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool23final)
        );
    compare_only3 cf24(
        .clk(clk),
        .Output_write_data(Output_pool_final[383:368]),
        .Output_BRAM_we(Output_pool_we_temp23_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool24final)
        );
    compare_only3 cf25(
        .clk(clk),
        .Output_write_data(Output_pool_final[399:384]),
        .Output_BRAM_we(Output_pool_we_temp24_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool25final)
        );
    compare_only3 cf26(
        .clk(clk),
        .Output_write_data(Output_pool_final[415:400]),
        .Output_BRAM_we(Output_pool_we_temp25_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool26final)
        );
    compare_only3 cf27(
        .clk(clk),
        .Output_write_data(Output_pool_final[431:416]),
        .Output_BRAM_we(Output_pool_we_temp26_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool27final)
        );
    compare_only3 cf28(
        .clk(clk),
        .Output_write_data(Output_pool_final[447:432]),
        .Output_BRAM_we(Output_pool_we_temp27_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool28final)
        );
    compare_only3 cf29(
        .clk(clk),
        .Output_write_data(Output_pool_final[463:448]),
        .Output_BRAM_we(Output_pool_we_temp28_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool29final)
        );
    compare_only3 cf30(
        .clk(clk),
        .Output_write_data(Output_pool_final[479:464]),
        .Output_BRAM_we(Output_pool_we_temp29_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool30final)
        );
    compare_only3 cf31(
        .clk(clk),
        .Output_write_data(Output_pool_final[495:480]),
        .Output_BRAM_we(Output_pool_we_temp30_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool31final)
        );
    compare_only3 cf32(
        .clk(clk),
        .Output_write_data(Output_pool_final[511:496]),
        .Output_BRAM_we(Output_pool_we_temp31_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool32final)
        );
    compare_only3 cf33(
        .clk(clk),
        .Output_write_data(Output_pool_final[527:512]),
        .Output_BRAM_we(Output_pool_we_temp32_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool33final)
        );
    compare_only3 cf34(
        .clk(clk),
        .Output_write_data(Output_pool_final[543:528]),
        .Output_BRAM_we(Output_pool_we_temp33_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool34final)
        );
    compare_only3 cf35(
        .clk(clk),
        .Output_write_data(Output_pool_final[559:544]),
        .Output_BRAM_we(Output_pool_we_temp34_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool35final)
        );
    compare_only3 cf36(
        .clk(clk),
        .Output_write_data(Output_pool_final[575:560]),
        .Output_BRAM_we(Output_pool_we_temp35_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool36final)
        );
    compare_only3 cf37(
        .clk(clk),
        .Output_write_data(Output_pool_final[591:576]),
        .Output_BRAM_we(Output_pool_we_temp36_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool37final)
        );
    compare_only3 cf38(
        .clk(clk),
        .Output_write_data(Output_pool_final[607:592]),
        .Output_BRAM_we(Output_pool_we_temp37_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool38final)
        );
    compare_only3 cf39(
        .clk(clk),
        .Output_write_data(Output_pool_final[623:608]),
        .Output_BRAM_we(Output_pool_we_temp38_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool39final)
        );
    compare_only3 cf40(
        .clk(clk),
        .Output_write_data(Output_pool_final[639:624]),
        .Output_BRAM_we(Output_pool_we_temp39_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool40final)
        );
    compare_only3 cf41(
        .clk(clk),
        .Output_write_data(Output_pool_final[655:640]),
        .Output_BRAM_we(Output_pool_we_temp40_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool41final)
        );
    compare_only3 cf42(
        .clk(clk),
        .Output_write_data(Output_pool_final[671:656]),
        .Output_BRAM_we(Output_pool_we_temp41_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool42final)
        );
    compare_only3 cf43(
        .clk(clk),
        .Output_write_data(Output_pool_final[687:672]),
        .Output_BRAM_we(Output_pool_we_temp42_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool43final)
        );
    compare_only3 cf44(
        .clk(clk),
        .Output_write_data(Output_pool_final[703:688]),
        .Output_BRAM_we(Output_pool_we_temp43_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool44final)
        );
    compare_only3 cf45(
        .clk(clk),
        .Output_write_data(Output_pool_final[719:704]),
        .Output_BRAM_we(Output_pool_we_temp44_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool45final)
        );
    compare_only3 cf46(
        .clk(clk),
        .Output_write_data(Output_pool_final[735:720]),
        .Output_BRAM_we(Output_pool_we_temp45_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool46final)
        );
    compare_only3 cf47(
        .clk(clk),
        .Output_write_data(Output_pool_final[751:736]),
        .Output_BRAM_we(Output_pool_we_temp46_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool47final)
        );
    compare_only3 cf48(
        .clk(clk),
        .Output_write_data(Output_pool_final[767:752]),
        .Output_BRAM_we(Output_pool_we_temp47_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool48final)
        );
    compare_only3 cf49(
        .clk(clk),
        .Output_write_data(Output_pool_final[783:768]),
        .Output_BRAM_we(Output_pool_we_temp48_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool49final)
        );
    compare_only3 cf50(
        .clk(clk),
        .Output_write_data(Output_pool_final[799:784]),
        .Output_BRAM_we(Output_pool_we_temp49_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool50final)
        );
    compare_only3 cf51(
        .clk(clk),
        .Output_write_data(Output_pool_final[815:800]),
        .Output_BRAM_we(Output_pool_we_temp50_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool51final)
        );
    compare_only3 cf52(
        .clk(clk),
        .Output_write_data(Output_pool_final[831:816]),
        .Output_BRAM_we(Output_pool_we_temp51_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool52final)
        );
    compare_only3 cf53(
        .clk(clk),
        .Output_write_data(Output_pool_final[847:832]),
        .Output_BRAM_we(Output_pool_we_temp52_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool53final)
        );
    compare_only3 cf54(
        .clk(clk),
        .Output_write_data(Output_pool_final[863:848]),
        .Output_BRAM_we(Output_pool_we_temp53_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool54final)
        );
    compare_only3 cf55(
        .clk(clk),
        .Output_write_data(Output_pool_final[879:864]),
        .Output_BRAM_we(Output_pool_we_temp54_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool55final)
        );
    compare_only3 cf56(
        .clk(clk),
        .Output_write_data(Output_pool_final[895:880]),
        .Output_BRAM_we(Output_pool_we_temp55_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool56final)
        );
    compare_only3 cf57(
        .clk(clk),
        .Output_write_data(Output_pool_final[911:896]),
        .Output_BRAM_we(Output_pool_we_temp56_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool57final)
        );
    compare_only3 cf58(
        .clk(clk),
        .Output_write_data(Output_pool_final[927:912]),
        .Output_BRAM_we(Output_pool_we_temp57_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool58final)
        );
    compare_only3 cf59(
        .clk(clk),
        .Output_write_data(Output_pool_final[943:928]),
        .Output_BRAM_we(Output_pool_we_temp58_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool59final)
        );
    compare_only3 cf60(
        .clk(clk),
        .Output_write_data(Output_pool_final[959:944]),
        .Output_BRAM_we(Output_pool_we_temp59_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool60final)
        );
    compare_only3 cf61(
        .clk(clk),
        .Output_write_data(Output_pool_final[975:960]),
        .Output_BRAM_we(Output_pool_we_temp60_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool61final)
        );
    compare_only3 cf62(
        .clk(clk),
        .Output_write_data(Output_pool_final[991:976]),
        .Output_BRAM_we(Output_pool_we_temp61_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool62final)
        );
    compare_only3 cf63(
        .clk(clk),
        .Output_write_data(Output_pool_final[1007:992]),
        .Output_BRAM_we(Output_pool_we_temp62_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool63final)
        );
    compare_only3 cf64(
        .clk(clk),
        .Output_write_data(Output_pool_final[1023:1008]),
        .Output_BRAM_we(Output_pool_we_temp63_final),
        .enable_conv(enable_compare2),
        .conv_concat(InputPool64final)
        );
     
     
     
     always@(*) begin
            flag_output_pool <= Output_pool_we[0]; 
     end
     always@(posedge clk) begin
              
         InterPoolOutput_counter <= (InterPoolOutput_counter >=Nooffilters_2) ? 9'd1:(InterPoolOutput_counter+9'd1);
         
         InputPool1[15:0]    <= (InterPoolOutput_counter == 9'd1)  ? Output_inter_write_data : InputPool1[15:0];
         InputPool2[15:0]    <= (InterPoolOutput_counter == 9'd2)  ? Output_inter_write_data : InputPool2[15:0];
         InputPool3[15:0]    <= (InterPoolOutput_counter == 9'd3)  ? Output_inter_write_data : InputPool3[15:0];
         InputPool4[15:0]    <= (InterPoolOutput_counter == 9'd4)  ? Output_inter_write_data : InputPool4[15:0];
         InputPool5[15:0]    <= (InterPoolOutput_counter == 9'd5)  ? Output_inter_write_data : InputPool5[15:0];
         InputPool6[15:0]    <= (InterPoolOutput_counter == 9'd6)  ? Output_inter_write_data : InputPool6[15:0];
         InputPool7[15:0]    <= (InterPoolOutput_counter == 9'd7)  ? Output_inter_write_data : InputPool7[15:0];
         InputPool8[15:0]    <= (InterPoolOutput_counter == 9'd8)  ? Output_inter_write_data : InputPool8[15:0];
         InputPool9[15:0]    <= (InterPoolOutput_counter == 9'd9)  ? Output_inter_write_data : InputPool9[15:0];
         InputPool10[15:0]   <= (InterPoolOutput_counter == 9'd10) ? Output_inter_write_data : InputPool10[15:0];
         InputPool11[15:0]   <= (InterPoolOutput_counter == 9'd11) ? Output_inter_write_data : InputPool11[15:0];
         InputPool12[15:0]   <= (InterPoolOutput_counter == 9'd12) ? Output_inter_write_data : InputPool12[15:0];
         InputPool13[15:0]   <= (InterPoolOutput_counter == 9'd13) ? Output_inter_write_data : InputPool13[15:0];
         InputPool14[15:0]   <= (InterPoolOutput_counter == 9'd14) ? Output_inter_write_data : InputPool14[15:0];
         InputPool15[15:0]   <= (InterPoolOutput_counter == 9'd15) ? Output_inter_write_data : InputPool15[15:0];
         InputPool16[15:0]   <= (InterPoolOutput_counter == 9'd16) ? Output_inter_write_data : InputPool16[15:0];
         InputPool17[15:0]   <= (InterPoolOutput_counter == 9'd17) ? Output_inter_write_data : InputPool17[15:0];
         InputPool18[15:0]   <= (InterPoolOutput_counter == 9'd18) ? Output_inter_write_data : InputPool18[15:0];
         InputPool19[15:0]   <= (InterPoolOutput_counter == 9'd19) ? Output_inter_write_data : InputPool19[15:0];
         InputPool20[15:0]   <= (InterPoolOutput_counter == 9'd20) ? Output_inter_write_data : InputPool20[15:0];
         InputPool21[15:0]   <= (InterPoolOutput_counter == 9'd21) ? Output_inter_write_data : InputPool21[15:0];
         InputPool22[15:0]   <= (InterPoolOutput_counter == 9'd22) ? Output_inter_write_data : InputPool22[15:0];
         InputPool23[15:0]   <= (InterPoolOutput_counter == 9'd23) ? Output_inter_write_data : InputPool23[15:0];
         InputPool24[15:0]   <= (InterPoolOutput_counter == 9'd24) ? Output_inter_write_data : InputPool24[15:0];
         InputPool25[15:0]   <= (InterPoolOutput_counter == 9'd25) ? Output_inter_write_data : InputPool25[15:0];
         InputPool26[15:0]   <= (InterPoolOutput_counter == 9'd26) ? Output_inter_write_data : InputPool26[15:0];
         InputPool27[15:0]   <= (InterPoolOutput_counter == 9'd27) ? Output_inter_write_data : InputPool27[15:0];
         InputPool28[15:0]   <= (InterPoolOutput_counter == 9'd28) ? Output_inter_write_data : InputPool28[15:0];
         InputPool29[15:0]   <= (InterPoolOutput_counter == 9'd29) ? Output_inter_write_data : InputPool29[15:0];
         InputPool30[15:0]   <= (InterPoolOutput_counter == 9'd30) ? Output_inter_write_data : InputPool30[15:0];
         InputPool31[15:0]   <= (InterPoolOutput_counter == 9'd31) ? Output_inter_write_data : InputPool31[15:0];
         InputPool32[15:0]   <= (InterPoolOutput_counter == 9'd32) ? Output_inter_write_data : InputPool32[15:0];
         InputPool33[15:0]   <= (InterPoolOutput_counter == 9'd33) ? Output_inter_write_data : InputPool33[15:0];
         InputPool34[15:0]   <= (InterPoolOutput_counter == 9'd34) ? Output_inter_write_data : InputPool34[15:0];
         InputPool35[15:0]   <= (InterPoolOutput_counter == 9'd35) ? Output_inter_write_data : InputPool35[15:0];
         InputPool36[15:0]   <= (InterPoolOutput_counter == 9'd36) ? Output_inter_write_data : InputPool36[15:0];
         InputPool37[15:0]   <= (InterPoolOutput_counter == 9'd37) ? Output_inter_write_data : InputPool37[15:0];
         InputPool38[15:0]   <= (InterPoolOutput_counter == 9'd38) ? Output_inter_write_data : InputPool38[15:0];
         InputPool39[15:0]   <= (InterPoolOutput_counter == 9'd39) ? Output_inter_write_data : InputPool39[15:0];
         InputPool40[15:0]   <= (InterPoolOutput_counter == 9'd40) ? Output_inter_write_data : InputPool40[15:0];
         InputPool41[15:0]   <= (InterPoolOutput_counter == 9'd41) ? Output_inter_write_data : InputPool41[15:0];
         InputPool42[15:0]   <= (InterPoolOutput_counter == 9'd42) ? Output_inter_write_data : InputPool42[15:0];
         InputPool43[15:0]   <= (InterPoolOutput_counter == 9'd43) ? Output_inter_write_data : InputPool43[15:0];
         InputPool44[15:0]   <= (InterPoolOutput_counter == 9'd44) ? Output_inter_write_data : InputPool44[15:0];
         InputPool45[15:0]   <= (InterPoolOutput_counter == 9'd45) ? Output_inter_write_data : InputPool45[15:0];
         InputPool46[15:0]   <= (InterPoolOutput_counter == 9'd46) ? Output_inter_write_data : InputPool46[15:0];
         InputPool47[15:0]   <= (InterPoolOutput_counter == 9'd47) ? Output_inter_write_data : InputPool47[15:0];
         InputPool48[15:0]   <= (InterPoolOutput_counter == 9'd48) ? Output_inter_write_data : InputPool48[15:0];
         InputPool49[15:0]   <= (InterPoolOutput_counter == 9'd49) ? Output_inter_write_data : InputPool49[15:0];
         InputPool50[15:0]   <= (InterPoolOutput_counter == 9'd50) ? Output_inter_write_data : InputPool50[15:0];
         InputPool51[15:0]   <= (InterPoolOutput_counter == 9'd51) ? Output_inter_write_data : InputPool51[15:0];
         InputPool52[15:0]   <= (InterPoolOutput_counter == 9'd52) ? Output_inter_write_data : InputPool52[15:0];
         InputPool53[15:0]   <= (InterPoolOutput_counter == 9'd53) ? Output_inter_write_data : InputPool53[15:0];
         InputPool54[15:0]   <= (InterPoolOutput_counter == 9'd54) ? Output_inter_write_data : InputPool54[15:0];
         InputPool55[15:0]   <= (InterPoolOutput_counter == 9'd55) ? Output_inter_write_data : InputPool55[15:0];
         InputPool56[15:0]   <= (InterPoolOutput_counter == 9'd56) ? Output_inter_write_data : InputPool56[15:0];
         InputPool57[15:0]   <= (InterPoolOutput_counter == 9'd57) ? Output_inter_write_data : InputPool57[15:0];
         InputPool58[15:0]   <= (InterPoolOutput_counter == 9'd58) ? Output_inter_write_data : InputPool58[15:0];
         InputPool59[15:0]   <= (InterPoolOutput_counter == 9'd59) ? Output_inter_write_data : InputPool59[15:0];
         InputPool60[15:0]   <= (InterPoolOutput_counter == 9'd60) ? Output_inter_write_data : InputPool60[15:0];
         InputPool61[15:0]   <= (InterPoolOutput_counter == 9'd61) ? Output_inter_write_data : InputPool61[15:0];
         InputPool62[15:0]   <= (InterPoolOutput_counter == 9'd62) ? Output_inter_write_data : InputPool62[15:0];
         InputPool63[15:0]   <= (InterPoolOutput_counter == 9'd63) ? Output_inter_write_data : InputPool63[15:0];
         InputPool64[15:0]   <= (InterPoolOutput_counter == 9'd64) ? Output_inter_write_data : InputPool64[15:0];
         
         
         InputPool1[31:16]    <= (InterPoolOutput_counter == 9'd97)  ? Output_inter_write_data : InputPool1[31:16];
         InputPool2[31:16]    <= (InterPoolOutput_counter == 9'd98)  ? Output_inter_write_data : InputPool2[31:16];
         InputPool3[31:16]    <= (InterPoolOutput_counter == 9'd99)  ? Output_inter_write_data : InputPool3[31:16];
         InputPool4[31:16]    <= (InterPoolOutput_counter == 9'd100) ? Output_inter_write_data : InputPool4[31:16];
         InputPool5[31:16]    <= (InterPoolOutput_counter == 9'd101) ? Output_inter_write_data : InputPool5[31:16];
         InputPool6[31:16]    <= (InterPoolOutput_counter == 9'd102) ? Output_inter_write_data : InputPool6[31:16];
         InputPool7[31:16]    <= (InterPoolOutput_counter == 9'd103) ? Output_inter_write_data : InputPool7[31:16];
         InputPool8[31:16]    <= (InterPoolOutput_counter == 9'd104) ? Output_inter_write_data : InputPool8[31:16];
         InputPool9[31:16]    <= (InterPoolOutput_counter == 9'd105) ? Output_inter_write_data : InputPool9[31:16];
         InputPool10[31:16]   <= (InterPoolOutput_counter == 9'd106) ? Output_inter_write_data : InputPool10[31:16];
         InputPool11[31:16]   <= (InterPoolOutput_counter == 9'd107) ? Output_inter_write_data : InputPool11[31:16];
         InputPool12[31:16]   <= (InterPoolOutput_counter == 9'd108) ? Output_inter_write_data : InputPool12[31:16];
         InputPool13[31:16]   <= (InterPoolOutput_counter == 9'd109) ? Output_inter_write_data : InputPool13[31:16];
         InputPool14[31:16]   <= (InterPoolOutput_counter == 9'd110) ? Output_inter_write_data : InputPool14[31:16];
         InputPool15[31:16]   <= (InterPoolOutput_counter == 9'd111) ? Output_inter_write_data : InputPool15[31:16];
         InputPool16[31:16]   <= (InterPoolOutput_counter == 9'd112) ? Output_inter_write_data : InputPool16[31:16];
         InputPool17[31:16]   <= (InterPoolOutput_counter == 9'd113) ? Output_inter_write_data : InputPool17[31:16];
         InputPool18[31:16]   <= (InterPoolOutput_counter == 9'd114) ? Output_inter_write_data : InputPool18[31:16];
         InputPool19[31:16]   <= (InterPoolOutput_counter == 9'd115) ? Output_inter_write_data : InputPool19[31:16];
         InputPool20[31:16]   <= (InterPoolOutput_counter == 9'd116) ? Output_inter_write_data : InputPool20[31:16];
         InputPool21[31:16]   <= (InterPoolOutput_counter == 9'd117) ? Output_inter_write_data : InputPool21[31:16];
         InputPool22[31:16]   <= (InterPoolOutput_counter == 9'd118) ? Output_inter_write_data : InputPool22[31:16];
         InputPool23[31:16]   <= (InterPoolOutput_counter == 9'd119) ? Output_inter_write_data : InputPool23[31:16];
         InputPool24[31:16]   <= (InterPoolOutput_counter == 9'd120) ? Output_inter_write_data : InputPool24[31:16];
         InputPool25[31:16]   <= (InterPoolOutput_counter == 9'd121) ? Output_inter_write_data : InputPool25[31:16];
         InputPool26[31:16]   <= (InterPoolOutput_counter == 9'd122) ? Output_inter_write_data : InputPool26[31:16];
         InputPool27[31:16]   <= (InterPoolOutput_counter == 9'd123) ? Output_inter_write_data : InputPool27[31:16];
         InputPool28[31:16]   <= (InterPoolOutput_counter == 9'd124) ? Output_inter_write_data : InputPool28[31:16];
         InputPool29[31:16]   <= (InterPoolOutput_counter == 9'd125) ? Output_inter_write_data : InputPool29[31:16];
         InputPool30[31:16]   <= (InterPoolOutput_counter == 9'd126) ? Output_inter_write_data : InputPool30[31:16];
         InputPool31[31:16]   <= (InterPoolOutput_counter == 9'd127) ? Output_inter_write_data : InputPool31[31:16];
         InputPool32[31:16]   <= (InterPoolOutput_counter == 9'd128) ? Output_inter_write_data : InputPool32[31:16];
         InputPool33[31:16]   <= (InterPoolOutput_counter == 9'd129) ? Output_inter_write_data : InputPool33[31:16];
         InputPool34[31:16]   <= (InterPoolOutput_counter == 9'd130) ? Output_inter_write_data : InputPool34[31:16];
         InputPool35[31:16]   <= (InterPoolOutput_counter == 9'd131) ? Output_inter_write_data : InputPool35[31:16];
         InputPool36[31:16]   <= (InterPoolOutput_counter == 9'd132) ? Output_inter_write_data : InputPool36[31:16];
         InputPool37[31:16]   <= (InterPoolOutput_counter == 9'd133) ? Output_inter_write_data : InputPool37[31:16];
         InputPool38[31:16]   <= (InterPoolOutput_counter == 9'd134) ? Output_inter_write_data : InputPool38[31:16];
         InputPool39[31:16]   <= (InterPoolOutput_counter == 9'd135) ? Output_inter_write_data : InputPool39[31:16];
         InputPool40[31:16]   <= (InterPoolOutput_counter == 9'd136) ? Output_inter_write_data : InputPool40[31:16];
         InputPool41[31:16]   <= (InterPoolOutput_counter == 9'd137) ? Output_inter_write_data : InputPool41[31:16];
         InputPool42[31:16]   <= (InterPoolOutput_counter == 9'd138) ? Output_inter_write_data : InputPool42[31:16];
         InputPool43[31:16]   <= (InterPoolOutput_counter == 9'd139) ? Output_inter_write_data : InputPool43[31:16];
         InputPool44[31:16]   <= (InterPoolOutput_counter == 9'd140) ? Output_inter_write_data : InputPool44[31:16];
         InputPool45[31:16]   <= (InterPoolOutput_counter == 9'd141) ? Output_inter_write_data : InputPool45[31:16];
         InputPool46[31:16]   <= (InterPoolOutput_counter == 9'd142) ? Output_inter_write_data : InputPool46[31:16];
         InputPool47[31:16]   <= (InterPoolOutput_counter == 9'd143) ? Output_inter_write_data : InputPool47[31:16];
         InputPool48[31:16]   <= (InterPoolOutput_counter == 9'd144) ? Output_inter_write_data : InputPool48[31:16];
         InputPool49[31:16]   <= (InterPoolOutput_counter == 9'd145) ? Output_inter_write_data : InputPool49[31:16];
         InputPool50[31:16]   <= (InterPoolOutput_counter == 9'd146) ? Output_inter_write_data : InputPool50[31:16];
         InputPool51[31:16]   <= (InterPoolOutput_counter == 9'd147) ? Output_inter_write_data : InputPool51[31:16];
         InputPool52[31:16]   <= (InterPoolOutput_counter == 9'd148) ? Output_inter_write_data : InputPool52[31:16];
         InputPool53[31:16]   <= (InterPoolOutput_counter == 9'd149) ? Output_inter_write_data : InputPool53[31:16];
         InputPool54[31:16]   <= (InterPoolOutput_counter == 9'd150) ? Output_inter_write_data : InputPool54[31:16];
         InputPool55[31:16]   <= (InterPoolOutput_counter == 9'd151) ? Output_inter_write_data : InputPool55[31:16];
         InputPool56[31:16]   <= (InterPoolOutput_counter == 9'd152) ? Output_inter_write_data : InputPool56[31:16];
         InputPool57[31:16]   <= (InterPoolOutput_counter == 9'd153) ? Output_inter_write_data : InputPool57[31:16];
         InputPool58[31:16]   <= (InterPoolOutput_counter == 9'd154) ? Output_inter_write_data : InputPool58[31:16];
         InputPool59[31:16]   <= (InterPoolOutput_counter == 9'd155) ? Output_inter_write_data : InputPool59[31:16];
         InputPool60[31:16]   <= (InterPoolOutput_counter == 9'd156) ? Output_inter_write_data : InputPool60[31:16];
         InputPool61[31:16]   <= (InterPoolOutput_counter == 9'd157) ? Output_inter_write_data : InputPool61[31:16];
         InputPool62[31:16]   <= (InterPoolOutput_counter == 9'd158) ? Output_inter_write_data : InputPool62[31:16];
         InputPool63[31:16]   <= (InterPoolOutput_counter == 9'd159) ? Output_inter_write_data : InputPool63[31:16];
         InputPool64[31:16]   <= (InterPoolOutput_counter == 9'd160) ? Output_inter_write_data : InputPool64[31:16];
         
         InputPool1final[15:0]  <= temp_pool_read_data[15:0];
         InputPool2final[15:0]  <= temp_pool_read_data[31:16];
         InputPool3final[15:0]  <= temp_pool_read_data[47:32];
         InputPool4final[15:0]  <= temp_pool_read_data[63:48];
         InputPool5final[15:0]  <= temp_pool_read_data[79:64];
         InputPool6final[15:0]  <= temp_pool_read_data[95:80];
         InputPool7final[15:0]  <= temp_pool_read_data[111:96];
         InputPool8final[15:0]  <= temp_pool_read_data[127:112];
         InputPool9final[15:0]  <= temp_pool_read_data[143:128];
         InputPool10final[15:0]  <= temp_pool_read_data[159:144];
         InputPool11final[15:0]  <= temp_pool_read_data[175:160];
         InputPool12final[15:0]  <= temp_pool_read_data[191:176];
         InputPool13final[15:0]  <= temp_pool_read_data[207:192];
         InputPool14final[15:0]  <= temp_pool_read_data[223:208];
         InputPool15final[15:0]  <= temp_pool_read_data[239:224];
         InputPool16final[15:0]  <= temp_pool_read_data[255:240];
         InputPool17final[15:0]  <= temp_pool_read_data[271:256];
         InputPool18final[15:0]  <= temp_pool_read_data[287:272];
         InputPool19final[15:0]  <= temp_pool_read_data[303:288];
         InputPool20final[15:0]  <= temp_pool_read_data[319:304];
         InputPool21final[15:0]  <= temp_pool_read_data[335:320];
         InputPool22final[15:0]  <= temp_pool_read_data[351:336];
         InputPool23final[15:0]  <= temp_pool_read_data[367:352];
         InputPool24final[15:0]  <= temp_pool_read_data[383:368];
         InputPool25final[15:0]  <= temp_pool_read_data[399:384];
         InputPool26final[15:0]  <= temp_pool_read_data[415:400];
         InputPool27final[15:0]  <= temp_pool_read_data[431:416];
         InputPool28final[15:0]  <= temp_pool_read_data[447:432];
         InputPool29final[15:0]  <= temp_pool_read_data[463:448];
         InputPool30final[15:0]  <= temp_pool_read_data[479:464];
         InputPool31final[15:0]  <= temp_pool_read_data[495:480];
         InputPool32final[15:0]  <= temp_pool_read_data[511:496];
         InputPool33final[15:0]  <= temp_pool_read_data[527:512];
         InputPool34final[15:0]  <= temp_pool_read_data[543:528];
         InputPool35final[15:0]  <= temp_pool_read_data[559:544];
         InputPool36final[15:0]  <= temp_pool_read_data[575:560];
         InputPool37final[15:0]  <= temp_pool_read_data[591:576];
         InputPool38final[15:0]  <= temp_pool_read_data[607:592];
         InputPool39final[15:0]  <= temp_pool_read_data[623:608];
         InputPool40final[15:0]  <= temp_pool_read_data[639:624];
         InputPool41final[15:0]  <= temp_pool_read_data[655:640];
         InputPool42final[15:0]  <= temp_pool_read_data[671:656];
         InputPool43final[15:0]  <= temp_pool_read_data[687:672];
         InputPool44final[15:0]  <= temp_pool_read_data[703:688];
         InputPool45final[15:0]  <= temp_pool_read_data[719:704];
         InputPool46final[15:0]  <= temp_pool_read_data[735:720];
         InputPool47final[15:0]  <= temp_pool_read_data[751:736];
         InputPool48final[15:0]  <= temp_pool_read_data[767:752];
         InputPool49final[15:0]  <= temp_pool_read_data[783:768];
         InputPool50final[15:0]  <= temp_pool_read_data[799:784];
         InputPool51final[15:0]  <= temp_pool_read_data[815:800];
         InputPool52final[15:0]  <= temp_pool_read_data[831:816];
         InputPool53final[15:0]  <= temp_pool_read_data[847:832];
         InputPool54final[15:0]  <= temp_pool_read_data[863:848];
         InputPool55final[15:0]  <= temp_pool_read_data[879:864];
         InputPool56final[15:0]  <= temp_pool_read_data[895:880];
         InputPool57final[15:0]  <= temp_pool_read_data[911:896];
         InputPool58final[15:0]  <= temp_pool_read_data[927:912];
         InputPool59final[15:0]  <= temp_pool_read_data[943:928];
         InputPool60final[15:0]  <= temp_pool_read_data[959:944];
         InputPool61final[15:0]  <= temp_pool_read_data[975:960];
         InputPool62final[15:0]  <= temp_pool_read_data[991:976];
         InputPool63final[15:0]  <= temp_pool_read_data[1007:992];
         InputPool64final[15:0]  <= temp_pool_read_data[1023:1008];
         
         InputPool1final[31:16] <= Output_pool_inter[15:0];
         InputPool2final[31:16] <= Output_pool_inter[31:16];
         InputPool3final[31:16] <= Output_pool_inter[47:32];
         InputPool4final[31:16]  <= Output_pool_inter[63:48];
         InputPool5final[31:16]  <= Output_pool_inter[79:64];
         InputPool6final[31:16]  <= Output_pool_inter[95:80];
         InputPool7final[31:16]  <= Output_pool_inter[111:96];
         InputPool8final[31:16]  <= Output_pool_inter[127:112];
         InputPool9final[31:16]  <= Output_pool_inter[143:128];
         InputPool10final[31:16]  <= Output_pool_inter[159:144];
         InputPool11final[31:16]  <= Output_pool_inter[175:160];
         InputPool12final[31:16]  <= Output_pool_inter[191:176];
         InputPool13final[31:16]  <= Output_pool_inter[207:192];
         InputPool14final[31:16]  <= Output_pool_inter[223:208];
         InputPool15final[31:16]  <= Output_pool_inter[239:224];
         InputPool16final[31:16]  <= Output_pool_inter[255:240];
         InputPool17final[31:16]  <= Output_pool_inter[271:256];
         InputPool18final[31:16]  <= Output_pool_inter[287:272];
         InputPool19final[31:16]  <= Output_pool_inter[303:288];
         InputPool20final[31:16]  <= Output_pool_inter[319:304];
         InputPool21final[31:16]  <= Output_pool_inter[335:320];
         InputPool22final[31:16]  <= Output_pool_inter[351:336];
         InputPool23final[31:16]  <= Output_pool_inter[367:352];
         InputPool24final[31:16]  <= Output_pool_inter[383:368];
         InputPool25final[31:16]  <= Output_pool_inter[399:384];
         InputPool26final[31:16]  <= Output_pool_inter[415:400];
         InputPool27final[31:16]  <= Output_pool_inter[431:416];
         InputPool28final[31:16]  <= Output_pool_inter[447:432];
         InputPool29final[31:16]  <= Output_pool_inter[463:448];
         InputPool30final[31:16]  <= Output_pool_inter[479:464];
         InputPool31final[31:16]  <= Output_pool_inter[495:480];
         InputPool32final[31:16]  <= Output_pool_inter[511:496];
         InputPool33final[31:16]  <= Output_pool_inter[527:512];
         InputPool34final[31:16]  <= Output_pool_inter[543:528];
         InputPool35final[31:16]  <= Output_pool_inter[559:544];
         InputPool36final[31:16]  <= Output_pool_inter[575:560];
         InputPool37final[31:16]  <= Output_pool_inter[591:576];
         InputPool38final[31:16]  <= Output_pool_inter[607:592];
         InputPool39final[31:16]  <= Output_pool_inter[623:608];
         InputPool40final[31:16]  <= Output_pool_inter[639:624];
         InputPool41final[31:16]  <= Output_pool_inter[655:640];
         InputPool42final[31:16]  <= Output_pool_inter[671:656];
         InputPool43final[31:16]  <= Output_pool_inter[687:672];
         InputPool44final[31:16]  <= Output_pool_inter[703:688];
         InputPool45final[31:16]  <= Output_pool_inter[719:704];
         InputPool46final[31:16]  <= Output_pool_inter[735:720];
         InputPool47final[31:16]  <= Output_pool_inter[751:736];
         InputPool48final[31:16]  <= Output_pool_inter[767:752];
         InputPool49final[31:16]  <= Output_pool_inter[783:768];
         InputPool50final[31:16]  <= Output_pool_inter[799:784];
         InputPool51final[31:16]  <= Output_pool_inter[815:800];
         InputPool52final[31:16]  <= Output_pool_inter[831:816];
         InputPool53final[31:16]  <= Output_pool_inter[847:832];
         InputPool54final[31:16]  <= Output_pool_inter[863:848];
         InputPool55final[31:16]  <= Output_pool_inter[879:864];
         InputPool56final[31:16]  <= Output_pool_inter[895:880];
         InputPool57final[31:16]  <= Output_pool_inter[911:896];
         InputPool58final[31:16]  <= Output_pool_inter[927:912];
         InputPool59final[31:16]  <= Output_pool_inter[943:928];
         InputPool60final[31:16]  <= Output_pool_inter[959:944];
         InputPool61final[31:16]  <= Output_pool_inter[975:960];
         InputPool62final[31:16]  <= Output_pool_inter[991:976];
         InputPool63final[31:16]  <= Output_pool_inter[1007:992];
         InputPool64final[31:16]  <= Output_pool_inter[1023:1008];
                       
         if(InterPoolOutput_counter == 9'd64)begin
            enable_compare<=1'b1;   
         end else begin
            enable_compare<=1'b0;
         end
         
         if(InterPoolOutput_counter == 9'd64)begin
             enable_compare2<=1'b1;   
         end else begin
             enable_compare2<=1'b0;
         end 
         
         if(flag_output_pool) begin
            if(row_pool==1'b0)begin
                if(InterPoolOutput_counter == 9'd1) begin
                    temp_pool_write_data <= Output_pool_inter;
                    if(temp_pool_write_addr==Input_max_col_afterpool1-18'd1) begin
                        temp_pool_we <= 192'd0;
                        flag_write_addr_update <= 1'b0;
                        row_pool <= 1'b1;
                    end else begin
                        temp_pool_we <= 192'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
                        flag_write_addr_update <= 1'b1;
                        row_pool <= 1'b0;
                    end
                    if(flag_write_addr_update == 1'b1) begin
                        temp_pool_write_addr<=(temp_pool_write_addr==(Input_max_col_afterpool1-18'd1))?18'd0:(temp_pool_write_addr+18'd1);
                        //row_pool<=(temp_pool_write_addr==(Input_max_col_afterpool1-18'd1))?1'd1:row_pool;
                    end
                end
            end else begin
                // need to send to LBRAM
                // go into comparator
                // the one which is most likely to get is said to the BRAM
                
                if(InterPoolOutput_counter == 9'd192) begin
                    temp_pool_read_addr<=(temp_pool_read_addr==(Input_max_col_afterpool1-18'd1))?18'd0:(temp_pool_read_addr+18'd1);
                    if(temp_pool_read_addr==Input_max_col_afterpool1-18'd1) begin
                        row_pool <= 1'b0;
                    end else begin
                        row_pool <= 1'b1;
                    end
                end 
            end
         end
     end
         
        
endmodule
