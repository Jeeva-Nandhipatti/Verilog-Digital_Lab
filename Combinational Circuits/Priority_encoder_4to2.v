//--------------------------------------
//   DESIGN - Priority_encoder_4to2.v
//--------------------------------------

module priority_encoder_4to2 (
  input  [3:0] in,			//4 input lines
  output reg [1:0] y,		//2 output lines
  output reg valid);		//Valid

  always @(*) begin
    casex (in)		//casex treats 'x' as don't-care
      4'b1xxx: begin y = 2'b11; valid = 1'b1; end
      4'b01xx: begin y = 2'b10; valid = 1'b1; end
      4'b001x: begin y = 2'b01; valid = 1'b1; end
      4'b0001: begin y = 2'b00; valid = 1'b1; end
      default: begin y = 2'b00; valid = 1'b0; end
    endcase
  end

endmodule

//--------------------------------------
//TESTBENCH - Priority_encoder_4to2_tb.v
//--------------------------------------

module priority_encoder_4to2_tb;
  reg [3:0] in;
  wire [1:0] y;
  wire valid;
  
  priority_encoder_4to2 dut (.in(in),.y(y),.valid(valid));
  
  initial begin
    
    //Test case 1: No input active
    in = 4'b0000; #10 $display("i = %b, y = %b, Valid = %b",in,y,valid);
    $display("-------------------------------------------------------------------------\n");

    
    //Test case 2: Single inputs (lowest to highest priority)
    in= 4'b0001; #10 $display("i = %b, y = %b, Valid = %b",in,y,valid);		//in[0] active
    in= 4'b0010; #10 $display("i = %b, y = %b, Valid = %b",in,y,valid);		//in[1] active
    in= 4'b0100; #10 $display("i = %b, y = %b, Valid = %b",in,y,valid);		//in[2] active
    in= 4'b1000; #10 $display("i = %b, y = %b, Valid = %b",in,y,valid);		//in[3] active
    $display("-------------------------------------------------------------------------\n");
    
    //Test case 3: Multiple inputs - highest priority should win
    in = 4'b0011; #10; $display("i = %b, y = %b, Valid = %b",in,y,valid);  //in[1] and in[0] -> in[1] should win
    in = 4'b0110; #10; $display("i = %b, y = %b, Valid = %b",in,y,valid);  //in[2] and in[1] -> in[2] should win
    in = 4'b1100; #10; $display("i = %b, y = %b, Valid = %b",in,y,valid);  //in[3] and in[2] -> in[3] should win
    in = 4'b1010; #10; $display("i = %b, y = %b, Valid = %b",in,y,valid);  //in[3] and in[1] -> in[3] should win
    $display("-------------------------------------------------------------------------\n");

    
    //Test case 4: All inputs active
    in = 4'b1111; #10 $display("i = %b, y = %b, Valid = %b",in,y,valid);
    #10;
    $finish;
  end
endmodule
