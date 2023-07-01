// Iasmim Maria Freire da Silva Torres - 121110942
// Problema 3 Memória RAM ROM

module RamRom(
  input logic clk,
  input logic [1:0] Addr,
  output logic [3:0] Dout
);

  logic [3:0] mem [0:(1<<2)-1];

  always_ff@(posedge clk) begin
    Dout <= mem[Addr];
  end

  // ROM Initialization
  initial begin
    mem[0] = 4'b0100;
    mem[1] = 4'b1100;
    mem[2] = 4'b0110;
    mem[3] = 4'b0111;
  end

  // RAM Write
  always_ff@(posedge clk) begin
    if (wr_en) mem[Addr] <= wdata;
  end

endmodule
