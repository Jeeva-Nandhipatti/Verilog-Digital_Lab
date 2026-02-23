//---------------------
//		DESIGN
//---------------------

module d_flip_flop(
    input clk,      //Clock
    input rst,      //Reset
    input d,        //Data
    output reg q);  //output

// D Flip-Flop behavior
  always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;			// Reset condition - output goes to 0
    else
        q <= d;				// On rising clock edge, capture input D
  end
  
endmodule

//---------------------
//		TESTBENCH
//---------------------

module d_flip_flop_tb;
    reg clk;
    reg rst;
    reg d;
    wire q;
    
    d_flip_flop dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q));
    
    always #5 clk = ~clk;
    
    initial begin
      $monitor("clk = %b | rst = %b | d = %b | q = %b",clk, rst, d, q);
    end
    
    initial begin
        clk = 0;
        d = 0;
        rst=0;
        
        #5 rst = 1;
      @(posedge clk) rst = 0;
        
        @(posedge clk) d = 1;
        @(posedge clk) d = 0;
        @(posedge clk) d = 1;
        @(posedge clk) d = 1;
        @(posedge clk) d = 0;
      #20 $finish;
    end
    
endmodule
