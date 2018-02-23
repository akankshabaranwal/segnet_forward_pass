`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2018 18:30:28
// Design Name: 
// Module Name: update_address
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


module update_address(
input [17:0] row,
input clk,
input [17:0] col,
input [17:0] max_R,
input [17:0] max_C,
input reset,
input en,
output reg [17:0] addr,
output reg [17:0] row_out,
output reg done,
output reg [17:0] col_out
    );
    
    
    always@(posedge(clk) & en)
         begin
             if(reset)
                 begin
                    addr<=18'd0;
                    col_out<=18'd0;
                    row_out<=18'd0;
                 end
                else
                 begin
                     if( col == (max_C-1))
                           begin
                               col_out <= 18'd0;
                               row_out <= row +18'd1;
                               addr<=(max_C*row_out+col_out);
                           end
                       else
                           begin
                               col_out <= col + 18'd1;
                               row_out <= row;
                               addr<=(max_C*row_out+col_out);
                           end
                   end     
       end       
endmodule