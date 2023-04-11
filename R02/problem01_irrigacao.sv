// Iasmim Maria Freire da Silva Torres - 121110942
// Problema 1: Irrigação
module irrigacao(
  input logic [1:0]U,
  output logic [1:0]Saida
);
  
  always_comb begin
    case(U)
    2'b00: Saida = 2'b00;
  	2'b01: Saida = 2'b01;
  	2'b10: Saida = 2'b10;
  	2'b11: Saida = 2'b11;
    endcase
  end
endmodule

