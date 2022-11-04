`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI ECE 3829 A22
// Engineer: KRISH PATEL
// 
// Create Date: 09/01/2022 08:26:04 AM
// Design Name: 
// Module Name: seven_seg
// Project Name: ECE 3829 LAB 1
// Target Devices: BASYS 3 BOARD
// Tool Versions: 
// Description: Takes the calculations, decodes them, and displays it to the Seven Segment Display
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_seg(
    input [3:0] displayA, //Data to be shown on DisplayA
    input [3:0] displayB, //Data to be shown on DisplayB
    input [3:0] displayC, //Data to be shown on DisplayC
    input [3:0] displayD, //Data to be shown on DisplayD
    input [3:0] button, //Button inputs
    output reg [6:0] sevenSegmentDisplay, //Seven segment display LED input
    output reg [3:0] sevenSegmentEnable //Seven segment display enable
    );
    
    reg [3:0] currentDisplay = 4'b0000; //Current data that will be displayed to the board.
    
    always @ (*) //MUX - Shows the data to the display of choice based off the button pressed
        case (button)
            4'b0001: begin
                currentDisplay = displayD;
            end
            4'b0010: begin
                currentDisplay = displayC;
            end
            4'b0100: begin
                currentDisplay = displayB;
            end
            4'b1000: begin
                currentDisplay = displayA;
            end
            default: currentDisplay = 4'b1111;
        endcase
    
    always @ (*) //MUX - Actually enables the display based off of the button pressed
        case (button)
            4'b0001: begin
                sevenSegmentEnable = 4'b1110;
            end
            4'b0010: begin
                sevenSegmentEnable = 4'b1101;
            end
            4'b0100: begin
                sevenSegmentEnable = 4'b1011;
            end
            4'b1000: begin
                sevenSegmentEnable = 4'b0111;
            end
            default: sevenSegmentEnable = 4'b1111;
        endcase
    
    always @ (*) begin //DECODER - Converts said data from the first case to the seven segment display ready output
        case (currentDisplay)
            4'h0: sevenSegmentDisplay = 7'b1000000;
            4'h1: sevenSegmentDisplay = 7'b1111001;
            4'h2: sevenSegmentDisplay = 7'b0100100;
            4'h3: sevenSegmentDisplay = 7'b0110000;
            4'h4: sevenSegmentDisplay = 7'b0011001;
            4'h5: sevenSegmentDisplay = 7'b0010010;
            4'h6: sevenSegmentDisplay = 7'b0000010;
            4'h7: sevenSegmentDisplay = 7'b1111000;
            4'h8: sevenSegmentDisplay = 7'b0000000;
            4'h9: sevenSegmentDisplay = 7'b0011000;
            4'hA: sevenSegmentDisplay = 7'b0001000; //A
            4'hB: sevenSegmentDisplay = 7'b0000011; //B
            4'hC: sevenSegmentDisplay = 7'b1000110; //C
            4'hD: sevenSegmentDisplay = 7'b0100001; //D
            4'hE: sevenSegmentDisplay = 7'b0000110; //E
            4'hF: sevenSegmentDisplay = 7'b0001110; //F
        endcase
    
    end     
endmodule
