// Iasmim Maria Freire da Silva Torres - 121110942
// Roteamento letra B
module roteamento(
  input logic [3:0] A, B, C, D,
  input logic [1:0] SEL,
  output logic [3:0] Saida
);

  always_comb begin
    case(SEL)
      2'b00: Saida <= A; // se SEL for 00, retornar o valor da entrada A
      2'b01: Saida <= B; // se SEL for 01, retornar o valor da entrada B
      2'b10: Saida <= C; // se SEL for 10, retornar o valor da entrada C
      2'b11: Saida <= D; // se SEL for 11, retornar o valor da entrada D
    endcase
  end
endmodule