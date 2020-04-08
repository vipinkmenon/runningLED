`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2020 11:45:07 AM
// Design Name: 
// Module Name: runningLed
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


module runningLed(
input clock,
input reset,
input [7:0] initState,
output reg [7:0] led
);

//LEDs should change state once every second
//Clock freq 100MHz -> period is 10ns
//1/10ns = 100000000 clock cycles

reg [30:0] counter;

always @(posedge clock)
begin
    if(counter == 100000000)
        counter <= 0;
    else
        counter <= counter + 1'b1;
end

always @(posedge clock)
begin
    if(reset)
        led <= initState;
    else if(counter == 100000000)
        led[7:0] <= {led[0],led[7:1]};
end




endmodule
