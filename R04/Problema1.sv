// Iasmim Maria Freire Da Silva Torres - 121110942
// Problema 01 - Registrador Paralelo/Serial

module Registrador_4bits (
  input clk, reset, Din_serie, SEL,
  input [3:0] Din,
  output reg [3:0] Dout
);

  reg [3:0] armazenamento_paralelo; // Registrador para armazenamento paralelo
  reg [3:0] shift_register; // Registrador para armazenamento serial
  always @(posedge clk) begin
    if (reset) begin
      armazenamento_paralelo <= 4'b0;
      shift_register <= 4'b0;
    end else if (SEL == 1'b0) begin // Modo de armazenamento paralelo
      armazenamento_paralelo <= Din;
      Dout <= armazenamento_paralelo;
    end else begin // Modo de armazenamento serial
      shift_register <= {shift_register[2:0], Din_serie};
      Dout <= shift_register[3];
    end
  end

endmodule
