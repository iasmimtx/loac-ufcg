// Write your modules here!
parameter n_bits = 8;
module circuit(
  input logic signed [n_bits-1:0] A, B,
  input logic [1:0] F,
  output logic FLAG_O,
  output logic [n_bits-1:0] Saida
);
  always_comb begin
    FLAG_O = 0;
    case(F)
      2'b00: Saida <= A & B;
      2'b01: Saida <= A | B;
      2'b10: begin
        Saida <= A + B;
        if(Saida > 127 && Saida < -128)
          FLAG_O <= 1;
      end
      2'b11: begin
        Saida <= A - B;
        if(Saida > 127 && Saida < -128)
          FLAG_O <= 1;
      end
    endcase
  end
 endmodule