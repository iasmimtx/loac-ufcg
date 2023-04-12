// Iasmim Maria Freire da Silva Torres - 12110942
module elevador(
	input logic M,
  				A1,
  				A2,
  				A3,
	output logic P);
  always_comb P <= ~M & (A1 | A2 | A3);
endmodule