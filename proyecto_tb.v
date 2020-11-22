module testbench();

    reg clk, reset, buffIn, buffOut, enAccu;
    reg [2:0] F;
    reg [3:0] busInput;
    wire C, Z;
    wire [3:0] busOutput, accu;

    proyecto U1 (clk, reset, buffIn, buffOut, enAccu, F, busInput, C, Z, busOutput, accu);

    always
        #5 clk = ~clk;

    initial
        #200 $finish;

    initial begin
        clk = 0; reset = 0; buffIn = 0; buffOut = 0; enAccu = 0; F = 3'b000; busInput = 4'b0000;
        #2 reset = 1;
        #1 reset = 0;
        #1
        buffIn = 1;
        buffOut = 1;
        enAccu = 1;
        F = 3'b010;
        busInput = 4'b1010;

        #10
        busInput = 4'b0001;
        F = 3'b011;


        #10
        buffOut = 0;

        #8
        buffOut = 1;
        #2
        buffIn = 0;

        #10
        F = 3'b000;

        #10
        buffIn = 1;
        F = 3'b010;
        #5
        F = 3'b000;

        #5
        F = 3'b001;

        #30
        busInput = 4'b0000;
        F = 3'b010;

        #10
        F = 3'b000;

        #10
        enAccu = 0;
        busInput = 4'b0101;
        F = 3'b010;

        #10
        enAccu = 1;

          #10
        busInput = 4'b0101;
        F = 3'b100;

        #10
        buffIn = 0;
        buffOut = 1;
        enAccu = 0;
        F = 3'b000;

    end


    initial begin
        $dumpfile("proyecto_tb.vcd");
        $dumpvars(0, testbench);
    end

endmodule
