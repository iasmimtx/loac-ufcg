// Iasmim Maria Freire da Silva Torres - 121110942
// comparador de 2 números de 8 bits
module circuit(
  input logic [7:0]A, B,
  output logic S
);
  always_comb begin 
    S <= &(~(A ^ B));
    end
    
endmodule