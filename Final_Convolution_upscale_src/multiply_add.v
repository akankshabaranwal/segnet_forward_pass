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


module multiply_add(
    clk,
    Output_write_data,
    Output_BRAM_we,
    enable_conv,
    filter_full,
    wbuffer_full
    );

input enable_conv;
input [143:0] filter_full;
input [143:0]wbuffer_full;
input clk;
output reg [5:0] Output_BRAM_we;
output reg [15:0] Output_write_data;

reg enable_conv_reg;
reg [15:0] filter [0:2][0:2];
reg [15:0] wbuffer [0:2][0:2];

always@(*) begin
    filter[0][0] <= filter_full[15:0];
    filter[0][1] <= filter_full[31:16];
    filter[0][2] <= filter_full[47:32];
    filter[1][0] <= filter_full[63:48];
    filter[1][1] <= filter_full[79:64];
    filter[1][2] <= filter_full[95:80];
    filter[2][0] <= filter_full[111:96];
    filter[2][1] <= filter_full[127:112];
    filter[2][2] <= filter_full[143:128];
end

always@(*) begin
    wbuffer[0][0] <= wbuffer_full[15:0];
    wbuffer[0][1] <= wbuffer_full[31:16];
    wbuffer[0][2] <= wbuffer_full[47:32];
    wbuffer[1][0] <= wbuffer_full[63:48];
    wbuffer[1][1] <= wbuffer_full[79:64];
    wbuffer[1][2] <= wbuffer_full[95:80];
    wbuffer[2][0] <= wbuffer_full[111:96];
    wbuffer[2][1] <= wbuffer_full[127:112];
    wbuffer[2][2] <= wbuffer_full[143:128];
    
end

reg [15:0]mulA1;
reg [15:0]mulB1;
reg [15:0]mulA2;
reg [15:0]mulB2;
reg [15:0]mulA3;
reg [15:0]mulB3;
reg [15:0]mulA4;
reg [15:0]mulB4;
reg [15:0]mulA5;
reg [15:0]mulB5;
reg [15:0]mulA6;
reg [15:0]mulB6;
reg [15:0]mulA7;
reg [15:0]mulB7;
reg [15:0]mulA8;
reg [15:0]mulB8;
reg [15:0]mulA9;
reg [15:0]mulB9;

reg mul1_ready;
reg mul2_ready;
reg mul3_ready;
reg mul4_ready;
reg mul5_ready;
reg mul6_ready;
reg mul7_ready;
reg mul8_ready;
reg mul9_ready;
 
wire [15:0] mul1_res;
wire mul1_valid;
wire mulA1_ready;
reg mulA1_valid;
wire mulB1_ready;
reg mulB1_valid;

wire [15:0] mul2_res;
wire mul2_valid;
wire mulA2_ready;
reg mulA2_valid;
wire mulB2_ready;
reg mulB2_valid;

wire [15:0] mul3_res;
wire mul3_valid;
wire mulA3_ready;
reg mulA3_valid;
wire mulB3_ready;
reg mulB3_valid;

wire [15:0] mul4_res;
wire mul4_valid;
wire mulA4_ready;
reg mulA4_valid;
wire mulB4_ready;
reg mulB4_valid;

wire [15:0] mul5_res;
wire mul5_valid;
wire mulA5_ready;
reg mulA5_valid;
wire mulB5_ready;
reg mulB5_valid;

wire [15:0] mul6_res;
wire mul6_valid;
wire mulA6_ready;
reg mulA6_valid;
wire mulB6_ready;
reg mulB6_valid;

wire [15:0] mul7_res;
wire mul7_valid;
wire mulA7_ready;
reg mulA7_valid;
wire mulB7_ready;
reg mulB7_valid;

wire [15:0] mul8_res;
wire mul8_valid;
wire mulA8_ready;
reg mulA8_valid;
wire mulB8_ready;
reg mulB8_valid;

wire [15:0] mul9_res;
wire mul9_valid;
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
        
        
     
initial 
            begin 
            
                enable_conv_reg <= 1'b0;
                Output_BRAM_we<=6'd0;       
                
                //initialise adders        
                 
                mulA1_valid<=1'b0;        
                mulB1_valid<=1'b0;
                
                  
                mulA2_valid<=1'b0;        
                mulB2_valid<=1'b0;
                
                  
                mulA3_valid<=1'b0;        
                mulB3_valid<=1'b0;
                
                  
                mulA4_valid<=1'b0;        
                mulB4_valid<=1'b0;
                
                  
                mulA5_valid<=1'b0;        
                mulB5_valid<=1'b0;
                
                  
                mulA6_valid<=1'b0;        
                mulB6_valid<=1'b0;
                
                
                mulA7_valid<=1'b0;        
                mulB7_valid<=1'b0;
                
                  
                mulA8_valid<=1'b0;        
                mulB8_valid<=1'b0;
                
                 
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
                adder_l1_en<=1'b0;
                adder_l2_en<=1'b0;
                adder_l3_en<=1'b0;
                adder_l4_en<=1'b0;                     
            end

always@(posedge clk) begin                  
 if( enable_conv  == 1'b1 )
                        begin
                        //  Input_update_enable<=1'b0;
                        enable_conv_reg <=1'b1;
                        //   curr_state<=18'd3;
                        mulA1<=filter[0][0];
                        mulB1<=wbuffer[0][0][15:0];
                        
                        mulA2<=filter[0][1];
                        mulB2<=wbuffer[0][1][15:0];
                        
                        mulA3<=filter[0][2];
                        mulB3<=wbuffer[0][2][15:0];
                        
                        mulA4<=filter[1][0];
                        mulB4<=wbuffer[1][0][15:0];
                        
                        mulA5<=filter[1][1];
                        mulB5<=wbuffer[1][1][15:0];
                        
                        mulA6<=filter[1][2];
                        mulB6<=wbuffer[1][2][15:0];
                        
                        mulA7<=filter[2][0];
                        mulB7<=wbuffer[2][0][15:0];
                        
                        mulA8<=filter[2][1];
                        mulB8<=wbuffer[2][1][15:0];
                        
                        mulA9<=filter[2][2];
                        mulB9<=wbuffer[2][2][15:0];
                        
                                                
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
 
 
 
        //enable multiplication
 always@(posedge clk && enable_conv_reg)
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
             Output_BRAM_we<=6'b111111;
             Output_write_data[15:0]<=add8_res;
        end        
end

    
endmodule