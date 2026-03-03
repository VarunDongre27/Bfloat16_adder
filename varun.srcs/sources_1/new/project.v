module bfloat16_top (
    input wire clk,           // External clock input
    input wire reset,         // Reset signal
    input wire loadA,         // Load A signal
    input wire loadB,         // Load B signal
    input wire add,           // Add operation signal
    input wire sub,           // Subtract operation signal
    input wire [15:0] switches,  // Switch inputs for data
    output reg [15:0] leds    // Output LEDs
);

    wire [15:0] A_reg;        // A register output
    wire [15:0] B_reg;        // B register output
    wire [15:0] result;       // Result of addition or subtraction
    wire overflow;            // Overflow flag
    
    // Store A and B using 16-bit flip-flops
    dff16 regA (
        .clk(clk),
        .reset(reset),
        .enable(loadA),
        .d(switches),
        .q(A_reg)
    );

    dff16 regB (
        .clk(clk),
        .reset(reset),
        .enable(loadB),
        .d(switches),
        .q(B_reg)
    );

    // Output logic: check for overflow and display the result or loaded values
    always @(posedge clk) begin
        // If either A or B is loaded, display the corresponding value
        if (loadA) begin
            leds <= A_reg;  // Display A value on LEDs
        end
        else if (loadB) begin
            leds <= B_reg;  // Display B value on LEDs
        end
        else if (overflow) begin
            leds <= 16'b0111110000000000; // Infinity (sign=0, exp=11111, mantissa=0)
        end
        else begin
            leds <= result; // Display result on LEDs
        end
    end

    // Connect arithmetic unit
    bfloat16_alu alu (
        .A(A_reg),
        .B(B_reg),
        .add(add),
        .sub(sub),
        .result(result),
        .overflow(overflow)
    );

endmodule

module dff16 (
    input wire clk,         // Clock input
    input wire reset,       // Reset input
    input wire enable,      // Enable signal
    input wire [15:0] d,    // Data input
    output reg [15:0] q     // Data output
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 16'd0;  // Reset the value to 0
        else if (enable)
            q <= d;     // Load the data when enabled
    end
endmodule


module bfloat16_alu (
    input wire [15:0] A,
    input wire [15:0] B,
    input wire add,
    input wire sub,
    output reg [15:0] result,
    output reg overflow
);

    wire [15:0] sum_result;
    wire [15:0] sub_result;
    wire sum_ovf, sub_ovf;

    bfloat16_add add_module (
        .A(A),
        .B(B),
        .result(sum_result),
        .overflow(sum_ovf)
    );

    bfloat16_sub sub_module (
        .A(A),
        .B(B),
        .result(sub_result),
        .overflow(sub_ovf)
    );

    always @(*) begin
        if (add) begin
            result = sum_result;
            overflow = sum_ovf;
        end else if (sub) begin
            result = sub_result;
            overflow = sub_ovf;
        end else begin
            result = 16'd0;
            overflow = 0;
        end
    end
endmodule

module bfloat16_add (
    input wire [15:0] A,
    input wire [15:0] B,
    output reg [15:0] result,
    output reg overflow
);
    reg [4:0] exp_A, exp_B, exp_res;
    reg [10:0] man_A, man_B, man_res;
    reg sign_A, sign_B, sign_res;

    always @(*) begin
        sign_A = A[15];
        exp_A = A[14:10];
        man_A = {1'b1, A[9:0]};  // Normalize the mantissa by adding implicit leading 1

        sign_B = B[15];
        exp_B = B[14:10];
        man_B = {1'b1, B[9:0]};  // Normalize the mantissa by adding implicit leading 1

        // Special case for zero (if mantissa and exponent are zero, the result should be zero)
        if (A == 16'b0 && B == 16'b0) begin
            result = 16'b0;
            overflow = 0;
        end

        // Adjust the smaller exponent by shifting the mantissa
        if (exp_A > exp_B) begin
            man_B = man_B >> (exp_A - exp_B);
            exp_res = exp_A;
        end else begin
            man_A = man_A >> (exp_B - exp_A);
            exp_res = exp_B;
        end

        // Perform addition or subtraction based on sign
        if (sign_A == sign_B) begin
            man_res = man_A + man_B;
            sign_res = sign_A;
        end else begin
            if (man_A >= man_B) begin
                man_res = man_A - man_B;
                sign_res = sign_A;
            end else begin
                man_res = man_B - man_A;
                sign_res = sign_B;
            end
        end

        // Check for mantissa overflow and normalize
        if (man_res[11] == 1) begin
            man_res = man_res >> 1;  // Shift mantissa to the right
            exp_res = exp_res + 1;
        end

        // Set overflow flag if exponent exceeds the limit
        if (exp_res >= 5'd31) begin
            overflow = 1;
            result = {sign_res, 5'b11111, 10'b0000000000};  // Infinity case
        end else begin
            overflow = 0;
            result = {sign_res, exp_res, man_res[9:0]};
        end
    end
endmodule

module bfloat16_sub (
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [15:0] result,
    output wire overflow
);
    wire [15:0] B_inv = {~B[15], B[14:0]};  // Invert sign bit for subtraction
    bfloat16_add add_inst (
        .A(A),
        .B(B_inv),
        .result(result),
        .overflow(overflow)
    );
endmodule