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


module compare_only(
clk,
Output_write_data,
Output_BRAM_we,
enable_conv,
conv_concat
    );

input enable_conv;
input [31:0] conv_concat;
input clk;
output reg [1:0] Output_BRAM_we;
output reg [15:0] Output_write_data;

reg [15:0] temp_variable1;
reg [15:0] temp_variable2;

reg [15:0] temp_variable11;
reg [15:0] temp_variable21;
reg [15:0] temp_variable12;
reg [15:0] temp_variable22;
reg [15:0] temp_variable13;
reg [15:0] temp_variable23;
reg [15:0] temp_variable14;
reg [15:0] temp_variable24;
reg [15:0] temp_variable15;
reg [15:0] temp_variable25;

reg enable_conv_reg;
reg [15:0] conv_values [0:1];

always@(*) begin
    conv_values[0] <= conv_concat[15:0];
    conv_values[1] <= conv_concat[31:16];
end


always@(posedge clk) begin
    temp_variable11 <= temp_variable1;
    temp_variable21 <= temp_variable2;
    temp_variable12 <= temp_variable11;
    temp_variable22 <= temp_variable21;
    temp_variable13 <= temp_variable12;
    temp_variable23 <= temp_variable22;
    temp_variable14 <= temp_variable13;
    temp_variable24 <= temp_variable23;
    temp_variable15 <= temp_variable14;
    temp_variable25 <= temp_variable24;
end

wire [7:0] comp1_res;
reg comp1_ready;
wire comp1_valid;
reg [15:0] compA1;
reg [15:0] compB1;
wire compA1_ready;
reg compA1_valid;
wire compB1_ready;
reg compB1_valid;
    
        comparator_pool1 comp_1(
        .M_AXIS_RESULT_tdata(comp1_res),
        .M_AXIS_RESULT_tready(comp1_ready),
        .M_AXIS_RESULT_tvalid(comp1_valid),
        .S_AXIS_A_tdata(compA1),
        .S_AXIS_A_tready(compA1_ready),
        .S_AXIS_A_tvalid(compA1_valid),
        .S_AXIS_B_tdata(compB1),
        .S_AXIS_B_tready(compB1_ready),
        .S_AXIS_B_tvalid(compB1_valid),
        .aclk(clk));        
        
initial 
            begin 
            
                enable_conv_reg <= 1'b0;
                Output_BRAM_we<=2'd0;
                //initialise multipliers        
                comp1_ready<=1'b0;                
                compA1_valid<=1'b0;        
                compB1_valid<=1'b0;
                                  
            end

always@(posedge clk) begin                  
 if( enable_conv  == 1'b1 )
                        begin
                        //  Input_update_enable<=1'b0;
                        enable_conv_reg <=1'b1;
                        //   curr_state<=18'd3;
                        comp1_ready<=1'b1;
                        compA1<=conv_values[0];
                        compB1<=conv_values[1];
                        temp_variable1<=conv_values[0];
                        temp_variable2<=conv_values[1];                                     
                        end 
end 
        //enable multiplication
 always@(posedge clk && enable_conv_reg)
 begin
    //multiply 9 values
    compA1_valid<=1'b1;
    compB1_valid<=1'b1;
        
    if(comp1_valid)
        begin
            Output_BRAM_we<=2'b11;
            if(comp1_res == 8'd1) begin
                Output_write_data[15:0] <= temp_variable25;
            end else begin
                Output_write_data[15:0] <= temp_variable15;
            end 
            //Output_write_data[15:0]<=comp1_res;
        end
end
    
endmodule