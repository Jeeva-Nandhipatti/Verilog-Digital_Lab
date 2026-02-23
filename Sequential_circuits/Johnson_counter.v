//---------------------
//		DESIGN
//---------------------

module johnson_counter (
  input wire clk,			//clock siganl
  input wire rst,			//reset signal
  input wire en,			//enable signal
  output reg [3:0] count
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 4'b0000;
    end else if (en) begin
      //shift and complement the feedback
      count <= {~count[0], count[3:1]};
    end
  end
  
endmodule

//---------------------
//		TESTBENCH
//---------------------

module tb_johnson_counter;
  reg clk, rst, en;s
  wire [3:0] count;
    
  johnson_counter dut (.clk(clk), .rst(rst), .en(en), .count(count));
    
  always #5 clk = ~clk;
    
  initial begin
    clk = 0; 
    rst = 0; 
    en = 0;
        
    $display("Testing Johnson Counter...");
        
    rst = 1; #10; rst = 0; #10;
    en = 1; #200;
    $finish;
  end
    
  always @(posedge clk) begin
    $display("Johnson Count: %b", count);
  end
  
endmodule
