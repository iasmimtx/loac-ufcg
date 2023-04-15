module ULA(input signed [7:0] A,
           input signed [7:0] B, 
           input [1:0] F, 
           output logic signed [7:0] Saida, 
           output logic FLAG_O);

  logic default_FLAG_O = 0; // Valor padrão da variável FLAG_O

  always_comb begin
    case(F)
      2'b00: begin
              Saida <= A & B;
              FLAG_O = default_FLAG_O; // Atualiza a variável FLAG_O em todos os casos
            end
      2'b01: begin
              Saida <= A | B;
              FLAG_O <= default_FLAG_O;
            end
      2'b10: begin
              Saida <= A + B;
              if((A == 127 && B > 0) || (A == -128 && B < 0)) FLAG_O <= 1; // overflow/underflow
              else if(Saida >= 128 || Saida < -128) FLAG_O <= 1; // overflow/underflow
              else FLAG_O <= 0;
            end
      2'b11: begin
              Saida <= A - B;
              if((A == -128 && B < 0) || (A == 127 && B > 0)) FLAG_O <= 1; // overflow/underflow
              else if(Saida >= 128 || Saida < -128) FLAG_O <= 1; // overflow/underflow
              else FLAG_O <= 0;
            end
      default: begin
                Saida = 0; // Valor padrão da saída em caso de seleção inválida
                FLAG_O = default_FLAG_O;
              end
    endcase
  end

endmodule
