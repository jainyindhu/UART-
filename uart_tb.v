// Testbench for UART Transmitter and Receiver

`timescale 1ns/1ps

module uart_tb;

reg clk;
reg reset;

reg tx_start;
reg [7:0] tx_data;

wire tx;
wire tx_busy;

wire [7:0] rx_data;
wire rx_done;

// UART Transmitter
uart_tx #(
    .CLK_PER_BIT(4)
) transmitter (
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_busy(tx_busy)
);

// UART Receiver
uart_rx #(
    .CLK_PER_BIT(4)
) receiver (
    .clk(clk),
    .reset(reset),
    .rx(tx),
    .rx_data(rx_data),
    .rx_done(rx_done)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    // Generate waveform
    $dumpfile("waveform.vcd");
    $dumpvars(0, uart_tb);

    clk = 0;
    reset = 1;
    tx_start = 0;
    tx_data = 8'b0;

    #20;
    reset = 0;

    // Transmit character 'A'
    #20;
    tx_data = 8'h41;
    tx_start = 1;

    #10;
    tx_start = 0;

    // Wait for transmission and reception
    wait(rx_done);

    #10;

    $display("--------------------------------");
    $display("UART Simulation Result");
    $display("--------------------------------");
    $display("Transmitted Data : %h", tx_data);
    $display("Received Data    : %h", rx_data);
    $display("Received ASCII   : %c", rx_data);

    if (tx_data == rx_data)
        $display("STATUS           : PASS");
    else
        $display("STATUS           : FAIL");

    $display("--------------------------------");

    #20;
    $finish;

end

endmodule