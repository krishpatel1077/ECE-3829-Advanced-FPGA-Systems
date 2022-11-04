`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI ECE 3829 A22
// Engineer: KRISH PATEL
// 
// Create Date: 08/31/2022 07:13:58 PM
// Design Name: 
// Module Name: input_select
// Project Name: ECE 3829 LAB 1
// Target Devices: BASYS 3 BOARD
// Tool Versions: 
// Description: Determines the current mode and displays the corresponding output to the Basys 3 Board
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module input_select(
    input [1:0] mode,
    input [13:0] slider,
    output reg [3:0] displayAoutput,
    output reg [3:0] displayBoutput,
    output reg [3:0] displayCoutput,
    output reg [3:0]displayDoutput
    );
    
    wire [5:0] sum = slider[7:4] + slider[3:0]; //Sum of sw[7:4] and sw[3:0], MODE 2
    wire [6:0] multiply = slider[13:8]<<1;
    always @ (*)
        case (mode)
            2'b00: begin //Mode 0, Lasy 4 digits of the WPI ID
                displayAoutput = 2;
                displayBoutput = 6;
                displayCoutput = 2;
                displayDoutput = 7;
            end
            2'b01: begin //Mode 1, Values of the slider switches in hexadecimal
                displayAoutput = slider[13:12];
                displayBoutput = slider[11:8];
                displayCoutput = slider[7:4];
                displayDoutput = slider[3:0];
            end
            2'b10: begin //Mode 2, Hexadeical value of sw[13:12] and sw[11:8] along with the product of sw[7:4] and sw[3:0] by 2
                displayAoutput = slider[13:12];
                displayBoutput = slider[11:8];
                displayCoutput = multiply[6:4];
                displayDoutput = multiply[3:0];
            end
            2'b11: begin //Mode 3, Hexadeical value of sw[7:4] and sw[3:0] along with the sum of sw[7:4] and sw[3:0]
                displayAoutput = slider[7:4];
                displayBoutput = slider[3:0];
                displayCoutput = sum[4];
                displayDoutput = sum[3:0];
            end
        endcase
    
endmodule
