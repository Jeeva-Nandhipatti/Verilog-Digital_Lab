//4-bit down counter
//---------------------
//		DESIGN
//---------------------

module down_counter (
    input wire clk,		//clock signal
    input wire rst,		//reset signal
    input wire en,		//enable signal
    output reg [3:0] count,
    output wire underflow);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b1111;  // Start from 15
        end else if (en) begin
            count <= count - 1; // Count down
        end
    end

    assign underflow = (count == 4'b0000) & en;

endmodule

//---------------------
//		TESTBENCH
//---------------------

module tb_down_counter;
    reg clk, rst, en;
    wire [3:0] count;
    wire underflow;
    
  down_counter dut (.clk(clk),.rst(rst),.en(en),.count(count),.underflow(underflow));
    
    always #5 clk = ~clk;
    
    initial begin
      // Initialize
      clk = 0; 
      rst = 0; 
      en = 0;
        
      // Test sequence
      #10 rst = 1;
      #20 rst = 0;
      #10 en = 1;
      #200 $finish;
    end
    
    always @(posedge clk) begin
        $display("Count: %d, Underflow: %b",count, underflow);
    end
  
endmodule
