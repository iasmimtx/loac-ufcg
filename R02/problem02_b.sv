// Iasmim Maria Freire da Silva Torres - 121110942
// Roteamento letra B
module roteamento(
  input logic [3:0] A, B, C, D,
  input logic [1:0] SEL,
  output logic [3:0] Saida
);

  always_comb begin
    case(SEL)
      2'b00: Saida = A;
      2'b01: Saida = B;
      2'b10: Saida = C;
      2'b11: Saida = D;
    endcase
  end

endmodule