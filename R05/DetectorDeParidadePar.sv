// Iasmim Maria Freire da Silva Torres - 121110942
// Problema 3 - Detector de Paridade Par

module DetectorParidadePar(
  input logic clk,
  input logic reset,
  input logic entrada_serial,
  output logic saida
);
  
  // Declaração dos estados da máquina de estados
  enum logic [1:0] {S0, S1, S2} state;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0; // Estado inicial quando reset é ativado
    end else begin
      case (state)
        S0:
          begin
            if (entrada_serial) begin
              state <= S1; // Transição para o próximo estado (S1) se o bit de entrada for 1
            end
          end
        S1:
          begin
            if (!entrada_serial) begin
              state <= S2; // Transição para o próximo estado (S2) se o bit de entrada for 0
            end
          end
        S2:
          begin
            if (!entrada_serial) begin
              state <= S1; // Transição de volta ao estado anterior (S1) se o bit de entrada for 0
            end
          end
      endcase
    end
  end

  always_comb begin
    if (state == S0) begin
      saida = 1'b0; // Saída é 0 no estado S0
    end else begin
      saida = 1'b1; // Saída é 1 nos estados S1 e S2 (erro de paridade detectado)
    end
  end
endmodule