`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI ECE 3829 A22
// Engineer: KRISH PATEL
// 
// Create Date: 09/01/2022 08:56:24 AM
// Design Name: 
// Module Name: lab1_top
// Project Name: ECE 3829 LAB 1
// Target Devices: BASYS 3 BOARD
// Tool Versions: 
// Description: TOP MODULE FOR LAB 1. DOES THE ASSIGNMENTS OF BUTTONS, SWITCHES, DISPLAY, AND LED
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab1_top(
    input [15:0] sw, //Switches 0-15
    input btnU, //UP button
    input btnL, //LEFT button
    input btnR, //RIGHT button
    input btnD, //DOWN button
    output [15:0] led, //LED 0-15
    output [6:0] seg, //SEVEN SEGMENT DISPLAY LED 0-6
    output [3:0] an //SEVEN SEGMENT DISPLAY ENABLE 0-3
    );
    
    wire [3:0] displayA, displayB, displayC, displayD; // Current data to display
    wire [3:0] btn; //four options for the buttons
    assign btn[0] = btnD;
    assign btn[1] = btnR;
    assign btn[2] = btnU;
    assign btn[3] = btnL;
    
    //INSTANTIATIONS
    input_select input_select_1 (.mode(sw[15:14]), .slider(sw[13:0]), .displayAoutput(displayA), .displayBoutput(displayB), .displayCoutput(displayC), .displayDoutput(displayD));
    seven_seg seven_seg_1 (.displayA(displayA), .displayB(displayB), .displayC(displayC), .displayD(displayD), .button(btn), .sevenSegmentDisplay(seg), .sevenSegmentEnable(an));
    
    assign led[15:0] = sw[15:0];
endmodule
