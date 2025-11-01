module reg8_mux_dff(
  input wire clk, rstn, en,
  input wire [7:0] d,
  output reg [7:0] q
);
  wire [7:0] d_in;

  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : gen_mux
      assign d_in[i] = en ? d[i] : q[i];
    end
  endgenerate

  always @(posedge clk or negedge rstn) begin
    if (!rstn)
      q <= 8'b0;
    else
      q <= d_in;
  end
endmodule