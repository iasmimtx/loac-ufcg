// Iasmim Maria Freire da Silva Torres  - 121110942
// Problema 2 – Contador de uma Sequência Qualquer.

module ContadorAnel(
  input logic clk,
  input logic reset,
  output logic [3:0] Count_out
);
  
  // Declaração dos estados da máquina de estados
  enum logic [1:0] {S0, S1, S2, S3} state;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0; // Estado inicial quando reset é ativado
    end else begin
      case (state)
        S0:
          state <= S1; // Transição para o próximo estado (S1)
        S1:
          state <= S2; // Transição para o próximo estado (S2)
        S2:
          state <= S3; // Transição para o próximo estado (S3)
        S3:
          state <= S0; // Transição de volta ao estado inicial (S0)
      endcase
    end
  end

  always_ff @(posedge clk) begin
    case (state)
      S0:
        Count_out <= 4'b0001; // Saída correspondente ao estado S0 (1 em decimal)
      S1:
        Count_out <= 4'b0010; // Saída correspondente ao estado S1 (2 em decimal)
      S2:
        Count_out <= 4'b0100; // Saída correspondente ao estado S2 (4 em decimal)
      S3:
        Count_out <= 4'b1000; // Saída correspondente ao estado S3 (8 em decimal)
    endcase
  end

endmodule
