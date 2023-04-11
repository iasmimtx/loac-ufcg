// Iasmim Maria Freire da Silva Torres - 121110942
// Roteamento
module roteamento(
  input logic [3:0] A, B, 
  input logic SEL,         
  output logic [3:0] SAIDA 
);
  always_comb begin
    if(SEL == 0)
      SAIDA <= A;
    else
      SAIDA <= B;
  end
endmodule