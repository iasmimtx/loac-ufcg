// Iasmim Maria Freire da Silva Torres - 121110942
// Problema 1 – Contador Up/Down

module ContadorUpDown (
  input logic clk,
  input logic reset,
  input logic count_up, // Entrada de seleção de contagem (1 para crescente, 0 para decrescente)
  output reg [3:0] count // Saída do contador de 4 bits em hexadecimal
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 4'h0; // Valor inicial do contador quando reset é ativado
    end else begin
      if (count_up) begin
        if (count == 4'hF) begin
          count <= 4'h0; // Incrementar até 15 (0xF) e depois reiniciar em 0
        end else begin
          count <= count + 1; // Incrementar contador
        end
      end else begin
        if (count == 4'h0) begin
          count <= 4'hF; // Decrementar até 0 e depois reiniciar em 15 (0xF)
        end else begin
          count <= count - 1; // Decrementar contador
        end
      end
    end
  end

endmodule
