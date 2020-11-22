//`include "ALU.v"
//`include "buffer.v"
//`include "FF_D.v"

module proyecto (input clk, reset, enBuff1, enBuff2, enAccu,
             input [2:0] F,
             input [3:0] busInput,
             output C,Z,
             output [3:0] busOutput, accu);

    wire [3:0] data_bus, aluResult;

    buffer U1(enBuff1, busInput, data_bus);
    buffer U2(enBuff2, aluResult, busOutput);
    ALU U3(.A(accu), .B(data_bus), .F(F), .C(C), .Z(Z), .S(aluResult));
    
    FF_D U4(clk, reset, enAccu, aluResult, accu);

endmodule
