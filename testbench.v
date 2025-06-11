// Code your testbench here
// or browse Examples
module tb_right_shift_register;

reg clk, rst, load, shift_en;
reg [3:0] d;
wire [3:0] q;

right_shift_register uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .d(d),
    .shift_en(shift_en),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    // Initialize inputs
    rst = 1; load = 0; shift_en = 0; d = 4'b0000;

    // Reset the register
    #10 rst = 0;

    // Load data
    #10 d = 4'b0110; load = 1;
    #10 load = 0;

    // Enable shift
    shift_en = 1;
    #50 shift_en = 0;

    #10 $finish;
end

initial begin
    $monitor("Time = %0t | q = %b", $time, q);
end
  initial
    begin
      $dumpfile ("right_shift_register.vcd");
      $dumpvars (0, tb_right_shift_register);
      
    end

endmodule
