`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2018 21:39:18
// Design Name: 
// Module Name: multiply_add
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


module add_only_dimension2(
clk,
Output_write_data,
Output_BRAM_we,
enable_conv,
conv_concat
    );

input enable_conv;
input [1023:0] conv_concat;
input clk;
output reg [1:0] Output_BRAM_we;
output reg [15:0] Output_write_data;
reg enable_conv_reg;
reg [17:0] Output_max_row;
reg [17:0] Output_max_col;
reg [15:0] conv_values [0:63];
always@(*) begin
    conv_values[0] <= conv_concat[15:0];
    conv_values[1] <= conv_concat[31:16];
    conv_values[2] <= conv_concat[47:32];
    conv_values[3] <= conv_concat[63:48];
    conv_values[4] <= conv_concat[79:64];
    conv_values[5] <= conv_concat[95:80];
    conv_values[6] <= conv_concat[111:96];
    conv_values[7] <= conv_concat[127:112];
    conv_values[8] <= conv_concat[143:128];
    conv_values[9] <= conv_concat[159:144];
    conv_values[10] <= conv_concat[175:160];
    conv_values[11] <= conv_concat[191:176];
    conv_values[12] <= conv_concat[207:192];
    conv_values[13] <= conv_concat[223:208];
    conv_values[14] <= conv_concat[239:224];
    conv_values[15] <= conv_concat[255:240];
    conv_values[16] <= conv_concat[271:256];
    conv_values[17] <= conv_concat[287:272];
    conv_values[18] <= conv_concat[303:288];
    conv_values[19] <= conv_concat[319:304];
    conv_values[20] <= conv_concat[335:320];
    conv_values[21] <= conv_concat[351:336];
    conv_values[22] <= conv_concat[367:352];
    conv_values[23] <= conv_concat[383:368];
    conv_values[24] <= conv_concat[399:384];
    conv_values[25] <= conv_concat[415:400];
    conv_values[26] <= conv_concat[431:416];
    conv_values[27] <= conv_concat[447:432];
    conv_values[28] <= conv_concat[463:448];
    conv_values[29] <= conv_concat[479:464];
    conv_values[30] <= conv_concat[495:480];
    conv_values[31] <= conv_concat[511:496];
    conv_values[32] <= conv_concat[527:512];
    conv_values[33] <= conv_concat[543:528];
    conv_values[34] <= conv_concat[559:544];
    conv_values[35] <= conv_concat[575:560];
    conv_values[36] <= conv_concat[591:576];
    conv_values[37] <= conv_concat[607:592];
    conv_values[38] <= conv_concat[623:608];
    conv_values[39] <= conv_concat[639:624];
    conv_values[40] <= conv_concat[655:640];
    conv_values[41] <= conv_concat[671:656];
    conv_values[42] <= conv_concat[687:672];
    conv_values[43] <= conv_concat[703:688];
    conv_values[44] <= conv_concat[719:704];
    conv_values[45] <= conv_concat[735:720];
    conv_values[46] <= conv_concat[751:736];
    conv_values[47] <= conv_concat[767:752];
    conv_values[48] <= conv_concat[783:768];
    conv_values[49] <= conv_concat[799:784];
    conv_values[50] <= conv_concat[815:800];
    conv_values[51] <= conv_concat[831:816];
    conv_values[52] <= conv_concat[847:832];
    conv_values[53] <= conv_concat[863:848];
    conv_values[54] <= conv_concat[879:864];
    conv_values[55] <= conv_concat[895:880];
    conv_values[56] <= conv_concat[911:896];
    conv_values[57] <= conv_concat[927:912];
    conv_values[58] <= conv_concat[943:928];
    conv_values[59] <= conv_concat[959:944];
    conv_values[60] <= conv_concat[975:960];
    conv_values[61] <= conv_concat[991:976];
    conv_values[62] <= conv_concat[1007:992];
    conv_values[63] <= conv_concat[1023:1008];
end

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
wire [15:0] add13_res;
reg add13_ready;
wire add13_valid;
reg [15:0] addA13;
reg [15:0] addB13;
wire addA13_ready;
reg addA13_valid;
wire addB13_ready;
reg addB13_valid;
wire [15:0] add14_res;
reg add14_ready;
wire add14_valid;
reg [15:0] addA14;
reg [15:0] addB14;
wire addA14_ready;
reg addA14_valid;
wire addB14_ready;
reg addB14_valid;
wire [15:0] add15_res;
reg add15_ready;
wire add15_valid;
reg [15:0] addA15;
reg [15:0] addB15;
wire addA15_ready;
reg addA15_valid;
wire addB15_ready;
reg addB15_valid;
wire [15:0] add16_res;
reg add16_ready;
wire add16_valid;
reg [15:0] addA16;
reg [15:0] addB16;
wire addA16_ready;
reg addA16_valid;
wire addB16_ready;
reg addB16_valid;
wire [15:0] add17_res;
reg add17_ready;
wire add17_valid;
reg [15:0] addA17;
reg [15:0] addB17;
wire addA17_ready;
reg addA17_valid;
wire addB17_ready;
reg addB17_valid;
wire [15:0] add18_res;
reg add18_ready;
wire add18_valid;
reg [15:0] addA18;
reg [15:0] addB18;
wire addA18_ready;
reg addA18_valid;
wire addB18_ready;
reg addB18_valid;
wire [15:0] add19_res;
reg add19_ready;
wire add19_valid;
reg [15:0] addA19;
reg [15:0] addB19;
wire addA19_ready;
reg addA19_valid;
wire addB19_ready;
reg addB19_valid;
wire [15:0] add20_res;
reg add20_ready;
wire add20_valid;
reg [15:0] addA20;
reg [15:0] addB20;
wire addA20_ready;
reg addA20_valid;
wire addB20_ready;
reg addB20_valid;
wire [15:0] add21_res;
reg add21_ready;
wire add21_valid;
reg [15:0] addA21;
reg [15:0] addB21;
wire addA21_ready;
reg addA21_valid;
wire addB21_ready;
reg addB21_valid;
wire [15:0] add22_res;
reg add22_ready;
wire add22_valid;
reg [15:0] addA22;
reg [15:0] addB22;
wire addA22_ready;
reg addA22_valid;
wire addB22_ready;
reg addB22_valid;
wire [15:0] add23_res;
reg add23_ready;
wire add23_valid;
reg [15:0] addA23;
reg [15:0] addB23;
wire addA23_ready;
reg addA23_valid;
wire addB23_ready;
reg addB23_valid;
wire [15:0] add24_res;
reg add24_ready;
wire add24_valid;
reg [15:0] addA24;
reg [15:0] addB24;
wire addA24_ready;
reg addA24_valid;
wire addB24_ready;
reg addB24_valid;
wire [15:0] add25_res;
reg add25_ready;
wire add25_valid;
reg [15:0] addA25;
reg [15:0] addB25;
wire addA25_ready;
reg addA25_valid;
wire addB25_ready;
reg addB25_valid;
wire [15:0] add26_res;
reg add26_ready;
wire add26_valid;
reg [15:0] addA26;
reg [15:0] addB26;
wire addA26_ready;
reg addA26_valid;
wire addB26_ready;
reg addB26_valid;
wire [15:0] add27_res;
reg add27_ready;
wire add27_valid;
reg [15:0] addA27;
reg [15:0] addB27;
wire addA27_ready;
reg addA27_valid;
wire addB27_ready;
reg addB27_valid;
wire [15:0] add28_res;
reg add28_ready;
wire add28_valid;
reg [15:0] addA28;
reg [15:0] addB28;
wire addA28_ready;
reg addA28_valid;
wire addB28_ready;
reg addB28_valid;
wire [15:0] add29_res;
reg add29_ready;
wire add29_valid;
reg [15:0] addA29;
reg [15:0] addB29;
wire addA29_ready;
reg addA29_valid;
wire addB29_ready;
reg addB29_valid;
wire [15:0] add30_res;
reg add30_ready;
wire add30_valid;
reg [15:0] addA30;
reg [15:0] addB30;
wire addA30_ready;
reg addA30_valid;
wire addB30_ready;
reg addB30_valid;
wire [15:0] add31_res;
reg add31_ready;
wire add31_valid;
reg [15:0] addA31;
reg [15:0] addB31;
wire addA31_ready;
reg addA31_valid;
wire addB31_ready;
reg addB31_valid;
wire [15:0] add32_res;
reg add32_ready;
wire add32_valid;
reg [15:0] addA32;
reg [15:0] addB32;
wire addA32_ready;
reg addA32_valid;
wire addB32_ready;
reg addB32_valid;
wire [15:0] add33_res;
reg add33_ready;
wire add33_valid;
reg [15:0] addA33;
reg [15:0] addB33;
wire addA33_ready;
reg addA33_valid;
wire addB33_ready;
reg addB33_valid;
wire [15:0] add34_res;
reg add34_ready;
wire add34_valid;
reg [15:0] addA34;
reg [15:0] addB34;
wire addA34_ready;
reg addA34_valid;
wire addB34_ready;
reg addB34_valid;
wire [15:0] add35_res;
reg add35_ready;
wire add35_valid;
reg [15:0] addA35;
reg [15:0] addB35;
wire addA35_ready;
reg addA35_valid;
wire addB35_ready;
reg addB35_valid;
wire [15:0] add36_res;
reg add36_ready;
wire add36_valid;
reg [15:0] addA36;
reg [15:0] addB36;
wire addA36_ready;
reg addA36_valid;
wire addB36_ready;
reg addB36_valid;
wire [15:0] add37_res;
reg add37_ready;
wire add37_valid;
reg [15:0] addA37;
reg [15:0] addB37;
wire addA37_ready;
reg addA37_valid;
wire addB37_ready;
reg addB37_valid;
wire [15:0] add38_res;
reg add38_ready;
wire add38_valid;
reg [15:0] addA38;
reg [15:0] addB38;
wire addA38_ready;
reg addA38_valid;
wire addB38_ready;
reg addB38_valid;
wire [15:0] add39_res;
reg add39_ready;
wire add39_valid;
reg [15:0] addA39;
reg [15:0] addB39;
wire addA39_ready;
reg addA39_valid;
wire addB39_ready;
reg addB39_valid;
wire [15:0] add40_res;
reg add40_ready;
wire add40_valid;
reg [15:0] addA40;
reg [15:0] addB40;
wire addA40_ready;
reg addA40_valid;
wire addB40_ready;
reg addB40_valid;
wire [15:0] add41_res;
reg add41_ready;
wire add41_valid;
reg [15:0] addA41;
reg [15:0] addB41;
wire addA41_ready;
reg addA41_valid;
wire addB41_ready;
reg addB41_valid;
wire [15:0] add42_res;
reg add42_ready;
wire add42_valid;
reg [15:0] addA42;
reg [15:0] addB42;
wire addA42_ready;
reg addA42_valid;
wire addB42_ready;
reg addB42_valid;
wire [15:0] add43_res;
reg add43_ready;
wire add43_valid;
reg [15:0] addA43;
reg [15:0] addB43;
wire addA43_ready;
reg addA43_valid;
wire addB43_ready;
reg addB43_valid;
wire [15:0] add44_res;
reg add44_ready;
wire add44_valid;
reg [15:0] addA44;
reg [15:0] addB44;
wire addA44_ready;
reg addA44_valid;
wire addB44_ready;
reg addB44_valid;
wire [15:0] add45_res;
reg add45_ready;
wire add45_valid;
reg [15:0] addA45;
reg [15:0] addB45;
wire addA45_ready;
reg addA45_valid;
wire addB45_ready;
reg addB45_valid;
wire [15:0] add46_res;
reg add46_ready;
wire add46_valid;
reg [15:0] addA46;
reg [15:0] addB46;
wire addA46_ready;
reg addA46_valid;
wire addB46_ready;
reg addB46_valid;
wire [15:0] add47_res;
reg add47_ready;
wire add47_valid;
reg [15:0] addA47;
reg [15:0] addB47;
wire addA47_ready;
reg addA47_valid;
wire addB47_ready;
reg addB47_valid;
wire [15:0] add48_res;
reg add48_ready;
wire add48_valid;
reg [15:0] addA48;
reg [15:0] addB48;
wire addA48_ready;
reg addA48_valid;
wire addB48_ready;
reg addB48_valid;
wire [15:0] add49_res;
reg add49_ready;
wire add49_valid;
reg [15:0] addA49;
reg [15:0] addB49;
wire addA49_ready;
reg addA49_valid;
wire addB49_ready;
reg addB49_valid;
wire [15:0] add50_res;
reg add50_ready;
wire add50_valid;
reg [15:0] addA50;
reg [15:0] addB50;
wire addA50_ready;
reg addA50_valid;
wire addB50_ready;
reg addB50_valid;
wire [15:0] add51_res;
reg add51_ready;
wire add51_valid;
reg [15:0] addA51;
reg [15:0] addB51;
wire addA51_ready;
reg addA51_valid;
wire addB51_ready;
reg addB51_valid;
wire [15:0] add52_res;
reg add52_ready;
wire add52_valid;
reg [15:0] addA52;
reg [15:0] addB52;
wire addA52_ready;
reg addA52_valid;
wire addB52_ready;
reg addB52_valid;
wire [15:0] add53_res;
reg add53_ready;
wire add53_valid;
reg [15:0] addA53;
reg [15:0] addB53;
wire addA53_ready;
reg addA53_valid;
wire addB53_ready;
reg addB53_valid;
wire [15:0] add54_res;
reg add54_ready;
wire add54_valid;
reg [15:0] addA54;
reg [15:0] addB54;
wire addA54_ready;
reg addA54_valid;
wire addB54_ready;
reg addB54_valid;
wire [15:0] add55_res;
reg add55_ready;
wire add55_valid;
reg [15:0] addA55;
reg [15:0] addB55;
wire addA55_ready;
reg addA55_valid;
wire addB55_ready;
reg addB55_valid;
wire [15:0] add56_res;
reg add56_ready;
wire add56_valid;
reg [15:0] addA56;
reg [15:0] addB56;
wire addA56_ready;
reg addA56_valid;
wire addB56_ready;
reg addB56_valid;
wire [15:0] add57_res;
reg add57_ready;
wire add57_valid;
reg [15:0] addA57;
reg [15:0] addB57;
wire addA57_ready;
reg addA57_valid;
wire addB57_ready;
reg addB57_valid;
wire [15:0] add58_res;
reg add58_ready;
wire add58_valid;
reg [15:0] addA58;
reg [15:0] addB58;
wire addA58_ready;
reg addA58_valid;
wire addB58_ready;
reg addB58_valid;
wire [15:0] add59_res;
reg add59_ready;
wire add59_valid;
reg [15:0] addA59;
reg [15:0] addB59;
wire addA59_ready;
reg addA59_valid;
wire addB59_ready;
reg addB59_valid;
wire [15:0] add60_res;
reg add60_ready;
wire add60_valid;
reg [15:0] addA60;
reg [15:0] addB60;
wire addA60_ready;
reg addA60_valid;
wire addB60_ready;
reg addB60_valid;

wire [15:0] add61_res;
reg add61_ready;
wire add61_valid;
reg [15:0] addA61;
reg [15:0] addB61;
wire addA61_ready;
reg addA61_valid;
wire addB61_ready;
reg addB61_valid;
wire [15:0] add62_res;
reg add62_ready;
wire add62_valid;
reg [15:0] addA62;
reg [15:0] addB62;
wire addA62_ready;
reg addA62_valid;
wire addB62_ready;
reg addB62_valid;
wire [15:0] add63_res;
reg add63_ready;
wire add63_valid;
reg [15:0] addA63;
reg [15:0] addB63;
wire addA63_ready;
reg addA63_valid;
wire addB63_ready;
reg addB63_valid;


reg adder_l1_en;
reg adder_l2_en;
reg adder_l3_en;
reg adder_l4_en;
reg adder_l5_en;
reg adder_l6_en;   
    
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
        float_adder add_13(
        .M_AXIS_RESULT_tdata(add13_res),
        .M_AXIS_RESULT_tready(add13_ready),
        .M_AXIS_RESULT_tvalid(add13_valid),
        .S_AXIS_A_tdata(addA13),
        .S_AXIS_A_tready(addA13_ready),
        .S_AXIS_A_tvalid(addA13_valid),
        .S_AXIS_B_tdata(addB13),
        .S_AXIS_B_tready(addB13_ready),
        .S_AXIS_B_tvalid(addB13_valid),
        .aclk(clk));
        float_adder add_14(
        .M_AXIS_RESULT_tdata(add14_res),
        .M_AXIS_RESULT_tready(add14_ready),
        .M_AXIS_RESULT_tvalid(add14_valid),
        .S_AXIS_A_tdata(addA14),
        .S_AXIS_A_tready(addA14_ready),
        .S_AXIS_A_tvalid(addA14_valid),
        .S_AXIS_B_tdata(addB14),
        .S_AXIS_B_tready(addB14_ready),
        .S_AXIS_B_tvalid(addB14_valid),
        .aclk(clk));
        float_adder add_15(
        .M_AXIS_RESULT_tdata(add15_res),
        .M_AXIS_RESULT_tready(add15_ready),
        .M_AXIS_RESULT_tvalid(add15_valid),
        .S_AXIS_A_tdata(addA15),
        .S_AXIS_A_tready(addA15_ready),
        .S_AXIS_A_tvalid(addA15_valid),
        .S_AXIS_B_tdata(addB15),
        .S_AXIS_B_tready(addB15_ready),
        .S_AXIS_B_tvalid(addB15_valid),
        .aclk(clk));
        float_adder add_16(
        .M_AXIS_RESULT_tdata(add16_res),
        .M_AXIS_RESULT_tready(add16_ready),
        .M_AXIS_RESULT_tvalid(add16_valid),
        .S_AXIS_A_tdata(addA16),
        .S_AXIS_A_tready(addA16_ready),
        .S_AXIS_A_tvalid(addA16_valid),
        .S_AXIS_B_tdata(addB16),
        .S_AXIS_B_tready(addB16_ready),
        .S_AXIS_B_tvalid(addB16_valid),
        .aclk(clk));
        float_adder add_17(
        .M_AXIS_RESULT_tdata(add17_res),
        .M_AXIS_RESULT_tready(add17_ready),
        .M_AXIS_RESULT_tvalid(add17_valid),
        .S_AXIS_A_tdata(addA17),
        .S_AXIS_A_tready(addA17_ready),
        .S_AXIS_A_tvalid(addA17_valid),
        .S_AXIS_B_tdata(addB17),
        .S_AXIS_B_tready(addB17_ready),
        .S_AXIS_B_tvalid(addB17_valid),
        .aclk(clk));
        float_adder add_18(
        .M_AXIS_RESULT_tdata(add18_res),
        .M_AXIS_RESULT_tready(add18_ready),
        .M_AXIS_RESULT_tvalid(add18_valid),
        .S_AXIS_A_tdata(addA18),
        .S_AXIS_A_tready(addA18_ready),
        .S_AXIS_A_tvalid(addA18_valid),
        .S_AXIS_B_tdata(addB18),
        .S_AXIS_B_tready(addB18_ready),
        .S_AXIS_B_tvalid(addB18_valid),
        .aclk(clk));
        float_adder add_19(
        .M_AXIS_RESULT_tdata(add19_res),
        .M_AXIS_RESULT_tready(add19_ready),
        .M_AXIS_RESULT_tvalid(add19_valid),
        .S_AXIS_A_tdata(addA19),
        .S_AXIS_A_tready(addA19_ready),
        .S_AXIS_A_tvalid(addA19_valid),
        .S_AXIS_B_tdata(addB19),
        .S_AXIS_B_tready(addB19_ready),
        .S_AXIS_B_tvalid(addB19_valid),
        .aclk(clk));
        float_adder add_20(
        .M_AXIS_RESULT_tdata(add20_res),
        .M_AXIS_RESULT_tready(add20_ready),
        .M_AXIS_RESULT_tvalid(add20_valid),
        .S_AXIS_A_tdata(addA20),
        .S_AXIS_A_tready(addA20_ready),
        .S_AXIS_A_tvalid(addA20_valid),
        .S_AXIS_B_tdata(addB20),
        .S_AXIS_B_tready(addB20_ready),
        .S_AXIS_B_tvalid(addB20_valid),
        .aclk(clk));
        float_adder add_21(
        .M_AXIS_RESULT_tdata(add21_res),
        .M_AXIS_RESULT_tready(add21_ready),
        .M_AXIS_RESULT_tvalid(add21_valid),
        .S_AXIS_A_tdata(addA21),
        .S_AXIS_A_tready(addA21_ready),
        .S_AXIS_A_tvalid(addA21_valid),
        .S_AXIS_B_tdata(addB21),
        .S_AXIS_B_tready(addB21_ready),
        .S_AXIS_B_tvalid(addB21_valid),
        .aclk(clk));
        float_adder add_22(
        .M_AXIS_RESULT_tdata(add22_res),
        .M_AXIS_RESULT_tready(add22_ready),
        .M_AXIS_RESULT_tvalid(add22_valid),
        .S_AXIS_A_tdata(addA22),
        .S_AXIS_A_tready(addA22_ready),
        .S_AXIS_A_tvalid(addA22_valid),
        .S_AXIS_B_tdata(addB22),
        .S_AXIS_B_tready(addB22_ready),
        .S_AXIS_B_tvalid(addB22_valid),
        .aclk(clk));
        float_adder add_23(
        .M_AXIS_RESULT_tdata(add23_res),
        .M_AXIS_RESULT_tready(add23_ready),
        .M_AXIS_RESULT_tvalid(add23_valid),
        .S_AXIS_A_tdata(addA23),
        .S_AXIS_A_tready(addA23_ready),
        .S_AXIS_A_tvalid(addA23_valid),
        .S_AXIS_B_tdata(addB23),
        .S_AXIS_B_tready(addB23_ready),
        .S_AXIS_B_tvalid(addB23_valid),
        .aclk(clk));
        float_adder add_24(
        .M_AXIS_RESULT_tdata(add24_res),
        .M_AXIS_RESULT_tready(add24_ready),
        .M_AXIS_RESULT_tvalid(add24_valid),
        .S_AXIS_A_tdata(addA24),
        .S_AXIS_A_tready(addA24_ready),
        .S_AXIS_A_tvalid(addA24_valid),
        .S_AXIS_B_tdata(addB24),
        .S_AXIS_B_tready(addB24_ready),
        .S_AXIS_B_tvalid(addB24_valid),
        .aclk(clk));
        float_adder add_25(
        .M_AXIS_RESULT_tdata(add25_res),
        .M_AXIS_RESULT_tready(add25_ready),
        .M_AXIS_RESULT_tvalid(add25_valid),
        .S_AXIS_A_tdata(addA25),
        .S_AXIS_A_tready(addA25_ready),
        .S_AXIS_A_tvalid(addA25_valid),
        .S_AXIS_B_tdata(addB25),
        .S_AXIS_B_tready(addB25_ready),
        .S_AXIS_B_tvalid(addB25_valid),
        .aclk(clk));
        float_adder add_26(
        .M_AXIS_RESULT_tdata(add26_res),
        .M_AXIS_RESULT_tready(add26_ready),
        .M_AXIS_RESULT_tvalid(add26_valid),
        .S_AXIS_A_tdata(addA26),
        .S_AXIS_A_tready(addA26_ready),
        .S_AXIS_A_tvalid(addA26_valid),
        .S_AXIS_B_tdata(addB26),
        .S_AXIS_B_tready(addB26_ready),
        .S_AXIS_B_tvalid(addB26_valid),
        .aclk(clk));
        float_adder add_27(
        .M_AXIS_RESULT_tdata(add27_res),
        .M_AXIS_RESULT_tready(add27_ready),
        .M_AXIS_RESULT_tvalid(add27_valid),
        .S_AXIS_A_tdata(addA27),
        .S_AXIS_A_tready(addA27_ready),
        .S_AXIS_A_tvalid(addA27_valid),
        .S_AXIS_B_tdata(addB27),
        .S_AXIS_B_tready(addB27_ready),
        .S_AXIS_B_tvalid(addB27_valid),
        .aclk(clk));
        float_adder add_28(
        .M_AXIS_RESULT_tdata(add28_res),
        .M_AXIS_RESULT_tready(add28_ready),
        .M_AXIS_RESULT_tvalid(add28_valid),
        .S_AXIS_A_tdata(addA28),
        .S_AXIS_A_tready(addA28_ready),
        .S_AXIS_A_tvalid(addA28_valid),
        .S_AXIS_B_tdata(addB28),
        .S_AXIS_B_tready(addB28_ready),
        .S_AXIS_B_tvalid(addB28_valid),
        .aclk(clk));
        float_adder add_29(
        .M_AXIS_RESULT_tdata(add29_res),
        .M_AXIS_RESULT_tready(add29_ready),
        .M_AXIS_RESULT_tvalid(add29_valid),
        .S_AXIS_A_tdata(addA29),
        .S_AXIS_A_tready(addA29_ready),
        .S_AXIS_A_tvalid(addA29_valid),
        .S_AXIS_B_tdata(addB29),
        .S_AXIS_B_tready(addB29_ready),
        .S_AXIS_B_tvalid(addB29_valid),
        .aclk(clk));
        float_adder add_30(
        .M_AXIS_RESULT_tdata(add30_res),
        .M_AXIS_RESULT_tready(add30_ready),
        .M_AXIS_RESULT_tvalid(add30_valid),
        .S_AXIS_A_tdata(addA30),
        .S_AXIS_A_tready(addA30_ready),
        .S_AXIS_A_tvalid(addA30_valid),
        .S_AXIS_B_tdata(addB30),
        .S_AXIS_B_tready(addB30_ready),
        .S_AXIS_B_tvalid(addB30_valid),
        .aclk(clk));
        float_adder add_31(
        .M_AXIS_RESULT_tdata(add31_res),
        .M_AXIS_RESULT_tready(add31_ready),
        .M_AXIS_RESULT_tvalid(add31_valid),
        .S_AXIS_A_tdata(addA31),
        .S_AXIS_A_tready(addA31_ready),
        .S_AXIS_A_tvalid(addA31_valid),
        .S_AXIS_B_tdata(addB31),
        .S_AXIS_B_tready(addB31_ready),
        .S_AXIS_B_tvalid(addB31_valid),
        .aclk(clk));
        float_adder add_32(
        .M_AXIS_RESULT_tdata(add32_res),
        .M_AXIS_RESULT_tready(add32_ready),
        .M_AXIS_RESULT_tvalid(add32_valid),
        .S_AXIS_A_tdata(addA32),
        .S_AXIS_A_tready(addA32_ready),
        .S_AXIS_A_tvalid(addA32_valid),
        .S_AXIS_B_tdata(addB32),
        .S_AXIS_B_tready(addB32_ready),
        .S_AXIS_B_tvalid(addB32_valid),
        .aclk(clk));
        float_adder add_33(
        .M_AXIS_RESULT_tdata(add33_res),
        .M_AXIS_RESULT_tready(add33_ready),
        .M_AXIS_RESULT_tvalid(add33_valid),
        .S_AXIS_A_tdata(addA33),
        .S_AXIS_A_tready(addA33_ready),
        .S_AXIS_A_tvalid(addA33_valid),
        .S_AXIS_B_tdata(addB33),
        .S_AXIS_B_tready(addB33_ready),
        .S_AXIS_B_tvalid(addB33_valid),
        .aclk(clk));
        float_adder add_34(
        .M_AXIS_RESULT_tdata(add34_res),
        .M_AXIS_RESULT_tready(add34_ready),
        .M_AXIS_RESULT_tvalid(add34_valid),
        .S_AXIS_A_tdata(addA34),
        .S_AXIS_A_tready(addA34_ready),
        .S_AXIS_A_tvalid(addA34_valid),
        .S_AXIS_B_tdata(addB34),
        .S_AXIS_B_tready(addB34_ready),
        .S_AXIS_B_tvalid(addB34_valid),
        .aclk(clk));
        float_adder add_35(
        .M_AXIS_RESULT_tdata(add35_res),
        .M_AXIS_RESULT_tready(add35_ready),
        .M_AXIS_RESULT_tvalid(add35_valid),
        .S_AXIS_A_tdata(addA35),
        .S_AXIS_A_tready(addA35_ready),
        .S_AXIS_A_tvalid(addA35_valid),
        .S_AXIS_B_tdata(addB35),
        .S_AXIS_B_tready(addB35_ready),
        .S_AXIS_B_tvalid(addB35_valid),
        .aclk(clk));
        float_adder add_36(
        .M_AXIS_RESULT_tdata(add36_res),
        .M_AXIS_RESULT_tready(add36_ready),
        .M_AXIS_RESULT_tvalid(add36_valid),
        .S_AXIS_A_tdata(addA36),
        .S_AXIS_A_tready(addA36_ready),
        .S_AXIS_A_tvalid(addA36_valid),
        .S_AXIS_B_tdata(addB36),
        .S_AXIS_B_tready(addB36_ready),
        .S_AXIS_B_tvalid(addB36_valid),
        .aclk(clk));
        float_adder add_37(
        .M_AXIS_RESULT_tdata(add37_res),
        .M_AXIS_RESULT_tready(add37_ready),
        .M_AXIS_RESULT_tvalid(add37_valid),
        .S_AXIS_A_tdata(addA37),
        .S_AXIS_A_tready(addA37_ready),
        .S_AXIS_A_tvalid(addA37_valid),
        .S_AXIS_B_tdata(addB37),
        .S_AXIS_B_tready(addB37_ready),
        .S_AXIS_B_tvalid(addB37_valid),
        .aclk(clk));
        float_adder add_38(
        .M_AXIS_RESULT_tdata(add38_res),
        .M_AXIS_RESULT_tready(add38_ready),
        .M_AXIS_RESULT_tvalid(add38_valid),
        .S_AXIS_A_tdata(addA38),
        .S_AXIS_A_tready(addA38_ready),
        .S_AXIS_A_tvalid(addA38_valid),
        .S_AXIS_B_tdata(addB38),
        .S_AXIS_B_tready(addB38_ready),
        .S_AXIS_B_tvalid(addB38_valid),
        .aclk(clk));
        float_adder add_39(
        .M_AXIS_RESULT_tdata(add39_res),
        .M_AXIS_RESULT_tready(add39_ready),
        .M_AXIS_RESULT_tvalid(add39_valid),
        .S_AXIS_A_tdata(addA39),
        .S_AXIS_A_tready(addA39_ready),
        .S_AXIS_A_tvalid(addA39_valid),
        .S_AXIS_B_tdata(addB39),
        .S_AXIS_B_tready(addB39_ready),
        .S_AXIS_B_tvalid(addB39_valid),
        .aclk(clk));
        float_adder add_40(
        .M_AXIS_RESULT_tdata(add40_res),
        .M_AXIS_RESULT_tready(add40_ready),
        .M_AXIS_RESULT_tvalid(add40_valid),
        .S_AXIS_A_tdata(addA40),
        .S_AXIS_A_tready(addA40_ready),
        .S_AXIS_A_tvalid(addA40_valid),
        .S_AXIS_B_tdata(addB40),
        .S_AXIS_B_tready(addB40_ready),
        .S_AXIS_B_tvalid(addB40_valid),
        .aclk(clk));
        float_adder add_41(
        .M_AXIS_RESULT_tdata(add41_res),
        .M_AXIS_RESULT_tready(add41_ready),
        .M_AXIS_RESULT_tvalid(add41_valid),
        .S_AXIS_A_tdata(addA41),
        .S_AXIS_A_tready(addA41_ready),
        .S_AXIS_A_tvalid(addA41_valid),
        .S_AXIS_B_tdata(addB41),
        .S_AXIS_B_tready(addB41_ready),
        .S_AXIS_B_tvalid(addB41_valid),
        .aclk(clk));
        float_adder add_42(
        .M_AXIS_RESULT_tdata(add42_res),
        .M_AXIS_RESULT_tready(add42_ready),
        .M_AXIS_RESULT_tvalid(add42_valid),
        .S_AXIS_A_tdata(addA42),
        .S_AXIS_A_tready(addA42_ready),
        .S_AXIS_A_tvalid(addA42_valid),
        .S_AXIS_B_tdata(addB42),
        .S_AXIS_B_tready(addB42_ready),
        .S_AXIS_B_tvalid(addB42_valid),
        .aclk(clk));
        float_adder add_43(
        .M_AXIS_RESULT_tdata(add43_res),
        .M_AXIS_RESULT_tready(add43_ready),
        .M_AXIS_RESULT_tvalid(add43_valid),
        .S_AXIS_A_tdata(addA43),
        .S_AXIS_A_tready(addA43_ready),
        .S_AXIS_A_tvalid(addA43_valid),
        .S_AXIS_B_tdata(addB43),
        .S_AXIS_B_tready(addB43_ready),
        .S_AXIS_B_tvalid(addB43_valid),
        .aclk(clk));
        float_adder add_44(
        .M_AXIS_RESULT_tdata(add44_res),
        .M_AXIS_RESULT_tready(add44_ready),
        .M_AXIS_RESULT_tvalid(add44_valid),
        .S_AXIS_A_tdata(addA44),
        .S_AXIS_A_tready(addA44_ready),
        .S_AXIS_A_tvalid(addA44_valid),
        .S_AXIS_B_tdata(addB44),
        .S_AXIS_B_tready(addB44_ready),
        .S_AXIS_B_tvalid(addB44_valid),
        .aclk(clk));
        float_adder add_45(
        .M_AXIS_RESULT_tdata(add45_res),
        .M_AXIS_RESULT_tready(add45_ready),
        .M_AXIS_RESULT_tvalid(add45_valid),
        .S_AXIS_A_tdata(addA45),
        .S_AXIS_A_tready(addA45_ready),
        .S_AXIS_A_tvalid(addA45_valid),
        .S_AXIS_B_tdata(addB45),
        .S_AXIS_B_tready(addB45_ready),
        .S_AXIS_B_tvalid(addB45_valid),
        .aclk(clk));
        float_adder add_46(
        .M_AXIS_RESULT_tdata(add46_res),
        .M_AXIS_RESULT_tready(add46_ready),
        .M_AXIS_RESULT_tvalid(add46_valid),
        .S_AXIS_A_tdata(addA46),
        .S_AXIS_A_tready(addA46_ready),
        .S_AXIS_A_tvalid(addA46_valid),
        .S_AXIS_B_tdata(addB46),
        .S_AXIS_B_tready(addB46_ready),
        .S_AXIS_B_tvalid(addB46_valid),
        .aclk(clk));
        float_adder add_47(
        .M_AXIS_RESULT_tdata(add47_res),
        .M_AXIS_RESULT_tready(add47_ready),
        .M_AXIS_RESULT_tvalid(add47_valid),
        .S_AXIS_A_tdata(addA47),
        .S_AXIS_A_tready(addA47_ready),
        .S_AXIS_A_tvalid(addA47_valid),
        .S_AXIS_B_tdata(addB47),
        .S_AXIS_B_tready(addB47_ready),
        .S_AXIS_B_tvalid(addB47_valid),
        .aclk(clk));
        float_adder add_48(
        .M_AXIS_RESULT_tdata(add48_res),
        .M_AXIS_RESULT_tready(add48_ready),
        .M_AXIS_RESULT_tvalid(add48_valid),
        .S_AXIS_A_tdata(addA48),
        .S_AXIS_A_tready(addA48_ready),
        .S_AXIS_A_tvalid(addA48_valid),
        .S_AXIS_B_tdata(addB48),
        .S_AXIS_B_tready(addB48_ready),
        .S_AXIS_B_tvalid(addB48_valid),
        .aclk(clk));
        float_adder add_49(
        .M_AXIS_RESULT_tdata(add49_res),
        .M_AXIS_RESULT_tready(add49_ready),
        .M_AXIS_RESULT_tvalid(add49_valid),
        .S_AXIS_A_tdata(addA49),
        .S_AXIS_A_tready(addA49_ready),
        .S_AXIS_A_tvalid(addA49_valid),
        .S_AXIS_B_tdata(addB49),
        .S_AXIS_B_tready(addB49_ready),
        .S_AXIS_B_tvalid(addB49_valid),
        .aclk(clk));
        float_adder add_50(
        .M_AXIS_RESULT_tdata(add50_res),
        .M_AXIS_RESULT_tready(add50_ready),
        .M_AXIS_RESULT_tvalid(add50_valid),
        .S_AXIS_A_tdata(addA50),
        .S_AXIS_A_tready(addA50_ready),
        .S_AXIS_A_tvalid(addA50_valid),
        .S_AXIS_B_tdata(addB50),
        .S_AXIS_B_tready(addB50_ready),
        .S_AXIS_B_tvalid(addB50_valid),
        .aclk(clk));
        float_adder add_51(
        .M_AXIS_RESULT_tdata(add51_res),
        .M_AXIS_RESULT_tready(add51_ready),
        .M_AXIS_RESULT_tvalid(add51_valid),
        .S_AXIS_A_tdata(addA51),
        .S_AXIS_A_tready(addA51_ready),
        .S_AXIS_A_tvalid(addA51_valid),
        .S_AXIS_B_tdata(addB51),
        .S_AXIS_B_tready(addB51_ready),
        .S_AXIS_B_tvalid(addB51_valid),
        .aclk(clk));
        float_adder add_52(
        .M_AXIS_RESULT_tdata(add52_res),
        .M_AXIS_RESULT_tready(add52_ready),
        .M_AXIS_RESULT_tvalid(add52_valid),
        .S_AXIS_A_tdata(addA52),
        .S_AXIS_A_tready(addA52_ready),
        .S_AXIS_A_tvalid(addA52_valid),
        .S_AXIS_B_tdata(addB52),
        .S_AXIS_B_tready(addB52_ready),
        .S_AXIS_B_tvalid(addB52_valid),
        .aclk(clk));
        float_adder add_53(
        .M_AXIS_RESULT_tdata(add53_res),
        .M_AXIS_RESULT_tready(add53_ready),
        .M_AXIS_RESULT_tvalid(add53_valid),
        .S_AXIS_A_tdata(addA53),
        .S_AXIS_A_tready(addA53_ready),
        .S_AXIS_A_tvalid(addA53_valid),
        .S_AXIS_B_tdata(addB53),
        .S_AXIS_B_tready(addB53_ready),
        .S_AXIS_B_tvalid(addB53_valid),
        .aclk(clk));
        float_adder add_54(
        .M_AXIS_RESULT_tdata(add54_res),
        .M_AXIS_RESULT_tready(add54_ready),
        .M_AXIS_RESULT_tvalid(add54_valid),
        .S_AXIS_A_tdata(addA54),
        .S_AXIS_A_tready(addA54_ready),
        .S_AXIS_A_tvalid(addA54_valid),
        .S_AXIS_B_tdata(addB54),
        .S_AXIS_B_tready(addB54_ready),
        .S_AXIS_B_tvalid(addB54_valid),
        .aclk(clk));
        float_adder add_55(
        .M_AXIS_RESULT_tdata(add55_res),
        .M_AXIS_RESULT_tready(add55_ready),
        .M_AXIS_RESULT_tvalid(add55_valid),
        .S_AXIS_A_tdata(addA55),
        .S_AXIS_A_tready(addA55_ready),
        .S_AXIS_A_tvalid(addA55_valid),
        .S_AXIS_B_tdata(addB55),
        .S_AXIS_B_tready(addB55_ready),
        .S_AXIS_B_tvalid(addB55_valid),
        .aclk(clk));
        float_adder add_56(
        .M_AXIS_RESULT_tdata(add56_res),
        .M_AXIS_RESULT_tready(add56_ready),
        .M_AXIS_RESULT_tvalid(add56_valid),
        .S_AXIS_A_tdata(addA56),
        .S_AXIS_A_tready(addA56_ready),
        .S_AXIS_A_tvalid(addA56_valid),
        .S_AXIS_B_tdata(addB56),
        .S_AXIS_B_tready(addB56_ready),
        .S_AXIS_B_tvalid(addB56_valid),
        .aclk(clk));
        float_adder add_57(
        .M_AXIS_RESULT_tdata(add57_res),
        .M_AXIS_RESULT_tready(add57_ready),
        .M_AXIS_RESULT_tvalid(add57_valid),
        .S_AXIS_A_tdata(addA57),
        .S_AXIS_A_tready(addA57_ready),
        .S_AXIS_A_tvalid(addA57_valid),
        .S_AXIS_B_tdata(addB57),
        .S_AXIS_B_tready(addB57_ready),
        .S_AXIS_B_tvalid(addB57_valid),
        .aclk(clk));
        float_adder add_58(
        .M_AXIS_RESULT_tdata(add58_res),
        .M_AXIS_RESULT_tready(add58_ready),
        .M_AXIS_RESULT_tvalid(add58_valid),
        .S_AXIS_A_tdata(addA58),
        .S_AXIS_A_tready(addA58_ready),
        .S_AXIS_A_tvalid(addA58_valid),
        .S_AXIS_B_tdata(addB58),
        .S_AXIS_B_tready(addB58_ready),
        .S_AXIS_B_tvalid(addB58_valid),
        .aclk(clk));
        float_adder add_59(
        .M_AXIS_RESULT_tdata(add59_res),
        .M_AXIS_RESULT_tready(add59_ready),
        .M_AXIS_RESULT_tvalid(add59_valid),
        .S_AXIS_A_tdata(addA59),
        .S_AXIS_A_tready(addA59_ready),
        .S_AXIS_A_tvalid(addA59_valid),
        .S_AXIS_B_tdata(addB59),
        .S_AXIS_B_tready(addB59_ready),
        .S_AXIS_B_tvalid(addB59_valid),
        .aclk(clk));
        float_adder add_60(
        .M_AXIS_RESULT_tdata(add60_res),
        .M_AXIS_RESULT_tready(add60_ready),
        .M_AXIS_RESULT_tvalid(add60_valid),
        .S_AXIS_A_tdata(addA60),
        .S_AXIS_A_tready(addA60_ready),
        .S_AXIS_A_tvalid(addA60_valid),
        .S_AXIS_B_tdata(addB60),
        .S_AXIS_B_tready(addB60_ready),
        .S_AXIS_B_tvalid(addB60_valid),
        .aclk(clk));
        float_adder add_61(
        .M_AXIS_RESULT_tdata(add61_res),
        .M_AXIS_RESULT_tready(add61_ready),
        .M_AXIS_RESULT_tvalid(add61_valid),
        .S_AXIS_A_tdata(addA61),
        .S_AXIS_A_tready(addA61_ready),
        .S_AXIS_A_tvalid(addA61_valid),
        .S_AXIS_B_tdata(addB61),
        .S_AXIS_B_tready(addB61_ready),
        .S_AXIS_B_tvalid(addB61_valid),
        .aclk(clk));
        float_adder add_62(
        .M_AXIS_RESULT_tdata(add62_res),
        .M_AXIS_RESULT_tready(add62_ready),
        .M_AXIS_RESULT_tvalid(add62_valid),
        .S_AXIS_A_tdata(addA62),
        .S_AXIS_A_tready(addA62_ready),
        .S_AXIS_A_tvalid(addA62_valid),
        .S_AXIS_B_tdata(addB62),
        .S_AXIS_B_tready(addB62_ready),
        .S_AXIS_B_tvalid(addB62_valid),
        .aclk(clk));
        float_adder add_63(
        .M_AXIS_RESULT_tdata(add63_res),
        .M_AXIS_RESULT_tready(add63_ready),
        .M_AXIS_RESULT_tvalid(add63_valid),
        .S_AXIS_A_tdata(addA63),
        .S_AXIS_A_tready(addA63_ready),
        .S_AXIS_A_tvalid(addA63_valid),
        .S_AXIS_B_tdata(addB63),
        .S_AXIS_B_tready(addB63_ready),
        .S_AXIS_B_tvalid(addB63_valid),
        .aclk(clk));
        
initial 
            begin 
            
                enable_conv_reg <= 1'b0;
                Output_max_row<=18'd5;
                Output_max_col<=18'd5;
                
                Output_BRAM_we<=2'd0;
                //initialise multipliers        
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
                add13_ready<=1'b0;
                addA13_valid<=1'b0;
                addB13_valid<=1'b0;
                add14_ready<=1'b0;
                addA14_valid<=1'b0;
                addB14_valid<=1'b0;
                add15_ready<=1'b0;
                addA15_valid<=1'b0;
                addB15_valid<=1'b0;
                add16_ready<=1'b0;
                addA16_valid<=1'b0;
                addB16_valid<=1'b0;
                add17_ready<=1'b0;
                addA17_valid<=1'b0;
                addB17_valid<=1'b0;
                add18_ready<=1'b0;
                addA18_valid<=1'b0;
                addB18_valid<=1'b0;
                add19_ready<=1'b0;
                addA19_valid<=1'b0;
                addB19_valid<=1'b0;
                add20_ready<=1'b0;
                addA20_valid<=1'b0;
                addB20_valid<=1'b0;
                add21_ready<=1'b0;
                addA21_valid<=1'b0;
                addB21_valid<=1'b0;
                add22_ready<=1'b0;
                addA22_valid<=1'b0;
                addB22_valid<=1'b0;
                add23_ready<=1'b0;
                addA23_valid<=1'b0;
                addB23_valid<=1'b0;
                add24_ready<=1'b0;
                addA24_valid<=1'b0;
                addB24_valid<=1'b0;
                add25_ready<=1'b0;
                addA25_valid<=1'b0;
                addB25_valid<=1'b0;
                add26_ready<=1'b0;
                addA26_valid<=1'b0;
                addB26_valid<=1'b0;
                add27_ready<=1'b0;
                addA27_valid<=1'b0;
                addB27_valid<=1'b0;
                add28_ready<=1'b0;
                addA28_valid<=1'b0;
                addB28_valid<=1'b0;
                add29_ready<=1'b0;
                addA29_valid<=1'b0;
                addB29_valid<=1'b0;
                add30_ready<=1'b0;
                addA30_valid<=1'b0;
                addB30_valid<=1'b0;
                add31_ready<=1'b0;
                addA31_valid<=1'b0;
                addB31_valid<=1'b0;
                add32_ready<=1'b0;
                addA32_valid<=1'b0;
                addB32_valid<=1'b0;
                add33_ready<=1'b0;
                addA33_valid<=1'b0;
                addB33_valid<=1'b0;
                add34_ready<=1'b0;
                addA34_valid<=1'b0;
                addB34_valid<=1'b0;
                add35_ready<=1'b0;
                addA35_valid<=1'b0;
                addB35_valid<=1'b0;
                add36_ready<=1'b0;
                addA36_valid<=1'b0;
                addB36_valid<=1'b0;
                add37_ready<=1'b0;
                addA37_valid<=1'b0;
                addB37_valid<=1'b0;
                add38_ready<=1'b0;
                addA38_valid<=1'b0;
                addB38_valid<=1'b0;
                add39_ready<=1'b0;
                addA39_valid<=1'b0;
                addB39_valid<=1'b0;
                add40_ready<=1'b0;
                addA40_valid<=1'b0;
                addB40_valid<=1'b0;
                add41_ready<=1'b0;
                addA41_valid<=1'b0;
                addB41_valid<=1'b0;
                add42_ready<=1'b0;
                addA42_valid<=1'b0;
                addB42_valid<=1'b0;
                add43_ready<=1'b0;
                addA43_valid<=1'b0;
                addB43_valid<=1'b0;
                add44_ready<=1'b0;
                addA44_valid<=1'b0;
                addB44_valid<=1'b0;
                add45_ready<=1'b0;
                addA45_valid<=1'b0;
                addB45_valid<=1'b0;
                add46_ready<=1'b0;
                addA46_valid<=1'b0;
                addB46_valid<=1'b0;
                add47_ready<=1'b0;
                addA47_valid<=1'b0;
                addB47_valid<=1'b0;
                add48_ready<=1'b0;
                addA48_valid<=1'b0;
                addB48_valid<=1'b0;
                add49_ready<=1'b0;
                addA49_valid<=1'b0;
                addB49_valid<=1'b0;
                add50_ready<=1'b0;
                addA50_valid<=1'b0;
                addB50_valid<=1'b0;
                add51_ready<=1'b0;
                addA51_valid<=1'b0;
                addB51_valid<=1'b0;
                add52_ready<=1'b0;
                addA52_valid<=1'b0;
                addB52_valid<=1'b0;
                add53_ready<=1'b0;
                addA53_valid<=1'b0;
                addB53_valid<=1'b0;
                add54_ready<=1'b0;
                addA54_valid<=1'b0;
                addB54_valid<=1'b0;
                add55_ready<=1'b0;
                addA55_valid<=1'b0;
                addB55_valid<=1'b0;
                add56_ready<=1'b0;
                addA56_valid<=1'b0;
                addB56_valid<=1'b0;
                add57_ready<=1'b0;
                addA57_valid<=1'b0;
                addB57_valid<=1'b0;
                add58_ready<=1'b0;
                addA58_valid<=1'b0;
                addB58_valid<=1'b0;
                add59_ready<=1'b0;
                addA59_valid<=1'b0;
                addB59_valid<=1'b0;
                add60_ready<=1'b0;
                addA60_valid<=1'b0;
                addB60_valid<=1'b0;
                add61_ready<=1'b0;
                addA61_valid<=1'b0;
                addB61_valid<=1'b0;
                add62_ready<=1'b0;
                addA62_valid<=1'b0;
                addB62_valid<=1'b0;
                add63_ready<=1'b0;
                addA63_valid<=1'b0;
                addB63_valid<=1'b0;
                
                adder_l1_en<=1'b0;
                adder_l2_en<=1'b0;
                adder_l3_en<=1'b0;
                adder_l4_en<=1'b0;
                adder_l5_en<=1'b0;
                adder_l6_en<=1'b0;                     
            end

always@(posedge clk) begin                  
 if( enable_conv  == 1'b1 )
                        begin
                        //  Input_update_enable<=1'b0;
                        enable_conv_reg <=1'b1;
                        //   curr_state<=18'd3;
                        add1_ready<=1'b1;
                        add2_ready<=1'b1;
                        add3_ready<=1'b1;
                        add4_ready<=1'b1;
                        add5_ready<=1'b1;
                        add6_ready<=1'b1;
                        add7_ready<=1'b1;
                        add8_ready<=1'b1;
                        add9_ready<=1'b1;
                        add10_ready<=1'b1;
                        add11_ready<=1'b1;
                        add12_ready<=1'b1;
                        add13_ready<=1'b1;                                                                        
                        add14_ready<=1'b1;
                        add15_ready<=1'b1;
                        add16_ready<=1'b1;                               
                        add17_ready<=1'b1;
                        add18_ready<=1'b1;
                        add19_ready<=1'b1;
                        add20_ready<=1'b1;
                        add21_ready<=1'b1;
                        add22_ready<=1'b1;
                        add23_ready<=1'b1;
                        add24_ready<=1'b1;
                        add25_ready<=1'b1;
                        add26_ready<=1'b1;
                        add27_ready<=1'b1;
                        add28_ready<=1'b1;
                        add29_ready<=1'b1;
                        add30_ready<=1'b1;
                        add31_ready<=1'b1;
                        add32_ready<=1'b1;

                        addA1<=conv_values[0];
                        addB1<=conv_values[1];
                        addA2<=conv_values[2];
                        addB2<=conv_values[3];                        
                        addA3<=conv_values[4];
                        addB3<=conv_values[5];
                        addA4<=conv_values[6];
                        addB4<=conv_values[7];
                        addA5<=conv_values[8];
                        addB5<=conv_values[9];                        
                        addA6<=conv_values[10];
                        addB6<=conv_values[11];
                        addA7<=conv_values[12];
                        addB7<=conv_values[13];
                        addA8<=conv_values[14];
                        addB8<=conv_values[15];                        
                        addA9<=conv_values[16];
                        addB9<=conv_values[17];
                        addA10<=conv_values[18];
                        addB10<=conv_values[19];
                        addA11<=conv_values[20];
                        addB11<=conv_values[21];                        
                        addA12<=conv_values[22];
                        addB12<=conv_values[23];
                        addA13<=conv_values[24];
                        addB13<=conv_values[25];
                        addA14<=conv_values[26];
                        addB14<=conv_values[27];                        
                        addA15<=conv_values[28];
                        addB15<=conv_values[29];
                        addA16<=conv_values[30];
                        addB16<=conv_values[31];
                        addA17<=conv_values[32];
                        addB17<=conv_values[33];                        
                        addA18<=conv_values[34];
                        addB18<=conv_values[35];
                        addA19<=conv_values[36];
                        addB19<=conv_values[37];
                        addA20<=conv_values[38];
                        addB20<=conv_values[39];                        
                        addA21<=conv_values[40];
                        addB21<=conv_values[41];
                        addA22<=conv_values[42];
                        addB22<=conv_values[43];
                        addA23<=conv_values[44];
                        addB23<=conv_values[45];                        
                        addA24<=conv_values[46];
                        addB24<=conv_values[47];
                        addA25<=conv_values[48];
                        addB25<=conv_values[49];
                        addA26<=conv_values[50];
                        addB26<=conv_values[51];                        
                        addA27<=conv_values[52];
                        addB27<=conv_values[53];
                        addA28<=conv_values[54];
                        addB28<=conv_values[55];
                        addA29<=conv_values[56];
                        addB29<=conv_values[57];                        
                        addA30<=conv_values[58];
                        addB30<=conv_values[59];
                        addA31<=conv_values[60];
                        addB31<=conv_values[61];                        
                        addA32<=conv_values[62];
                        addB32<=conv_values[63];                                 
                        
                        end 
end 
 
 
 
        //enable multiplication
 always@(posedge clk && enable_conv_reg)
 begin
    //multiply 9 values
    addA1_valid<=1'b1;
    addB1_valid<=1'b1;
    addA2_valid<=1'b1;
    addB2_valid<=1'b1;
    addA3_valid<=1'b1;
    addB3_valid<=1'b1;
    addA4_valid<=1'b1;
    addB4_valid<=1'b1;
    addA5_valid<=1'b1;
    addB5_valid<=1'b1;
    addA6_valid<=1'b1;
    addB6_valid<=1'b1;
    addA7_valid<=1'b1;
    addB7_valid<=1'b1;
    addA8_valid<=1'b1;
    addB8_valid<=1'b1;
    addA9_valid<=1'b1;
    addB9_valid<=1'b1;
    addA10_valid<=1'b1;
    addB10_valid<=1'b1;
    addA11_valid<=1'b1;
    addB11_valid<=1'b1;
    addA12_valid<=1'b1;
    addB12_valid<=1'b1;
    addA13_valid<=1'b1;
    addB13_valid<=1'b1;
    addA14_valid<=1'b1;
    addB14_valid<=1'b1;
    addA15_valid<=1'b1;
    addB15_valid<=1'b1;
    addA16_valid<=1'b1;
    addB16_valid<=1'b1;
    addA17_valid<=1'b1;
    addB17_valid<=1'b1;
    addA18_valid<=1'b1;
    addB18_valid<=1'b1;
    addA19_valid<=1'b1;
    addB19_valid<=1'b1;
    addA20_valid<=1'b1;
    addB20_valid<=1'b1;
    addA21_valid<=1'b1;
    addB21_valid<=1'b1;
    addA22_valid<=1'b1;
    addB22_valid<=1'b1;
    addA23_valid<=1'b1;
    addB23_valid<=1'b1;
    addA24_valid<=1'b1;
    addB24_valid<=1'b1;
    addA25_valid<=1'b1;
    addB25_valid<=1'b1;
    addA26_valid<=1'b1;
    addB26_valid<=1'b1;
    addA27_valid<=1'b1;
    addB27_valid<=1'b1;
    addA28_valid<=1'b1;
    addB28_valid<=1'b1;
    addA29_valid<=1'b1;
    addB29_valid<=1'b1;
    addA30_valid<=1'b1;
    addB30_valid<=1'b1;
    addA31_valid<=1'b1;
    addB31_valid<=1'b1;
    addA32_valid<=1'b1;
    addB32_valid<=1'b1;
        
    if(add1_valid)
        begin
            adder_l1_en<=1'b1;
            add33_ready<=1'b1;
            add34_ready<=1'b1;
            add35_ready<=1'b1;
            add36_ready<=1'b1;
            add37_ready<=1'b1;
            add38_ready<=1'b1;
            add39_ready<=1'b1;
            add40_ready<=1'b1;
            add41_ready<=1'b1;
            add42_ready<=1'b1;
            add43_ready<=1'b1;
            add44_ready<=1'b1;
            add45_ready<=1'b1;
            add46_ready<=1'b1;
            add47_ready<=1'b1;
            add48_ready<=1'b1;
                                                                                                            
            addA33<=add1_res;
            addB33<=add2_res;
            addA34<=add3_res;
            addB34<=add4_res;
            addA35<=add5_res;
            addB35<=add6_res;
            addA36<=add7_res;
            addB36<=add8_res;
            addA37<=add9_res;
            addB37<=add10_res;
            addA38<=add11_res;
            addB38<=add12_res;
            addA39<=add13_res;
            addB39<=add14_res;
            addA40<=add15_res;
            addB40<=add16_res;
            addA41<=add17_res;
            addB41<=add18_res;
            addA42<=add19_res;
            addB42<=add20_res;
            addA43<=add21_res;
            addB43<=add22_res;
            addA44<=add23_res;
            addB44<=add24_res;
            addA45<=add25_res;
            addB45<=add26_res;
            addA46<=add27_res;
            addB46<=add28_res;
            addA47<=add29_res;
            addB47<=add30_res;
            addA48<=add31_res;
            addB48<=add32_res;
            
            
        end
end
 
 
 
always@(posedge clk && adder_l1_en)
begin
   //multiply 9 values
   addA33_valid<=1'b1;
   addB33_valid<=1'b1;
   addA34_valid<=1'b1;
   addB34_valid<=1'b1;
   addA35_valid<=1'b1;
   addB35_valid<=1'b1;
   addA36_valid<=1'b1;
   addB36_valid<=1'b1;
   addA37_valid<=1'b1;
   addB37_valid<=1'b1;
   addA38_valid<=1'b1;
   addB38_valid<=1'b1;
   addA39_valid<=1'b1;
   addB39_valid<=1'b1;
   addA40_valid<=1'b1;
   addB40_valid<=1'b1;
   addA41_valid<=1'b1;
   addB41_valid<=1'b1;
   addA42_valid<=1'b1;
   addB42_valid<=1'b1;
   addA43_valid<=1'b1;
   addB43_valid<=1'b1;
   addA44_valid<=1'b1;
   addB44_valid<=1'b1;
   addA45_valid<=1'b1;
   addB45_valid<=1'b1;
   addA46_valid<=1'b1;
   addB46_valid<=1'b1;
   addA47_valid<=1'b1;
   addB47_valid<=1'b1;
   addA48_valid<=1'b1;
   addB48_valid<=1'b1;
   
       
   if(addA33_valid)
       begin
           adder_l2_en<=1'b1;
           add49_ready<=1'b1;
           add50_ready<=1'b1;
           add51_ready<=1'b1;
           add52_ready<=1'b1;
           add53_ready<=1'b1;
           add54_ready<=1'b1;
           add55_ready<=1'b1;
           add56_ready<=1'b1;
           
            addA49<=add33_res;
            addB49<=add34_res;
            addA50<=add35_res;
            addB50<=add36_res;
            addA51<=add37_res;
            addB51<=add38_res;
            addA52<=add39_res;
            addB52<=add40_res;
            addA53<=add41_res;
            addB53<=add42_res;
            addA54<=add43_res;
            addB54<=add44_res;
            addA55<=add45_res;
            addB55<=add46_res;
            addA56<=add47_res;
            addB56<=add48_res;
           
       end
end



always@(posedge clk && adder_l2_en)
begin
   //multiply 9 values
   addA49_valid<=1'b1;
   addB49_valid<=1'b1;
   addA50_valid<=1'b1;
   addB50_valid<=1'b1;
   addA51_valid<=1'b1;
   addB51_valid<=1'b1;
   addA52_valid<=1'b1;
   addB52_valid<=1'b1;
   addA53_valid<=1'b1;
   addB53_valid<=1'b1;
   addA54_valid<=1'b1;
   addB54_valid<=1'b1;
   addA55_valid<=1'b1;
   addB55_valid<=1'b1;
   addA56_valid<=1'b1;
   addB56_valid<=1'b1;
       
   if(addA49_valid)
       begin
           adder_l3_en<=1'b1;
           add57_ready<=1'b1;
           add58_ready<=1'b1;
           add59_ready<=1'b1;
           add60_ready<=1'b1;
      
            addA57<=add49_res;
            addB57<=add50_res;
            addA58<=add51_res;
            addB58<=add52_res;
            addA59<=add53_res;
            addB59<=add54_res;
            addA60<=add55_res;
            addB60<=add56_res;
            
       end
end


always@(posedge clk && adder_l3_en)
begin
   //multiply 9 values
   addA57_valid<=1'b1;
   addB57_valid<=1'b1;
   addA58_valid<=1'b1;
   addB58_valid<=1'b1;
   addA59_valid<=1'b1;
   addB59_valid<=1'b1;
   addA60_valid<=1'b1;
   addB60_valid<=1'b1;
   
   if(addA57_valid)
       begin
           adder_l4_en<=1'b1;
           add61_ready<=1'b1;
           add62_ready<=1'b1;
           
           addA61<=add57_res;
	   addB61<=add58_res;
	   addA62<=add59_res;
	   addB62<=add60_res;
            
       end
end

always@(posedge clk && adder_l4_en)
begin
   //multiply 9 values
   addA61_valid<=1'b1;
   addB61_valid<=1'b1;
   addA62_valid<=1'b1;
   addB62_valid<=1'b1;
   
   if(addA61_valid)
       begin
           adder_l5_en<=1'b1;
           add63_ready<=1'b1;
          
            addA63<=add61_res;
            addB63<=add62_res;
       end
end


always@(posedge clk && adder_l5_en)
begin
    addA63_valid<=1'b1;
    addB63_valid<=1'b1;
    
    if(add63_valid)
        begin
             Output_BRAM_we<=2'b11;
             Output_write_data[15:0]<=add63_res;
        end        
end

    
endmodule
//1794