// Iasmim Maria Freire da Silva Torres - 121110942
// Problema 4 - Detector de Sequência

module DetectorSequencia(
  input logic clk,
  input logic reset,
  input logic l1,
  input logic l2,
  input logic l3,
  output logic alarme
);

  // Declaração dos estados da máquina de estados
  enum logic [1:0] {S0, S1, S2, S3} state;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0; // Estado inicial quando reset é ativado
    end else begin
      case (state)
        S0:
          begin
            if (l1) begin
              state <= S1; // Transição para o próximo estado (S1) se l1 acender
            end
          end
        S1:
          begin
            if (l2) begin
              state <= S2; // Transição para o próximo estado (S2) se l2 acender
            end else if (l1) begin
              state <= S1; // Permanecer no estado atual (S1) se l1 acender novamente
            end else begin
              state <= S0; // Voltar ao estado inicial (S0) se l1 apagar
            end
          end
        S2:
          begin
            if (l3) begin
              state <= S3; // Transição para o próximo estado (S3) se l3 acender
            end else if (l2) begin
              state <= S2; // Permanecer no estado atual (S2) se l2 acender novamente
            end else begin
              state <= S0; // Voltar ao estado inicial (S0) se l2 apagar
            end
          end
        S3:
          begin
            if (l1) begin
              state <= S1; // Transição para o estado S1 se l1 acender novamente
            end else if (l2) begin
              state <= S2; // Transição para o estado S2 se l2 acender novamente
            end else if (l3) begin
              state <= S3; // Permanecer no estado atual (S3) se l3 acender novamente
            end else begin
              state <= S0; // Voltar ao estado inicial (S0) se todas as lâmpadas apagarem
            end
          end
      endcase
    end
  end

  always_comb begin
    alarme = (state == S3); // Ativar o alarme quando o estado S3 for alcançado
  end

endmodule
