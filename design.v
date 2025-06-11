// Code your design here
module right_shift_register (
							input wire clk, rst,
  							input wire load,
  							input wire [3:0] d,
  							input wire shift_en,  // Shift enable
    						output reg [3:0] q    // Output register
							);
 wire xor_out;
  xor1 xt (.a(q[0]), .b(q[1]), .out(xor_out));
  always @ (posedge clk)
    begin
      if(rst)
        begin
          q <= 4'b0000;
        end
      else if (load)
        begin
          q <= d;
        end
      else if(shift_en)
        begin
          q <= {xor_out, q[3:1]};
        end
    end
endmodule

module xor1 (input wire a,b, output reg out);
  assign out = (~a&b) | (a&~b);
endmodule
