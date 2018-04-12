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


module add_only_inter(
clk,
//Output_curr_col,
//Output_curr_row,
//Output_write_addr_reg,
Output_write_data,
Output_BRAM_we,
enable_conv,
conv_concat
    );

input enable_conv;
input [79:0] conv_concat;
input clk;
output reg [1:0] Output_BRAM_we;
//output reg [17:0] Output_curr_col;
//output reg [17:0] Output_curr_row;
//output reg [17:0] Output_write_addr_reg;
output reg [15:0] Output_write_data;
reg enable_conv_reg;
reg [17:0] Output_max_row;
reg [17:0] Output_max_col;
reg [15:0] conv_values [0:4];

always@(*) begin
    conv_values[0] <= conv_concat[15:0];
    conv_values[1] <= conv_concat[31:16];
    conv_values[2] <= conv_concat[47:32];
    conv_values[3] <= conv_concat[63:48];
    conv_values[4] <= conv_concat[79:64];
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

reg adder_l1_en;
reg adder_l2_en;
reg adder_l3_en;
reg adder_l4_en;
    
    
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
        
        
initial 
            begin 
            
                enable_conv_reg <= 1'b0;
                Output_max_row<=18'd5;
                Output_max_col<=18'd5;
                
                Output_BRAM_we<=2'd0;
                ////////////////////////////testing output BRAM ////////////////
                //Output_write_addr_reg<=18'b0;
                //Output_curr_row<=18'b0;
                //Output_curr_col<=18'b0;       
                
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
                        add1_ready<=1'b1;
                        add2_ready<=1'b1;
                        add3_ready<=1'b1;
                        
                        addA1<=conv_values[0];
                        addB1<=conv_values[1];
                                    
                        addA2<=conv_values[2];
                        addB2<=conv_values[3];
                                                
                        addA3<=conv_values[4];
                        addB3<=16'd0;
                                    
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
        
    if(add1_valid&&add2_valid&&add3_valid)
        begin
            adder_l1_en<=1'b1;
            add4_ready<=1'b1;
            add5_ready<=1'b1;
            
            addA4<=add1_res;
            addB4<=add2_res;
            addA5<=add3_res;
            addB5<=16'd0;
        end
end
    
always@(posedge clk && adder_l1_en)
begin
   //multiply 9 values
   addA4_valid<=1'b1;
   addB4_valid<=1'b1;
   addA5_valid<=1'b1;
   addB5_valid<=1'b1;
       
   if(add4_valid&&add5_valid)
       begin
           adder_l2_en<=1'b1;
           add6_ready<=1'b1;
           
           addA6<=add4_res;
           addB6<=add5_res;
       end
end

always@(posedge clk && adder_l2_en)
begin
    addA6_valid<=1'b1;
    addB6_valid<=1'b1;
    
    if(add6_valid)
        begin
             Output_BRAM_we<=2'b11;
             ////////////////////////////////Testing Output BRAM ////////////////////////////
             //Output_write_addr_reg<=(Output_max_row*Output_curr_row)+Output_curr_col;                       
             //Output_curr_col=(Output_curr_col==(Output_max_col-18'd1))?18'd0:(Output_curr_col+18'd1);
             //Output_curr_row=(Output_curr_col==18'd0)?(Output_curr_row+18'd1):Output_curr_row; 
             
             Output_write_data[15:0]<=add6_res;
        end        
end

    
endmodule
