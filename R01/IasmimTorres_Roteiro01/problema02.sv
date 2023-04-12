// Iasmim Maria Freire da Silva Torres - 121110942
parameter NBITS = 8;
module somador(
  //variaveis de entrada em complemento de 2
  input logic signed [NBITS-1:0] A, B,
  //variaveis de saida em complemento de 2
  output logic signed [NBITS-1:0]S,
  output logic N, Z, P
);
  
  always_comb begin
    //faz a soma.
    S <= A + B;
    // verifica se a soma é zero.
    Z <= S == 0;
    // verifica se a soma número é negativo.
    N <= S[NBITS-1];
    // verifica se o número é par.
    P <= S[0] == 0; 
  end

endmodule